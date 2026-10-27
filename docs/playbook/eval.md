# Eval guide

Eval (evaluation) là việc chạy phần AI trên một tập ca có đáp án hoặc tiêu chí chấm, để đo hành vi và chất lượng.
Trang này giải thích các default của playbook. Lựa chọn của dự án ghi trong [eval plan](../../eval/plan.md).

## Defaults

| Topic | Default | Phase |
|---|---|---|
| Failure modes | 3–5 lỗi nặng nhất mà phần AI có thể gây ra, ghi ở mục Risks của brief | 1 |
| Method | Chọn metric, scorer, loại dataset và cách chia tập | 2 |
| Golden set | 50–100 ca từ mẫu thật và failure mode, chia thành dev set và test set | 3 |
| Test set | Freeze trước khi build; chỉ QA/Eval chạy, và chỉ chạy ở release gate | 3–4 |
| Eval runner | Task đầu tiên khi build, vì phải có trước phần nó đo | 4 |
| Production errors | Vào dev set ngay; vào test set ở version mới | 5 |

## Metrics

Bắt đầu từ việc người dùng cần làm và hậu quả khi AI sai, sau đó mới chọn metric. Mỗi metric trong eval plan có:

- **Definition:** đo cái gì, tính trên đơn vị nào.
- **Scorer:** ai hoặc cái gì chấm, theo bảng dưới.
- **Threshold:** lấy từ Quality targets của PRD hoặc từ một luật nghiệp vụ.
- **Source:** dẫn tới PRD, `BR-xxx` hoặc brief.

| Scorer | Use when | Watch out |
|---|---|---|
| Code: exact match, schema, regex | Đáp án xác định: mã đơn, số tiền, định dạng | Không chấm được văn phong hay độ đúng ý |
| LLM judge | Tiêu chí cần đọc hiểu: đúng ý, đủ thông tin, giọng văn | Cần rubric; người chấm lại một phần mẫu để kiểm judge có khớp người không |
| Người chấm | Rubric khó viết, hoặc rủi ro cao | Chậm và đắt; nhãn dễ bất đồng thì cần hai người chấm |

Không phải metric nào cũng chặn release. Latency và chi phí thường là ngân sách cần theo dõi; độ đúng và an toàn
thường là ngưỡng chặn.

## By system type

| System | Also measure |
|---|---|
| Một lần gọi LLM | Định dạng đầu ra; độ lệch giữa các lần chạy; hành vi khi provider lỗi |
| RAG | Retrieval có lấy đúng tài liệu không; câu trả lời có dựa trên nguồn không; khi không có nguồn thì trả lời gì |
| Agent có tool | Chọn đúng tool và tham số; không vượt quyền; xử lý khi tool lỗi hoặc bị gọi lặp |
| Fine-tune hoặc train | Leakage giữa các tập; chất lượng nhãn; so với baseline chưa train |
| Batch | Chất lượng theo từng nhóm dữ liệu; dữ liệu thiếu; throughput |

Chỉ thêm kịch bản tấn công cho bề mặt có thật: prompt injection khi LLM đọc nội dung không tin cậy, vượt quyền khi hệ
thống có tool hoặc dữ liệu được bảo vệ. Biện pháp chống nằm ở mục Guardrails của
[AI architecture](../architecture/ai.md).

## Datasets

- **Dev set:** dùng để tinh chỉnh prompt và model; cả nhóm xem và chạy được.
- **Test set:** dùng để kết luận ở release gate; không ai tinh chỉnh dựa trên nó. Ca nào đã bị xem để sửa prompt thì
  hết độc lập và được bỏ khỏi test set ở version sau. Ca viết lại từ ca đó cũng không còn độc lập.
- **Split:** dữ liệu gắn với người dùng, tổ chức hoặc thời gian thì chia theo nhóm đó, để hai tập không chia sẻ thông
  tin với nhau.
- **Labels:** người rà nhãn khác người dựng ca. Nhãn dễ bất đồng thì cần hai người chấm, và eval plan ghi cách phân xử.
- **Provenance:** mỗi ca ghi nguồn; dữ liệu do AI sinh đánh dấu `synthetic`.
- **Privacy:** chỉ commit dữ liệu đã được phép đưa vào repo và đã ẩn danh; kiểm khả năng nhận diện lại trước khi commit.
  Được phép dùng dữ liệu để eval không có nghĩa là được phép commit dữ liệu đó.

## Runs

- PR đụng prompt, model, retrieval hoặc tool thì chạy eval trên dev set, ghi kết quả trước và sau vào PR.
- Unit test mock LLM để kiểm logic; eval gọi model thật. Hai loại không thay thế nhau.
- LLM không tất định. Eval plan ghi số lần chạy lặp và độ lệch cho phép; hai kết quả lệch nhau ít hơn mức đó thì coi
  như bằng nhau.
- Ghim model version nếu provider hỗ trợ. Nếu không, ghi model ID và ngày chạy, và chạy lại dev set khi provider báo
  đổi model.

## Reporting

Mỗi kết quả ghi commit, version prompt và model, dataset và version, scorer, kết quả từng metric, chi phí chạy và giới
hạn. Khi so trước và sau, giữ nguyên dataset và cách chấm; có gì khác thì ghi rõ. Phân biệt kết quả vừa chạy với kết
quả cũ chép lại. Ngưỡng dự kiến hay một ví dụ chạy tốt không phải bằng chứng là đã đạt.

## Variations

- PoC: smoke set 10–20 ca, không cần test set riêng; báo kết quả là `demo`.
- Chưa đủ dữ liệu để đặt ngưỡng: ghi eval là exploratory, chốt ngưỡng sau milestone đầu.
- ADR-0001 chọn rule-based hoặc không dùng AI: bỏ eval plan, dùng test thông thường.

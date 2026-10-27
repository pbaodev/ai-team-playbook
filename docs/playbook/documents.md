# Documents

Danh mục tài liệu của dự án, quy ước chung của các mẫu và cách viết. Người và agent tra trang này để biết một thông
tin nằm ở đâu.

## Map

Mỗi thông tin có một nơi chính. Nơi khác cần thì dẫn link hoặc mã, không chép lại.

| Document | Answers | Owner | Phase |
|---|---|---|---|
| [team.md](../team.md) | Ai giữ vai nào, dùng công cụ gì, làm khác default ở đâu | Product | 0 |
| [brief.md](../brief.md) | Có nên làm không, làm theo hướng nào | Product | 1 |
| [request.md](../discovery/request.md) | Yêu cầu gốc và các lần bổ sung | Product | 1 |
| [questions.md](../discovery/questions.md) | Điều chưa biết, assumption và câu trả lời | Product | 1 trở đi |
| [decisions/](../decisions/README.md) | Vì sao chọn phương án này, đã cân nhắc phương án nào | Tech Lead, AI/ML | 1 trở đi |
| [domain.md](../domain.md) | Thuật ngữ, luật nghiệp vụ, dữ liệu, edge case | Product | 2 |
| [ARCHITECTURE.md](../../ARCHITECTURE.md) | Hệ thống gồm gì, dữ liệu đi đâu | Tech Lead | 2 |
| [backend](../architecture/backend.md), [frontend](../architecture/frontend.md), [AI](../architecture/ai.md) | Chi tiết từng phần, khi ARCHITECTURE chưa đủ | Tech Lead, UX, AI/ML | 2 |
| [ui-flow.md](../ui-flow.md) | Người dùng thấy và làm gì trên từng màn hình | UX | 2 |
| [conventions/](../conventions/README.md) | Quy tắc code mà máy không tự kiểm được | Tech Lead | 2 trở đi |
| [prd.md](../prd.md) | Bản này làm gì, thế nào là đạt | Product | 3 |
| [SPEC.md](../SPEC.md) | Hệ thống phải hoạt động thế nào; tài liệu chính khi làm task | Tech Lead | 3 |
| [eval/plan.md](../../eval/plan.md) | Đo AI bằng gì, ngưỡng nào, chạy khi nào | QA/Eval | 3 |
| [Task](../../.github/ISSUE_TEMPLATE/task.md), [Bug](../../.github/ISSUE_TEMPLATE/bug.md), [CR](../../.github/ISSUE_TEMPLATE/change_request.md), [Experiment](../../.github/ISSUE_TEMPLATE/experiment.md), [PR](../../.github/PULL_REQUEST_TEMPLATE.md) | Công việc, thay đổi và bằng chứng | Người làm | 3 trở đi |

`docs/playbook/` là hướng dẫn của template. Mọi file khác trong `docs/`, cùng `ARCHITECTURE.md` và `eval/`, là tài liệu
của dự án. Bảng Project types trong [README](README.md) cho biết loại dự án nào cần tài liệu nào.

## Template conventions

- **Header:** Status, Owner, Updated, Related, nằm ngay dưới tiêu đề.
- **Status:** tài liệu dùng `Draft`, `Accepted`, `Superseded`; ADR dùng thêm `Proposed` và `Rejected`. Chỉ `Accepted`
  là đã chốt. Mục còn trống, dòng ví dụ, tài liệu `Draft` hoặc `Proposed` đều chưa phải quyết định.
- **Guidance:** một blockquote ở đầu mẫu, nói khi nào điền và điền thế nào. Có thể xóa khi tài liệu đã `Accepted`.
- **Placeholder:** `[…]`. Không dùng `<…>`, vì Markdown coi đó là thẻ HTML và ẩn đi khi render.
- **Examples:** dòng in nghiêng trong bảng, xóa khi điền.
- **Not applicable:** bỏ mục hoặc bỏ cả file, không ghi "N/A". Mục cần mà chưa có câu trả lời thì mở câu hỏi `Q-xxx`.
- **Language:** tên file, heading, tên phase, nhãn trường, header bảng, giá trị Status và mã dùng tiếng Anh. Phần giải
  thích viết tiếng Việt.

| ID | Meaning | Defined in |
|---|---|---|
| `Q-001` | Câu hỏi | questions.md |
| `A-001` | Assumption | questions.md |
| `US-001` | User story | prd.md |
| `BR-001` | Business rule | domain.md |
| `EC-001` | Edge case | domain.md |
| `SCR-001` | Màn hình | ui-flow.md |
| `ADR-0001` | Quyết định kỹ thuật | decisions/ |
| `CR-42` | Change request, theo số Issue | Issue tracker |

## Writing

Viết cho người không có mặt lúc thảo luận: họ đọc xong phải biết đã chốt gì, ai làm và làm tiếp thế nào.

- Một câu một ý. Câu nói về trách nhiệm hoặc quyền quyết định thì ghi rõ ai.
- Ghi điều kiện cụ thể: khi nào, bao nhiêu, ở đâu. Một yêu cầu có ngoại lệ thì ghi ngoại lệ cạnh yêu cầu.
- Giữ nguyên thuật ngữ kỹ thuật tiếng Anh thông dụng, như API, commit, prompt, model, eval, test set. Thuật ngữ ít
  gặp thì giải thích ở lần xuất hiện đầu.
- Dùng bảng để so sánh, bullet cho các ý độc lập, đoạn văn để giải thích lý do.
- Phân biệt điều đã kiểm chứng, mục tiêu và assumption. Ghi nguồn và ngày cho thông tin lấy từ người dùng hoặc từ
  kết quả chạy.

| Unclear | Clearer |
|---|---|
| Màn nào cũng phải có loading, empty, error. | Màn hình tải dữ liệu cần trạng thái loading, empty và error. |
| Thứ chỉ nằm trong chat coi như chưa có. | Quyết định trong chat được tóm tắt vào Issue hoặc ADR, kèm link. |
| Nhóm cân nhắc lựa chọn phương án phù hợp. | Tech Lead chọn giữa A và B trước Phase 3 và ghi vào ADR. |
| Đã test, chạy ổn. | `make check` xanh ở local; chưa thử trên staging. |

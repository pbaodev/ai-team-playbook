# Tài liệu

> Trang này dành cho người viết hoặc sửa tài liệu, và cho AI agent khi cần tìm thông tin. Nó ghi thông tin nào nằm ở
> file nào, ai giữ file đó, và ranh giới giữa các file để không ghi một thông tin ở hai nơi.

Mỗi thông tin chỉ ghi ở một file. File khác cần thì link tới, không chép lại. Qua mỗi giai đoạn, nhóm hoàn thiện dần
cùng một bộ tài liệu từ bản nháp lên v1.0, chứ không tạo thêm file mới.

| File | Trả lời câu hỏi gì | Người giữ | Có từ | Lưu ý |
|---|---|---|---|---|
| `docs/brief.md` | Vì sao làm, làm cho ai, thế nào là thành công | PM | GĐ1 | Gói trong một trang. Ghi mục tiêu ban đầu, còn con số chính thức nằm ở `eval/plan.md`. Chỉ sửa khi đổi phạm vi lớn |
| `docs/discovery/request.md` | Yêu cầu gốc, chép nguyên văn | PM | GĐ1 | Không sửa |
| `docs/discovery/questions.md` | Câu hỏi `Q-NNN` và giả định `A-NNN` | PM/BA | GĐ1 | Câu trả lời ghi rõ ai trả lời, ngày nào |
| `docs/decisions/ADR-*.md` | Vì sao chọn phương án này | TL | GĐ1 | Phương án bị loại ghi ở `rejected-options.md`, kèm điều kiện để xem lại |
| `docs/domain/` | Luật nghiệp vụ, thuật ngữ, data model, edge case | BA | GĐ2 | Code, prompt và eval đều lấy từ đây |
| `ARCHITECTURE.md` | Hệ thống gồm những gì, chạy thế nào: sơ đồ tổng, luồng chính, cách deploy | TL | GĐ2 | Khoảng 2 trang, link sang 3 file chi tiết |
| `docs/architecture/backend.md`, `frontend.md`, `ai.md` | Bên trong từng mảng gồm những thành phần nào, phụ thuộc nhau ra sao, dữ liệu đi thế nào | TL, FE, AI/ML | GĐ2 | Chỉ mô tả cấu trúc, lý do để ở ADR |
| `docs/ui-flow.md` | Màn hình, luồng, trạng thái | FE | GĐ2 | Luật nghiệp vụ thì link về `domain/` |
| `docs/conventions/` | Viết code thế nào | TL và các code owner | GĐ0, chốt ở GĐ2 | Luật nào cũng nên có công cụ kiểm |
| `docs/prd.md` | Làm cái gì: user story, tiêu chí nghiệm thu, phạm vi | PM + BA | GĐ3 | Không viết lại bài toán, link về brief |
| `docs/SPEC.md` | Bản này xây gì: module, interface, lệnh, tiêu chí đạt, ranh giới | TL | GĐ3 | Không vẽ lại kiến trúc, không chép ngưỡng |
| `eval/plan.md` | Chỉ số, ngưỡng, dataset, cách đo | QA/Eval | GĐ3 | Ngưỡng chỉ ghi ở đây |
| `tasks/plan.md` | Slice, feature, task và thứ tự làm | TL | GĐ3 | Trạng thái task nằm trên tracker, không ghi ở đây |
| `docs/process/team.md` | Ai giữ vai nào, dùng công cụ gì, nhóm đổi luật nào | PM | GĐ0 | |

Để phân biệt `ARCHITECTURE.md` với `SPEC.md`, hãy hỏi thêm một feature mới thì có phải sửa file này không. SPEC thì lúc
nào cũng phải sửa, còn ARCHITECTURE chỉ sửa khi feature đó làm đổi cấu trúc.

Repo giữ phần "làm gì" (spec, plan, ADR, domain), là thứ AI agent cần đọc. Tracker giữ phần "ai làm, khi nào xong, đang
tới đâu". Trạng thái task chỉ nằm trên tracker.

## Cách viết

- Mở đầu bằng việc ai sẽ đọc, và họ cần hiểu, quyết định hay làm gì.
- Chỉ giữ thông tin ảnh hưởng tới cách làm và tiêu chí đạt. Thứ đã có ở nguồn khác thì link tới.
- Ưu tiên bảng hoặc gạch đầu dòng ngắn, mỗi dòng một ý.
- Thứ máy đọc (biến, bảng, trạng thái, route, key JSON) viết tiếng Anh `snake_case`. Tên file và tên nhánh viết tiếng
  Anh `kebab-case`. Thứ người đọc viết tiếng Việt có dấu.

## Viết tiếng Việt

Tài liệu phải đọc như đồng nghiệp đang nói chuyện, không như bản dịch máy. Agent viết tiếng Việt rất dễ mắc mấy lỗi dưới
đây.

1. Giữ nguyên thuật ngữ kỹ thuật mà dân trong nghề vẫn nói bằng tiếng Anh: pipeline, staging, deploy, rollback, review,
   merge, feature flag, flaky test, regression, data leakage, gate, vertical slice, contract. Không tự dịch thành
   "đường ống", "thoái hoá", "rò dữ liệu".
2. Viết câu đủ chủ ngữ và vị ngữ. Không chặt ý thành từng mẩu rồi nối bằng dấu hai chấm, chấm phẩy.
3. Không bê cấu trúc tiếng Anh sang: "được ... bởi", "việc + động từ", "một cách", "điều này".
4. Bỏ từ sáo rỗng: đảm bảo, tối ưu, hiệu quả, nhằm, tiến hành, thực hiện, đóng vai trò.
5. In đậm thật ít, chỉ dùng cho chỗ người đọc không được bỏ sót.
6. Viết xong thì đọc thử thành tiếng. Câu nào đồng nghiệp không nói như vậy thì viết lại.

| Nghe như máy | Viết lại |
|---|---|
| Giai đoạn chỉ là mốc độ chín của cùng bộ tài liệu, không sinh thêm file. | Qua mỗi giai đoạn, nhóm hoàn thiện dần cùng một bộ tài liệu, chứ không tạo thêm file mới. |
| Thoái hoá: đổi prompt làm hỏng ca cũ. | Regression: sửa prompt xong, những ca trước đây đúng giờ lại sai. |
| Việc kiểm thử được thực hiện bởi QA nhằm đảm bảo chất lượng. | QA test trước khi phát hành. |
| Test lúc pass lúc fail được tính là bug: sửa hoặc cách ly trong 1 ngày. | Test flaky cũng tính là bug. Trong ngày phải sửa xong, hoặc tạm tách nó khỏi bộ test chính. |

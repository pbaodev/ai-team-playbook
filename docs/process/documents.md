# Tài liệu

> **Người đọc:** người viết hoặc sửa tài liệu, và AI agent khi tìm thông tin. File này ghi thông tin nào nằm ở file
> nào, ai giữ, và ranh giới giữa các file để không ghi một thông tin ở hai nơi.

**Mỗi thông tin chỉ ở một file;** file khác trỏ tới, không chép lại. Giai đoạn chỉ là mốc độ chín của cùng bộ tài liệu
(nháp rồi v1.0), không sinh thêm file.

| File | Trả lời câu hỏi | Người giữ | Có từ | Ranh giới |
|---|---|---|---|---|
| `docs/brief.md` | Vì sao làm, cho ai, thành công trông thế nào | PM | GĐ1 | Một trang; ghi mục tiêu ban đầu, số chính thức ở `eval/plan.md`; chỉ sửa khi đổi phạm vi lớn |
| `docs/discovery/request.md` | Yêu cầu nguyên văn | PM | GĐ1 | Không sửa |
| `docs/discovery/questions.md` | Câu hỏi `Q-NNN`, giả định `A-NNN` | PM/BA | GĐ1 | Câu trả lời ghi nguồn và ngày |
| `docs/decisions/ADR-*.md` | Vì sao chọn | TL | GĐ1 | Phương án loại ghi ở `rejected-options.md`, kèm điều kiện xem lại |
| `docs/domain/` | Luật nghiệp vụ, thuật ngữ, mô hình dữ liệu, edge case | BA | GĐ2 | Nguồn mà code, prompt và eval cùng trích |
| `ARCHITECTURE.md` | Hệ thống gồm gì, chạy thế nào: sơ đồ tổng, luồng chính, deploy | TL | GĐ2 | Khoảng 2 trang, trỏ sang 3 file chi tiết |
| `docs/architecture/backend.md`, `frontend.md`, `ai.md` | Cấu trúc bên trong từng mảng: thành phần, chiều phụ thuộc, luồng dữ liệu | TL, FE, AI/ML | GĐ2 | Chỉ mô tả cấu trúc; lý do ở ADR |
| `docs/ui-flow.md` | Màn hình, luồng, trạng thái | FE | GĐ2 | Luật nghiệp vụ trỏ về `domain/` |
| `docs/conventions/` | Viết code thế nào | TL + người giữ mảng | GĐ0, chốt ở GĐ2 | Mỗi luật nên có công cụ kiểm |
| `docs/prd.md` | Làm cái gì: user story, tiêu chí nghiệm thu, phạm vi | PM + BA | GĐ3 | Không viết lại bài toán, trỏ về brief |
| `docs/SPEC.md` | Bản này xây gì: module, giao diện, lệnh, tiêu chí đạt, ranh giới | TL | GĐ3 | Không vẽ lại kiến trúc, không chép ngưỡng |
| `eval/plan.md` | Chỉ số, ngưỡng, bộ dữ liệu, cách đo | QA/Eval | GĐ3 | Nơi duy nhất ghi ngưỡng |
| `tasks/plan.md` | Lát, feature, task, thứ tự | TL | GĐ3 | Trạng thái task ở tracker, không ở đây |
| `docs/process/team.md` | Ai giữ vai nào, công cụ, luật nhóm sửa | PM | GĐ0 | |

**ARCHITECTURE hay SPEC:** thêm một feature mới thì luôn phải sửa SPEC; ARCHITECTURE chỉ sửa khi feature đó làm đổi cấu
trúc.

**Repo và tracker:** repo giữ "cái gì" (spec, plan, ADR, domain), là thứ AI agent cần đọc. Tracker giữ "ai, khi nào,
đang ở đâu". Không ghi trạng thái task ở hai nơi.

## Cách viết

- Mở đầu bằng người đọc và mục đích: ai đọc, họ cần hiểu, quyết định hay làm gì.
- Chỉ giữ thông tin ảnh hưởng tới cách làm và tiêu chí đạt; trỏ tới nguồn thay vì chép.
- Bảng hoặc gạch đầu dòng ngắn, mỗi dòng một ý.
- Thứ máy đọc (biến, bảng, trạng thái, route, key JSON): tiếng Anh `snake_case`. Tên file, tên nhánh: tiếng Anh
  `kebab-case`. Thứ người đọc: tiếng Việt có dấu.

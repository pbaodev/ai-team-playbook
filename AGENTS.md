# Hướng dẫn cho AI agent

> Trang này dành cho AI agent làm việc trong repo (Claude Code, Codex, Cursor…). Nó chỉ ra cần đọc gì trước khi làm và
> những luật riêng cho agent. Nội dung chi tiết nằm ở các file được nhắc tới, không chép lại ở đây.

## Đọc gì trước

| Việc | Đọc |
|---|---|
| Mọi việc | [`docs/process/working-agreement.md`](docs/process/working-agreement.md) và mục ranh giới trong `docs/SPEC.md` |
| Làm một task | Dòng của task trong `tasks/plan.md`, mục SPEC mà task trỏ tới, convention của mảng trong `docs/conventions/` |
| Viết hoặc sửa tài liệu | [`docs/process/documents.md`](docs/process/documents.md), nhất là mục Viết tiếng Việt |
| Đụng tới prompt, model, eval | [`docs/process/eval.md`](docs/process/eval.md) và `eval/plan.md` |
| Muốn đổi hành vi đã ghi trong spec | [`docs/process/change-control.md`](docs/process/change-control.md) |

## Lệnh

Chạy `make setup` khi mới clone repo, và chạy `make check` trước khi mở PR. Các lệnh khác nằm ở mục Lệnh của
`docs/SPEC.md`.

## Luật riêng cho agent

- Chỉ sửa trong phạm vi task: đúng những file task ghi, không động vào phần "không làm".
- Khi spec và code nói khác nhau, hoặc hai tài liệu mâu thuẫn, thì dừng lại và hỏi. Không tự chọn một bên.
- Mỗi task một PR. Commit và tên nhánh theo `working-agreement.md`.
- Không push thẳng `main`, không force-push, không dùng `--no-verify`.
- Không thêm thư viện hay dịch vụ khi chưa hỏi Tech Lead.
- Không sửa test set đã đóng băng.
- Không đưa secret, key hay dữ liệu thật của người dùng vào code, test, log hay PR.
- Viết tiếng Việt theo mục Viết tiếng Việt trong `documents.md`, giữ nguyên thuật ngữ kỹ thuật tiếng Anh.

# Conventions

> Thư mục này ghi những quy tắc viết code mà linter, formatter và type checker không tự kiểm được. Quy tắc máy kiểm
> được thì cấu hình vào công cụ, không ghi ở đây. Template không chọn sẵn stack hay quy tắc nào; nhóm thêm file khi có
> quy tắc cần thống nhất.

## When to add one

Thêm convention khi cùng một góp ý lặp lại trong review, hoặc agent sai cùng một kiểu nhiều lần. Ví dụ: ranh giới
giữa các module, cách xử lý lỗi, cách viết prompt, cách đặt tên migration.

## How

1. Copy [_template.md](_template.md) và đặt tên theo phạm vi, ví dụ `backend.md`, `prompts.md`, `error-handling.md`.
2. Mở PR; Tech Lead duyệt. Khi merge, Status chuyển sang `Accepted`.
3. Thêm một dòng vào Index.

## Index

| File | Scope | Status |
|---|---|---|
| | | |

Thiết kế hệ thống nằm ở [ARCHITECTURE.md](../../ARCHITECTURE.md). Cách đo phần AI nằm ở
[eval guide](../playbook/eval.md).

# Convention backend

> Luật riêng của backend, bổ sung cho [`general.md`](general.md). TL chốt file này ở GĐ2 theo stack đã chọn. Cấu trúc
> tổng thể của backend xem ở `docs/architecture/backend.md`.

## Stack

<!-- Ngôn ngữ, framework, ORM, công cụ quản lý gói. Link tới ADR chọn stack. -->

## File trong một feature

Chỉ tạo file khi cần, nhưng tên file cố định, để mở feature nào cũng biết thứ mình tìm nằm ở đâu.

| File | Chứa gì |
|---|---|
| `router` | Nhận request, kiểm quyền, gọi service. Không chứa logic nghiệp vụ |
| `schemas` | Model của request, response, tham số và kết quả của tool |
| `service` | Thao tác nghiệp vụ, mở transaction. Tool của agent cũng gọi vào đây |
| `repo` | Câu truy vấn được dùng lại ở nhiều chỗ |
| `models` | Model của ORM |
| `rules` | Luật thuần, không I/O |

## Transaction và đồng thời

- Transaction mở và đóng ở service. Router và repo không tự commit.
- Khi đổi trạng thái, kiểm điều kiện ngay trong câu `UPDATE ... WHERE status = ...`, để hai request đến cùng lúc không
  cùng sửa được.
- Thao tác ghi được gọi từ bên ngoài (API, tool của agent) phải có idempotency key, để gửi lại không chạy hai lần.

## Migration

- Mỗi thay đổi schema một migration. Trước khi merge thì kéo `main` về và sửa để chỉ còn một head.
- Migration chạy được cả chiều lên và chiều xuống. Nếu không làm được thì ghi rõ lý do trong PR.

## API

- Route đặt tên theo tài nguyên, có phiên bản ở prefix.
- Lỗi trả về theo bảng mã lỗi chung.
- OpenAPI sinh tự động từ code, không viết tay.

## Ví dụ

<!-- Một ví dụ ngắn cho router, service và rules theo stack đã chọn, để người mới và agent làm theo. -->

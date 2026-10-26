# Kiến trúc backend

> TL giữ file này. Nó mô tả bên trong backend gồm những phần nào và phụ thuộc nhau ra sao. Cách viết code xem ở
> `docs/conventions/backend.md`, lý do chọn công nghệ xem ở ADR.

## Cấu trúc thư mục

<!-- Cây thư mục chính, mỗi thư mục một dòng giải thích. Nên chia theo feature, trong mỗi feature mới chia tầng. -->

```text
src/
  core/        dùng chung, không import feature nào
  <feature>/   router, service, repo, models, rules
```

## Chiều phụ thuộc

<!-- Module nào được import module nào, và công cụ nào kiểm luật này (ví dụ import-linter). -->

## Dữ liệu

<!-- Database, các bảng chính, transaction mở ở tầng nào, migration làm thế nào. Data model đầy đủ ở docs/domain/. -->

## API

<!-- Kiểu API, cách xác thực và phân quyền, mã lỗi chuẩn, OpenAPI sinh ở đâu. -->

## Việc chạy nền và dịch vụ ngoài

<!-- Job định kỳ, queue, các API bên ngoài mà backend gọi, xử lý khi chúng lỗi. -->

## Bảo mật

<!-- PII được che hoặc mã hoá ở đâu, secret để đâu, log không được chứa gì. -->

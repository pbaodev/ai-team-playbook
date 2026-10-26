# Convention frontend

> Luật riêng của frontend, bổ sung cho [`general.md`](general.md). FE chốt file này ở GĐ2 theo stack đã chọn. Cấu trúc
> tổng thể của frontend xem ở `docs/architecture/frontend.md`.

## Stack

<!-- Framework, thư viện component, công cụ style, công cụ quản lý gói. Link tới ADR chọn stack. -->

## Component

- Component dùng chung nằm trong một thư mục riêng. Sửa component dùng chung thì code owner FE duyệt.
- Màu, cỡ chữ, khoảng cách lấy từ token, không viết mã màu trực tiếp trong component.
- Màn nào cũng phải có đủ trạng thái loading, empty và error.

## Gọi API

- Client và kiểu dữ liệu sinh từ OpenAPI của backend, không viết tay. Backend đổi schema thì chạy lại lệnh sinh trong
  cùng PR.

## Accessibility

- Thao tác được hoàn toàn bằng bàn phím.
- Nút và ô nhập có nhãn rõ ràng.
- Trạng thái không chỉ phân biệt bằng màu.

## Dữ liệu nhạy cảm

- PII hiển thị theo quy định che trong `docs/domain/data-model.md`.

## Test

- Luồng chính có test E2E, chạy với LLM giả để kết quả ổn định.

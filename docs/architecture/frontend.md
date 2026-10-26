# Kiến trúc frontend

> FE giữ file này. Nó mô tả bên trong frontend gồm những phần nào và nối với backend ra sao. Màn hình và luồng xem ở
> `docs/ui-flow.md`, cách viết code xem ở `docs/conventions/frontend.md`.

## Cấu trúc thư mục

<!-- Cây thư mục chính, mỗi thư mục một dòng giải thích. -->

```text
app/           route và trang
components/    component dùng chung của design system
lib/api/       client gọi API, sinh từ OpenAPI
```

## Trang và điều hướng

<!-- Các route chính, mỗi vai vào trang nào, bảo vệ route thế nào. -->

## State và gọi API

<!-- State để ở đâu, gọi API bằng gì. Nên sinh client từ OpenAPI để frontend và backend không lệch nhau. -->

## Design system

<!-- Token màu, chữ, khoảng cách; component dùng chung nằm ở đâu; ai duyệt khi sửa component dùng chung. -->

## Loading, empty, error

<!-- Cách xử lý chung cho ba trạng thái này, để màn nào cũng giống nhau. -->

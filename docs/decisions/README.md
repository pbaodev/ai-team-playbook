# Decisions

> Mỗi quyết định kỹ thuật khó đảo ngược có một ADR (Architecture Decision Record) trong thư mục này, viết theo
> [_template.md](_template.md). Khi tạo ADR, thêm một dòng vào Index; khi ADR đổi Status, sửa dòng đó. Dòng in nghiêng
> là ví dụ, xóa khi điền.

## When to write an ADR

- Chọn hướng AI: ADR-0001, ở Phase 1.
- Chọn stack, lưu trữ dữ liệu, auth, hạ tầng, nhà cung cấp model: ở Phase 2.
- Đổi một quyết định đã `Accepted`: viết ADR mới; ADR cũ chuyển sang `Superseded by ADR-NNNN`.

Lựa chọn dễ đổi lại thì không cần ADR, ví dụ một thư viện chỉ dùng trong một module.

## Index

Cột Options not chosen giúp tìm lại phương án đã cân nhắc mà không phải mở từng ADR.

| ADR | Title | Status | Date | Options not chosen |
|---|---|---|---|---|
| *0001* | *Hướng AI: prompt và few-shot* | *Accepted* | *[YYYY-MM-DD]* | *RAG trên kho chính sách, fine-tune* |

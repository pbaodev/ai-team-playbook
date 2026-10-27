# Backend architecture

- **Status:** [Draft | Accepted | Superseded]
- **Owner:** [Tech Lead]
- **Updated:** [YYYY-MM-DD]
- **Related:** [ARCHITECTURE](../../ARCHITECTURE.md) · [SPEC](../SPEC.md) · [domain](../domain.md)

> Điền khi backend cần mô tả sâu hơn ARCHITECTURE.md; nếu không thì bỏ file. Danh sách module và interface nằm ở SPEC;
> file này ghi những quy tắc chung mà mọi module tuân theo. Quy tắc cách viết code để ở
> [conventions](../conventions/README.md). Dòng in nghiêng là ví dụ, xóa khi điền.

## Structure

[Backend chịu trách nhiệm gì, code chia theo module nào, module nào được phụ thuộc vào module nào.]

## Interfaces

- **Contract:** [nơi lưu, ví dụ `contracts/openapi.yaml`; CI kiểm tương thích thế nào]
- **Auth:** [cách xác thực, cách phân quyền, kiểm ở tầng nào]
- **Errors:** [format lỗi chung và bảng mã lỗi]
- **Validation:** [kiểm dữ liệu đầu vào ở đâu]

## Data

- **Storage:** [DB, file, cache. Entity xem ở domain.]
- **Rules enforced in:** [tầng nào kiểm `BR-xxx`]
- **Transactions and concurrency:** [ranh giới một lần cập nhật; xử lý khi hai người cùng sửa]
- **Idempotency:** [thao tác nào có thể bị gửi lặp và cách tránh làm hai lần]
- **Migrations:** [công cụ, quy tắc viết, ai duyệt]

## Jobs and external services

Phân biệt lỗi thử lại được với thao tác đã có tác động mà chưa biết lần trước thành công hay chưa. Loại thứ hai không
retry tự động.

| Job or service | Trigger | Timeout | Retry | When unavailable |
|---|---|---|---|---|
| *Gửi email trả lời* | *CSKH bấm gửi* | *10 s* | *Không; đặt trạng thái `unknown` để CSKH kiểm tra* | *Xếp hàng, báo trên giao diện* |

## Observability

- **Logs:** [ghi gì; không ghi PII và secret; giữ bao lâu; ai xem được]
- **Metrics and alerts:** [theo mục Setup của Phase 5 trong phases.md]
- **Tracing:** [công cụ, nếu có]

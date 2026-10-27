# Frontend architecture

- **Status:** [Draft | Accepted | Superseded]
- **Owner:** [UX]
- **Updated:** [YYYY-MM-DD]
- **Related:** [ARCHITECTURE](../../ARCHITECTURE.md) · [UI flow](../ui-flow.md) · [SPEC](../SPEC.md)

> Điền khi sản phẩm có giao diện và frontend cần mô tả sâu hơn ARCHITECTURE.md; nếu không thì bỏ file. Người dùng thấy
> gì nằm ở UI flow; file này ghi cách xây. Dòng in nghiêng là ví dụ, xóa khi điền.

## Structure

- **Platform:** [web, mobile, desktop; framework và ADR]
- **Code layout:** [route, feature, component dùng chung nằm ở đâu]
- **Design system:** [nguồn thiết kế, thư viện component]

## Data and state

| Data | Source | Load and update | States | Recovery |
|---|---|---|---|---|
| *Danh sách bản nháp* | *`GET /drafts`* | *Tải khi mở trang, tải lại sau khi gửi* | *loading, empty, error* | *Nút thử lại; giữ danh sách đã tải* |

- **Types:** [sinh từ contract hay viết tay; cách giữ khớp với backend]
- **Local vs shared state:** [state nào chỉ sống trong một màn hình, state nào được lưu hoặc chia sẻ]

## Access control

[Điều hướng theo vai thế nào. Giao diện ẩn nút chỉ để dễ dùng; backend vẫn kiểm quyền trước khi trả dữ liệu hoặc thực
thi.]

## Accessibility

- **Target:** [ví dụ WCAG 2.2 mức AA]
- **Checks:** [thao tác bằng bàn phím, nhãn cho screen reader, độ tương phản, thông báo trạng thái; công cụ kiểm tự động]

## Sensitive data

[Dữ liệu nào được hiển thị, lưu trong trình duyệt hoặc gửi cho dịch vụ bên thứ ba như analytics, error tracking; che
bằng cách nào.]

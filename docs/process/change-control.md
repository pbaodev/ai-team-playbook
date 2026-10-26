# Kiểm soát thay đổi

> **Người đọc:** người muốn đổi hành vi đã ghi trong spec, và người duyệt. Áp dụng từ cổng GĐ3, khi `prd.md` và
> `SPEC.md` đã chốt v1.0. Chỉ thay đổi làm đổi hành vi đã ghi trong spec mới cần CR.

## Ba bậc

| Bậc | Ví dụ | Cách làm |
|---|---|---|
| Trong ý của spec | Sửa bug cho đúng spec, chỉnh prompt hay câu chữ mà hành vi vẫn như spec | Chỉ cần PR; đụng phần AI thì kèm eval trước và sau |
| Đổi hành vi | Luồng, quyền, bước xác nhận, ngưỡng, ý nghĩa trạng thái, hợp đồng chung, nhãn hoặc tập test | Issue CR (dưới đây) |
| Đổi phạm vi lớn | Thêm hoặc bỏ cả một luồng | Duyệt lại như v1.0, tăng số đầu của phiên bản |

Một thay đổi làm đổi luồng, quyền hay ý nghĩa trạng thái thuộc bậc **Đổi hành vi**, dù code chỉ sửa vài dòng.

## Làm một CR

1. Mở Issue theo mẫu CR: đổi gì, vì sao, ảnh hưởng tới mục spec, ADR, task, eval nào; các phương án; đề xuất.
2. Duyệt: PM và người giữ mảng bị ảnh hưởng. Người đề xuất không tự duyệt; CR do PM đề xuất cần thêm một người khác.
3. PR sửa `prd.md` hoặc `SPEC.md`: tăng phiên bản, thêm một dòng vào bảng lịch sử (số CR và một câu mô tả). PR này
   merge trước PR code.
4. Tạo task cho phần code, đưa vào plan của milestone kế tiếp.

## Trường hợp riêng

- **Bug:** mở Issue Bug. Nếu cách sửa làm đổi hành vi đã ghi trong spec thì chuyển thành CR.
- **Quyết định kỹ thuật:** viết ADR mới thay ADR cũ; ADR cũ ghi `Superseded by ADR-NNN`. Không sửa phần quyết định của
  ADR đã Accepted.
- **Prompt, model:** đổi trong ý spec thì là bậc đầu, nhưng PR phải kèm eval trước và sau. Đổi model mặc định hoặc
  ngưỡng là CR.
- **Bộ eval:** đổi dữ liệu, nhãn, cách tính hay ngưỡng của tập test luôn là CR, để không tự hạ chuẩn cho dễ đạt.

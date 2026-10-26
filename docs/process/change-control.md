# Kiểm soát thay đổi

> Trang này dành cho người muốn đổi một hành vi đã ghi trong spec, và người duyệt thay đổi đó. Luật áp dụng từ khi qua
> gate GĐ3, tức là `prd.md` và `SPEC.md` đã chốt v1.0.

Không phải thay đổi nào cũng cần CR. Chỉ những thay đổi làm khác đi hành vi đã ghi trong spec mới cần.

## Ba mức thay đổi

| Mức | Ví dụ | Cách làm |
|---|---|---|
| Vẫn đúng với spec | Sửa bug cho đúng spec, chỉnh prompt hay câu chữ mà hành vi vẫn như spec | Chỉ cần PR. Đụng tới phần AI thì kèm eval trước và sau |
| Đổi hành vi | Đổi luồng, quyền, bước xác nhận, ngưỡng, ý nghĩa trạng thái, shared contract, nhãn hay test set | Mở CR theo các bước bên dưới |
| Đổi phạm vi lớn | Thêm hoặc bỏ cả một luồng | Duyệt lại như bản v1.0 và tăng số đầu của phiên bản |

Thay đổi làm khác luồng, quyền hay ý nghĩa trạng thái thì vẫn thuộc mức Đổi hành vi, dù code chỉ sửa vài dòng.

## Các bước làm CR

1. Mở Issue theo mẫu CR. Ghi đổi gì, vì sao, ảnh hưởng tới mục spec, ADR, task và eval nào, có những phương án nào, và
   mình đề xuất phương án nào.
2. PM và code owner của mảng bị ảnh hưởng duyệt. Người đề xuất không tự duyệt. Nếu PM là người đề xuất thì cần thêm một
   người khác duyệt.
3. Mở PR sửa `prd.md` hoặc `SPEC.md`: tăng phiên bản, thêm một dòng vào bảng lịch sử gồm số CR và một câu mô tả. PR
   này phải merge trước PR code.
4. Tạo task cho phần code và đưa vào plan của milestone kế tiếp.

## Vài trường hợp riêng

- **Bug:** mở Issue Bug. Nếu muốn sửa mà phải đổi hành vi đã ghi trong spec thì chuyển thành CR.
- **Đổi quyết định kỹ thuật:** viết ADR mới để thay ADR cũ, và ghi `Superseded by ADR-NNN` vào ADR cũ. Không sửa phần
  quyết định của ADR đã Accepted.
- **Prompt và model:** chỉnh trong phạm vi spec thì chỉ cần PR, nhưng phải kèm eval trước và sau. Đổi model mặc định
  hay đổi ngưỡng thì phải có CR.
- **Eval:** đổi dữ liệu, nhãn, cách tính hay ngưỡng của test set luôn phải có CR, để không ai tự hạ chuẩn cho dễ đạt.

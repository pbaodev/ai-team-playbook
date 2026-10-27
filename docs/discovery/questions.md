# Questions and assumptions

- **Owner:** [Product]
- **Updated:** [YYYY-MM-DD]

> Mọi câu hỏi gửi người ngoài nhóm ghi ở đây. Product là người gửi, kèm mã `Q-xxx` để người được hỏi không nhận cùng
> một câu từ nhiều người. Câu trả lời nhận qua chat được chép vào đây, ghi người trả lời và ngày. Dòng in nghiêng là ví
> dụ, xóa khi điền.

## Questions

- **Priority:** `blocks-spec` (chưa có trả lời thì chưa viết được SPEC), `blocks-build` (cần trước khi làm phần liên
  quan), `nice-to-know` (không chặn việc gì).
- **Status:** `Open` → `Asked` → `Answered`, hoặc `Assumed` khi đã chuyển thành assumption.

| ID | Question | Why it matters | Priority | Ask | Owner | Status | Answer (by, date) |
|---|---|---|---|---|---|---|---|
| *Q-001* | *Đơn quá 30 ngày có được hoàn tiền không?* | *Quyết định luật BR-004 và nhánh xử lý của bản nháp* | *blocks-spec* | *Trưởng nhóm CSKH* | *[@handle]* | *Answered* | *Không, trừ lỗi do kho (Trưởng nhóm CSKH, 2026-11-03)* |

## Assumptions

Câu hỏi chưa có trả lời mà vẫn phải làm tiếp thì ghi thành assumption. Product duyệt; người nắm nghiệp vụ xác nhận lại
trước Phase 4. Assumption là con số thì đặt trong config.

| ID | From | Assumption | Impact if wrong | Approved by | Confirmed |
|---|---|---|---|---|---|
| *A-001* | *Q-002* | *Mỗi email chỉ nói về một đơn hàng* | *Phải tách email nhiều đơn; đổi data model và prompt* | *[@handle]* | *No* |

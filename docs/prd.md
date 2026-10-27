# PRD: [tên dự án hoặc release]

- **Status:** [Draft | Accepted | Superseded]
- **Owner:** [Product]
- **Updated:** [YYYY-MM-DD]
- **Related:** [brief](brief.md) · [SPEC](SPEC.md) · [questions](discovery/questions.md)

> Giữ PRD ngắn: chỉ ghi người dùng cần gì và thế nào là đạt. Bối cảnh bài toán nằm ở brief, cách làm nằm ở SPEC. Mỗi
> user story có mã `US-xxx` để SPEC, task và test dẫn tới. Dòng in nghiêng là ví dụ, xóa khi điền.

## Goal

[Bản phát hành này giúp người dùng đạt được gì, 1–2 câu.]

## User stories

Priority dùng `Must`, `Should` hoặc `Could`. Acceptance criteria phải kiểm tra được bằng test, eval hoặc thử tay.

| ID | User story | Acceptance criteria | Priority |
|---|---|---|---|
| *US-001* | *Là nhân viên CSKH, tôi muốn nhận bản nháp trả lời email khiếu nại để gửi trong ngày* | *Bản nháp có mã đơn, số tiền hoàn và chính sách áp dụng; email thiếu mã đơn thì hỏi lại, không tự đoán* | *Must* |

## Quality targets

Ngưỡng chất lượng AI mà sản phẩm cần để dùng được. Cách đo, dataset và cách chấm nằm ở [eval plan](../eval/plan.md).

| Metric | Target |
|---|---|
| *Bản nháp gửi được mà không cần sửa nội dung* | *≥ 80% trên test set* |

## Non-goals

- [phần không làm trong bản này, kèm lý do ngắn]

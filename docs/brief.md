# Brief: [tên dự án]

- **Status:** [Draft | Accepted | Superseded]
- **Owner:** [tên]
- **Updated:** [YYYY-MM-DD]
- **Related:** [request](discovery/request.md) · [questions](discovery/questions.md) · ADR-0001

> Giữ trong một trang. Brief trả lời câu hỏi có nên làm không và làm theo hướng nào. Yêu cầu chi tiết nằm ở PRD, thiết
> kế kỹ thuật nằm ở SPEC và ADR. Điều chưa xác nhận thì ghi `(assumption)`. Dòng in nghiêng là ví dụ, xóa khi điền.

## Problem

[Ai gặp vấn đề gì, trong hoàn cảnh nào, hậu quả ra sao. 2–3 câu, kèm nguồn hoặc số liệu.]

## Users

| User | Need | Current workaround |
|---|---|---|
| *Nhân viên CSKH* | *Trả lời email khiếu nại trong ngày* | *Tra ba hệ thống bằng tay, khoảng 15 phút mỗi email* |

## Solution

[Sản phẩm giúp người dùng thế nào, 2–3 câu.]

- **AI role:** [AI làm phần nào; phần nào do code hoặc người quyết định]
- **Why AI:** [so với cách làm hiện tại hoặc giải pháp không dùng AI]
- **Data:** [nguồn, quyền sử dụng, có PII không]
- **Spike result:** [kết quả thử trên mẫu thật và chi phí ước tính; link ADR-0001]

## Scope

- **In:** [những gì bản đầu phải có]
- **Out:** [những gì chưa làm, kèm lý do ngắn]
- **Constraints:** [deadline, ngân sách, yêu cầu pháp lý hoặc bảo mật]

## Success metrics

| Metric | Baseline | Target | Measured by |
|---|---|---|---|
| *Thời gian xử lý một email* | *15 phút* | *Dưới 5 phút* | *Log hệ thống, 2 tuần sau phát hành* |

## Risks

[3–5 rủi ro lớn nhất, trong đó có các failure mode nặng nhất của AI. Mỗi dòng: rủi ro → cách giảm hoặc cách kiểm tra.]

- *AI trích sai số tiền hoàn trả → code tính số tiền, AI chỉ chọn chính sách; eval có nhóm ca riêng cho số tiền.*

## Decision

[Go | Pivot | Stop] · [người quyết định] · [YYYY-MM-DD]. [Một câu lý do.]

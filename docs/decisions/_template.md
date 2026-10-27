# ADR-[NNNN]: [quyết định, viết ngắn]

- **Status:** [Proposed | Accepted | Rejected | Superseded by ADR-NNNN]
- **Date:** [YYYY-MM-DD]
- **Deciders:** [@handle]
- **Related:** [Q-xxx, A-xxx, BR-xxx, link tài liệu]

> Mỗi quyết định kỹ thuật khó đảo ngược có một ADR. Đặt tên file `NNNN-short-title.md` trong thư mục này, số tăng dần;
> ADR đầu tiên thường là `0001-ai-approach.md`. Tạo xong thì thêm một dòng vào [Index](README.md), ghi cả phương án
> không chọn. ADR đã `Accepted` thì không sửa mục Decision; muốn đổi thì viết ADR mới thay thế, theo
> [change-control.md](../playbook/change-control.md). Dòng in nghiêng là ví dụ, xóa khi điền.

## Context

[Cần quyết chuyện gì, có ràng buộc và bằng chứng nào. Phân biệt điều đã biết với assumption.]

## Decision

[Chọn gì và áp dụng cho phạm vi nào, nói cụ thể.]

## Options considered

| Option | Pros | Cons | Cost |
|---|---|---|---|
| *Prompt và few-shot* | *Làm nhanh, không cần dữ liệu train* | *Trích sai mã đơn ở 4/30 mẫu spike* | *Khoảng $0.004 mỗi email* |
| *RAG trên kho chính sách* | *Chính sách đổi không cần sửa prompt* | *Phải dựng index; thêm một bước gọi* | *Khoảng $0.006 mỗi email* |

## Consequences

- **Easier:** [việc gì dễ hơn]
- **Harder:** [việc gì khó hơn, phải đánh đổi gì]
- **Follow-up:** [việc cần làm tiếp, cách kiểm tra các assumption quan trọng]

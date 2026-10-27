# Convention: [phạm vi]

- **Status:** [Draft | Accepted | Superseded]
- **Owner:** [Tech Lead]
- **Updated:** [YYYY-MM-DD]

> Mỗi quy tắc một dòng, có lý do và cách kiểm. Quy tắc không có công cụ kiểm thì ghi `Review` để người review kiểm.
> Dòng in nghiêng là ví dụ, xóa khi điền.

## Scope

[Áp dụng cho thư mục, ngôn ngữ hoặc loại thay đổi nào.]

## Rules

| Rule | Why | Checked by | Exceptions |
|---|---|---|---|
| *Route handler không gọi LLM trực tiếp mà đi qua module `drafting`* | *Một chỗ để log, đo chi phí và mock trong test* | *Review* | *Không có* |

## Examples

[Một đoạn code đúng và một đoạn sai, hoặc link tới code mẫu trong repo.]

# Luật làm việc

> Trang này dành cho mọi thành viên và AI agent, dùng hằng ngày. Đây là luật mặc định của playbook. Nhóm muốn làm khác
> chỗ nào thì ghi vào [`team.md`](team.md), không sửa file này.

Luật ở đây cố tình nhẹ về thủ tục nhưng chặt về kiểm chứng. Khi agent viết code nhanh, chỗ dễ tắc là review và thử thật,
không phải tốc độ viết.

## Nhận task

1. Nhận task bằng cách tự gán và chuyển sang In progress. Hạn của task là hạn của milestone.
2. Mỗi task vừa một PR, đủ nhỏ để review trong khoảng 30 phút. Không cần ước lượng giờ.
3. Nhánh không sống quá 1–2 ngày, kéo `main` về mỗi ngày. Bị kẹt thì nói ngay.
4. Task 2 ngày không tiến triển thì tự báo, hoặc nhả cho người khác làm.
5. Mỗi người có tối đa 2 PR đang chờ review.

Một task chỉ bắt đầu khi đạt Definition of Ready: có mô tả, có tiêu chí đạt kiểm chứng được, có link tới mục SPEC, ghi
rõ những gì không làm, và các task phải xong trước đã merge.

## Review và merge

- PR nào cũng cần một người khác duyệt. PR đụng tới tiền, quyền, PII, prompt, model, migration hay shared contract thì
  code owner của mảng đó duyệt, và PR phải kèm kết quả eval trước và sau.
- Cho AI review trước khi nhờ người. Người review khi đó tập trung vào thiết kế và hành vi.
- Dùng squash merge, mỗi PR thành một commit trên `main`, cần revert thì revert cả PR. Merge xong thì xoá nhánh.

Bảo vệ `main` với bốn thiết lập:

1. Bắt buộc qua PR, không ai push thẳng.
2. Bắt buộc có một người duyệt.
3. Bắt buộc CI xanh và nhánh đã cập nhật theo `main`.
4. Chặn force-push và chặn xoá `main`.

## Nhánh và commit

- Tên nhánh có dạng `<loại>/<mã việc>-<mô-tả-ngắn>`, viết tiếng Anh kebab-case, ví dụ `feature/PROJ-123-refund-card`.
  Loại gồm `feature`, `fix`, `docs`, `test`, `refactor`, `chore`.
- Commit và tiêu đề PR theo [Conventional Commits](https://www.conventionalcommits.org/). Tiền tố `type(scope)` viết
  tiếng Anh, phần mô tả viết tiếng Việt, ví dụ `fix(api): trả 400 thay vì 500 khi tin nhắn rỗng`.
- PR ghi mã việc trên tracker để hai bên tự link với nhau.

## Definition of Done

- Đạt tiêu chí của task, và đã chạy thử thật chứ không chỉ chạy test.
- Hành vi mới có test, và test đó fail nếu bỏ phần sửa đi.
- `check` xanh (lint, format, type, test).
- Chỉ sửa trong phạm vi task, không để lại code chết hay secret.
- Đã cập nhật config, `.env.example` và tài liệu liên quan.
- PR đụng tới phần AI có kèm eval trước và sau, theo [`eval.md`](eval.md).

## Luật khác

- Tính năng chưa xong vẫn merge từng PR nhỏ, nhưng để sau feature flag đang tắt. Không giữ code ở nhánh sống lâu.
- Test flaky cũng tính là bug. Trong ngày phải sửa xong, hoặc tạm tách nó khỏi bộ test chính. Mỗi test dùng dữ liệu
  riêng của nó.
- Quyết định nào cũng ghi vào Issue hoặc ADR. Thứ chỉ nằm trong chat coi như chưa có.
- Bug trên prod phải thành Issue ngay trong ngày.
- Muốn thêm thư viện hay dịch vụ thì hỏi TL trước, và khoá phiên bản.
- Muốn đổi luật thì mở PR sửa `team.md`, ghi ngày và lý do.

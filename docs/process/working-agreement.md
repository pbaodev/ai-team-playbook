# Luật làm việc

> **Người đọc:** mọi thành viên và AI agent, hằng ngày. File này là luật mặc định của playbook; nhóm sửa chỗ nào thì
> ghi trong [`team.md`](team.md), không sửa file này. Luật nhẹ về thủ tục, chặt về kiểm chứng: khi agent viết code,
> điểm nghẽn là review và thử thật, không phải tốc độ viết.

## Nhận task

1. Nhận việc là tự gán và chuyển sang In progress. Hạn của task là hạn của milestone.
2. Mỗi task vừa một PR, review được trong khoảng 30 phút. Không ước lượng giờ.
3. Nhánh sống tối đa 1–2 ngày, kéo `main` hằng ngày. Kẹt thì nói ngay.
4. Task 2 ngày không có tiến triển thì tự báo hoặc nhả task cho người khác.
5. Mỗi người tối đa 2 PR đang chờ review.

**Definition of Ready**, điều kiện để bắt đầu một task: có mô tả, tiêu chí đạt kiểm chứng được, mục SPEC liên quan, phần
*không làm*, và các task phải xong trước đã merge.

## Review và merge

- PR nào cũng cần 1 người khác duyệt. PR đụng tiền, quyền, PII, prompt, model, migration hay hợp đồng chung thì người
  giữ mảng duyệt, kèm eval trước và sau.
- Cho AI review trước khi nhờ người, để người review tập trung vào thiết kế và hành vi.
- Squash merge: mỗi PR một commit trên `main`, revert theo PR. Xoá nhánh sau khi merge.

**Bảo vệ `main`:**

1. Bắt buộc qua PR, không push thẳng.
2. Bắt buộc 1 người duyệt.
3. Bắt buộc CI xanh và nhánh đã cập nhật theo `main`.
4. Chặn force-push và xoá `main`.

## Nhánh và commit

- Nhánh: `<loại>/<mã việc>-<mô-tả-ngắn>`, tiếng Anh kebab-case, ví dụ `feature/PROJ-123-refund-card`. Loại: `feature`,
  `fix`, `docs`, `test`, `refactor`, `chore`.
- Commit và tiêu đề PR theo [Conventional Commits](https://www.conventionalcommits.org/): tiền tố `type(scope)` tiếng
  Anh, mô tả tiếng Việt, ví dụ `fix(api): trả 400 thay vì 500 khi tin nhắn rỗng`.
- PR ghi mã việc trên tracker để hai bên tự liên kết.

## Definition of Done

- Đạt tiêu chí của task và đã chạy thử thật, không chỉ chạy test.
- Hành vi mới có test; test fail khi bỏ thay đổi đi.
- `check` xanh: lint, format, type, test.
- Chỉ sửa trong phạm vi task; không có code chết, không có secret.
- Config, `.env.example` và tài liệu liên quan đã cập nhật.
- PR đụng phần AI: kèm eval trước và sau theo [`eval.md`](eval.md).

## Khác

- Tính năng chưa xong thì merge từng PR nhỏ sau feature flag đang tắt, không giữ ở nhánh sống lâu.
- Test lúc pass lúc fail được tính là bug: sửa hoặc cách ly trong 1 ngày. Mỗi test có dữ liệu riêng.
- Quyết định ghi ở Issue hoặc ADR. Chỉ nằm trong chat thì coi như chưa có.
- Bug trên prod thành Issue ngay trong ngày.
- Thêm thư viện hoặc dịch vụ: hỏi TL trước, khoá phiên bản.
- Đổi luật: PR sửa `team.md`, ghi ngày và lý do.

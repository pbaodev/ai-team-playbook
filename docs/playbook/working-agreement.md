# Working agreement

Cách làm việc mặc định cho người và AI agent. Nhóm làm khác chỗ nào thì ghi vào [team.md](../team.md), không sửa file này.
Các default nhẹ về thủ tục nhưng chặt về bằng chứng: khi agent viết code nhanh, chỗ dễ tắc là review và thử thật.

## Tasks

- **Tracker:** task, bug và CR nằm trên tracker ghi ở `team.md`, và chỉ nằm ở đó; không chép danh sách task sang file
  trong repo. Default là GitHub Issues, gom theo milestone, trạng thái theo một board GitHub Projects với các cột
  `Todo`, `In progress`, `In review`, `Done`.
- Tự gán task và chuyển sang `In progress` khi bắt đầu. Hạn của task là hạn của milestone.
- Mỗi task vừa một PR, đủ nhỏ để review trong khoảng 30 phút.
- Nhánh sống tối đa 1–2 ngày và được cập nhật từ `main` mỗi ngày.
- Task 2 ngày không tiến triển thì báo trong kênh nhóm hoặc nhả cho người khác.
- Mỗi người có tối đa 2 PR đang chờ review.

**Definition of Ready:** task có mục tiêu, acceptance criteria kiểm tra được, link tới mục SPEC, non-goals, và các task
phụ thuộc đã merge.

## Branches and commits

- **Branch:** `<type>/<issue-id>-<short-desc>`, kebab-case tiếng Anh, ví dụ `feature/PROJ-123-refund-card`. Type gồm
  `feature`, `fix`, `docs`, `test`, `refactor`, `chore`.
- **Commit và tiêu đề PR:** theo [Conventional Commits](https://www.conventionalcommits.org/). Phần `type(scope)` viết
  tiếng Anh, mô tả viết tiếng Việt, ví dụ `fix(api): trả 400 thay vì 500 khi tin nhắn rỗng`.
- **Liên kết:** PR ghi `Closes #123` để task tự đóng và chuyển sang `Done` khi merge.

## Review

- Mỗi PR cần một người khác duyệt. Cho AI review trước để người review tập trung vào thiết kế và hành vi.
- PR rủi ro cao cần code owner của mảng đó duyệt. Rủi ro cao là PR đụng tới tiền, quyền, PII, prompt, model, migration
  hoặc shared contract.
- PR đụng phần AI kèm kết quả eval trên dev set, trước và sau khi sửa.

## Merge

- **Squash merge:** mỗi PR thành một commit trên `main`; cần revert thì revert cả PR. Merge xong thì xóa nhánh.
- **Feature flag:** tính năng chưa xong vẫn merge từng PR nhỏ, đặt sau flag đang tắt, thay vì giữ nhánh sống lâu.
- **Branch protection cho `main`:** bắt buộc qua PR; ít nhất một người duyệt; CI xanh và nhánh đã cập nhật theo `main`;
  chặn force-push và chặn xóa nhánh.

## Definition of Done

- [ ] Đạt acceptance criteria của task và đã chạy thử thật, không chỉ chạy test.
- [ ] Hành vi mới có test, và test đó fail nếu bỏ phần sửa.
- [ ] `make check` xanh.
- [ ] Chỉ sửa trong phạm vi task; không để lại code chết hay secret.
- [ ] Config, `.env.example` và tài liệu liên quan đã cập nhật.
- [ ] Có bằng chứng theo loại thay đổi trong bảng dưới; PR ghi rõ phần chưa kiểm.

| Change | Evidence |
|---|---|
| Logic hoặc interface | Test hành vi, kiểm tra tương thích, thử tích hợp |
| Giao diện | Thử luồng sử dụng, accessibility, các trạng thái có thể xảy ra như loading, empty, error |
| Hành vi AI | Eval trên dev set trước và sau, theo [eval.md](eval.md) |
| Tài liệu | Nội dung đúng, link dùng được, người khác làm theo được |

## Other defaults

- **Decisions:** ghi vào Issue hoặc ADR. Thảo luận trong chat thì tóm tắt và link về đó.
- **Dependencies:** hỏi Tech Lead trước khi thêm thư viện hoặc dịch vụ; khóa phiên bản.
- **Flaky tests:** tính là bug; sửa trong ngày hoặc tách khỏi bộ test chính. Mỗi test dùng dữ liệu riêng.
- **Production bugs:** mở Issue trong ngày.
- **Changing this agreement:** mở PR sửa `team.md`, ghi lý do và ngày có hiệu lực.

## Variations

- Nhóm 1–2 người: bỏ yêu cầu người duyệt thứ hai, giữ AI review và CI; ghi trong `team.md` rằng chưa có review độc lập.
- Dùng GitLab: giữ các quy tắc, gọi merge request thay cho PR.
- Dùng Jira: task, bug và CR tạo trên Jira với các trường như mẫu trong `.github/ISSUE_TEMPLATE/`. Tên nhánh và tiêu
  đề PR ghi mã Jira (`PROJ-123`) để app Jira for GitHub tự liên kết. Agent cần Atlassian MCP hoặc Jira CLI để đọc task;
  nếu không có, người giao việc dán nội dung task vào prompt.

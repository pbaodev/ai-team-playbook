# AI Team Playbook

Khung phát triển sản phẩm AI cho nhóm 4–5 người làm cùng AI agent viết code. Dùng được cho cả dự án gọi API LLM lẫn
dự án train hoặc fine-tune model.

**Người đọc:** nhóm bắt đầu một dự án AI mới, và AI agent làm việc trong repo của nhóm đó.

## Gồm gì

- **Quy trình** ([`docs/process/`](docs/process/README.md)): 6 giai đoạn, vai trò, luật làm việc, kiểm soát thay đổi.
- **Mẫu tài liệu:** brief, PRD, SPEC, ARCHITECTURE, ADR, kế hoạch eval, convention, mẫu Issue và PR.
- **Plugin Claude Code:** skill hỗ trợ từng giai đoạn.

## Dùng thế nào

1. Bấm **Use this template** trên GitHub để tạo repo cho dự án mới.
2. Thay README này bằng README của dự án.
3. Làm GĐ0 Khởi động theo [`docs/process/phases.md`](docs/process/phases.md).

## Dùng với GitLab hoặc Jira

Mẫu Issue, PR và CI hiện viết cho GitHub. Nếu nhóm dùng GitLab thì chuyển như sau:

- `.github/ISSUE_TEMPLATE/*.md` sang `.gitlab/issue_templates/`, bỏ phần front matter ở đầu mỗi file.
- `.github/PULL_REQUEST_TEMPLATE.md` thành `.gitlab/merge_request_templates/Default.md`.
- `.github/CODEOWNERS` sang `.gitlab/CODEOWNERS`.
- `.github/workflows/ci.yml` viết lại thành `.gitlab-ci.yml`, giữ hai job: `make check` và kiểm tra link.

Nếu dùng Jira, tạo các loại issue Task, Bug, Change Request, Experiment với các trường giống mẫu trong
`.github/ISSUE_TEMPLATE/`. Tên nhánh và commit ghi mã Jira (ví dụ `PROJ-123`) để Jira tự link sang.

## Trạng thái

Phần quy trình đã xong. Tiếp theo là mẫu tài liệu, sau đó tới plugin.

## License

[MIT](LICENSE)

# AI Team Playbook

Template để nhóm người cùng AI agent xây sản phẩm có phần AI, từ khi nhận yêu cầu tới khi vận hành. Template gồm quy
trình sáu phase, các mẫu tài liệu và cấu hình GitHub. Mỗi phần có default cho nhóm 3–6 người làm sản phẩm có người dùng
thật; nhóm làm khác ở đâu thì ghi lại chỗ đó.

## Structure

```text
AGENTS.md              Hướng dẫn cho AI agent
ARCHITECTURE.md        Phase 2: kiến trúc tổng thể
docs/
  playbook/            Hướng dẫn và default: phase, vai, working agreement, change control, eval, cách viết
  team.md              Phase 0: người, công cụ, chỗ làm khác default
  brief.md             Phase 1: có nên làm không, làm theo hướng nào
  discovery/           Phase 1: yêu cầu gốc, câu hỏi và assumption
  decisions/           Phase 1 trở đi: ADR và index
  domain.md            Phase 2: thuật ngữ, luật nghiệp vụ, dữ liệu, edge case
  ui-flow.md           Phase 2: màn hình và luồng, khi có giao diện
  architecture/        Phase 2: chi tiết backend, frontend, AI, khi cần
  conventions/         Phase 2 trở đi: quy tắc code máy không tự kiểm được
  prd.md               Phase 3: bản này làm gì, thế nào là đạt
  SPEC.md              Phase 3: tài liệu chính khi làm task
eval/plan.md           Phase 3: metric, dataset, ngưỡng, lịch chạy eval
.github/               Mẫu Issue và PR, CODEOWNERS, CI
```

## Quick start

1. Tạo repo bằng **Use this template**.
2. Đọc [playbook](docs/playbook/README.md): nguyên tắc, sáu phase và bảng Project types để biết dự án cần tài liệu
   nào.
3. Phase 0: điền [team.md](docs/team.md), bật branch protection cho `main`, tạo board GitHub Projects cho task.
4. Đi theo [phases.md](docs/playbook/phases.md). Mỗi phase ghi output, owner và exit criteria.
5. Xóa mẫu không dùng, ví dụ `ui-flow.md` và `architecture/frontend.md` khi sản phẩm không có giao diện.
6. Khi biến README này thành README của sản phẩm, giữ link tới playbook và [AGENTS.md](AGENTS.md).

## Tooling

- `.github/` dành cho GitHub. Dùng GitLab hoặc Jira thì chuyển mẫu Issue và PR sang công cụ đó, rồi ghi lựa chọn vào
  `team.md`.
- [CODEOWNERS](.github/CODEOWNERS) mới chỉ có ví dụ đã comment.
- CI hiện chỉ kiểm link nội bộ trong các file Markdown. `make setup` và `make check` trả lỗi "chưa được cấu hình" cho
  tới khi nhóm cấu hình theo stack ở Phase 2.

## License

[MIT](LICENSE)

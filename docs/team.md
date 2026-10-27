# Team: [tên dự án]

- **Status:** [Draft | Accepted]
- **Owner:** [Product]
- **Updated:** [YYYY-MM-DD]

> Điền ở Phase 0. Default nằm ở [working-agreement.md](playbook/working-agreement.md), [roles.md](playbook/roles.md)
> và [phases.md](playbook/phases.md); file này chỉ ghi người, công cụ và những chỗ nhóm làm khác default. Sửa qua PR,
> ghi lý do và ngày. Dòng in nghiêng là ví dụ, xóa khi điền.

## Goal and milestones

- **Goal:** [một câu]
- **Target release:** [YYYY-MM-DD]
- **Weekly review:** [thứ, giờ]

| Milestone | Target date | Scope |
|---|---|---|
| *M1* | *[YYYY-MM-DD]* | *Walking skeleton chạy trên staging* |

## Roles

| Role | Person | Code owner of |
|---|---|---|
| Product | [@handle] | `docs/brief.md`, `docs/prd.md`, `docs/domain.md` |
| Tech Lead | [@handle] | `docs/SPEC.md`, shared contract, migration |
| UX | [@handle] | `docs/ui-flow.md`, component dùng chung |
| AI/ML | [@handle] | Prompt, model, `docs/architecture/ai.md` |
| QA/Eval | [@handle] | `eval/` |
| Ops | [@handle] | CI, hạ tầng |

- **Business contact:** [người nắm nghiệp vụ ngoài nhóm, cách liên lạc]

## Tools

| Purpose | Choice |
|---|---|
| Code and review | [GitHub / GitLab] |
| Tracker | [GitHub Issues / Jira / …] |
| Chat | [tên công cụ] |
| AI agent | [Claude Code / Codex / Cursor / …] |
| Secrets | [password manager] |

## Deviations from default

| Topic | Default | Our choice | Reason | Decided by | Effective |
|---|---|---|---|---|---|
| *Merge* | *Squash merge* | *Rebase merge* | *Cần giữ từng commit để audit* | *[@handle]* | *[YYYY-MM-DD]* |

## Open decisions

| Question | Owner | Needed by | Impact if undecided |
|---|---|---|---|
| | | | |

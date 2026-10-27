---
name: Change Request
about: Đổi hành vi, interface, phạm vi, model hoặc eval đã chốt
title: "CR: "
labels: change-request
assignees: ""
---

> Dùng khi thay đổi thuộc loại cần CR trong `docs/playbook/change-control.md`. Mã CR là `CR-` cộng số Issue này.

## Change

- **Current:** [hành vi, interface hoặc quy tắc hiện tại; dẫn tới SPEC, PRD hoặc ADR]
- **Proposed:** [thay đổi đề xuất]
- **Why:** [nhu cầu hoặc bằng chứng]

## Type

- [ ] Behavior (Product duyệt)
- [ ] Interface, schema hoặc migration (Tech Lead duyệt)
- [ ] Scope or approach (Product duyệt)
- [ ] Model or provider (AI/ML duyệt)
- [ ] Eval: test set, nhãn, cách chấm hoặc ngưỡng (QA/Eval duyệt)

## Impact

| Area | Impact |
|---|---|
| User stories | [US-xxx] |
| Rules and data | [BR-xxx, schema] |
| Interfaces | [contract, bên dùng bị ảnh hưởng] |
| Eval | [metric, dataset cần đổi] |
| Cost and schedule | [ước tính] |

## Options

| Option | Pros | Cons |
|---|---|---|
| [phương án đề xuất] | | |
| Không đổi | | |

## Verification

[Sau khi đổi thì kiểm thế nào; có vấn đề thì quay lại bằng cách nào.]

## Decision

- **Decision:** [Approved | Rejected | Deferred]
- **Decided by:** [@handle], [YYYY-MM-DD]
- **Reason:** [một câu]
- **Follow-up PR:** [#PR cập nhật tài liệu, code và test]

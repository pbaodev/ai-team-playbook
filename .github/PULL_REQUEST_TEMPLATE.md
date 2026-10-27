## Summary

[Đổi gì và vì sao, 1–3 câu.]

## Links

- **Task:** [#issue]
- **SPEC:** [mục liên quan]
- **CR:** [CR-xxx nếu PR đổi hành vi đã chốt; bỏ nếu không]

## Risk

- [ ] PR đụng tới tiền, quyền, PII, prompt, model, migration hoặc shared contract, nên cần code owner duyệt

## Verification

| Check | Environment | Result |
|---|---|---|
| `make check` | [local / CI] | |
| [luồng đã thử tay] | [staging] | |

**AI changes:** eval trên dev set, trước và sau. Bỏ phần này nếu PR không đụng phần AI.

- **Dataset and version:** [dev set vN] · **Model and prompt:** [model ID, version prompt]

| Metric | Before | After |
|---|---|---|
| | | |

**Not verified:** [phần chưa kiểm và lý do]

## Deploy notes

[Migration, config, feature flag, việc cần theo dõi sau khi deploy. Bỏ nếu không có.]

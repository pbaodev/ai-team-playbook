---
name: Experiment
about: Thử một giả thuyết trong giới hạn thời gian và chi phí
title: "exp: "
labels: experiment
assignees: ""
---

> Kết quả experiment chưa phải quyết định. Muốn áp dụng vào sản phẩm thì mở Task; nếu đổi hướng thì viết ADR.

## Hypothesis

[Nếu làm X thì metric Y thay đổi thế nào, và vì sao cần biết.]

## Setup

- **Change:** [prompt, model, config hoặc phương pháp được thử]
- **Dataset:** [dev set và version; không dùng test set]
- **Baseline:** [so với gì]
- **Metric:** [metric và scorer, lấy từ eval plan nếu có]
- **Limit:** [thời gian và chi phí tối đa; chạm giới hạn thì dừng]

## Decision rule

[Kết quả thế nào thì áp dụng, thử tiếp hoặc dừng. Viết trước khi chạy.]

## Results

| Run | Version | Result | Cost |
|---|---|---|---|
| | | | |

[Ghi cả kết quả không ủng hộ giả thuyết.]

## Next step

[Adopt | Iterate | Stop], kèm link Task hoặc ADR.

# Eval plan: [tên dự án]

- **Status:** [Draft | Accepted | Superseded]
- **Owner:** [QA/Eval]
- **Updated:** [YYYY-MM-DD]
- **Related:** [PRD](../docs/prd.md) · [SPEC](../docs/SPEC.md) · [eval guide](../docs/playbook/eval.md)

> Plan ghi lựa chọn eval của dự án; cách chọn phương pháp xem ở eval guide. Ngưỡng chất lượng sản phẩm lấy từ Quality
> targets trong PRD. Sau khi test set freeze, việc đổi dataset, nhãn hoặc cách chấm đi theo
> [change-control.md](../docs/playbook/change-control.md). Dòng in nghiêng là ví dụ, xóa khi điền.

## Scope

- **Decisions:** [eval dùng để quyết định gì: merge PR, release, đổi model]
- **Measured:** [phần AI được đo]
- **Not measured:** [phần chưa đo và lý do]
- **Decision owner:** [ai chốt kết quả, ai duyệt thay đổi cách đo]

## Metrics

| Metric | Definition | Scorer | Threshold | Source |
|---|---|---|---|---|
| *Usable draft rate* | *Bản nháp gửi được mà không cần sửa nội dung* | *LLM judge theo rubric; người chấm lại 10% mẫu* | *≥ 80%* | *PRD Quality targets* |
| *Order ID exact match* | *Mã đơn trong bản nháp khớp với email* | *Code* | *100%* | *BR-002* |
| *Latency p95* | *Từ lúc nhận email tới lúc có bản nháp* | *Code* | *< 5 s* | *SPEC* |
| *Cost per request* | *Tổng chi phí LLM cho một email* | *Code* | *< $0.01* | *Brief Constraints* |

## Datasets

| Set | Purpose | Size | Source | Access | Version |
|---|---|---|---|---|---|
| Dev | Tinh chỉnh prompt và model; chạy khi task đụng phần AI | *80* | *Mẫu Phase 1, lỗi production* | Cả nhóm | *v3* |
| Test | Release gate | *40* | *Mẫu Phase 1, failure mode trong brief* | Chỉ QA/Eval chạy; không dùng để tinh chỉnh | *v1, frozen [YYYY-MM-DD]* |

- Ghi nguồn từng ca. Dữ liệu tổng hợp đánh dấu `synthetic`.
- Người rà nhãn khác người dựng ca.
- Ca mới từ production vào dev set ngay; vào test set ở version mới.
- Chỉ commit dữ liệu đã được phép đưa vào repo và đã ẩn danh.

## Baseline

[So với gì (bản trước, cách làm hiện tại hoặc một baseline đơn giản) và kết quả của baseline.]

## Runs

| When | Set | Run by | Blocks merge or release |
|---|---|---|---|
| PR đụng phần AI | Dev | Người làm task | Không; ghi kết quả trước và sau vào PR |
| Release gate | Test | QA/Eval | Có |
| Nhà cung cấp đổi model hoặc API | Dev | AI/ML | Có, trước khi dùng model mới |

- **Command:** [lệnh chạy eval]
- **Repeats:** [số lần chạy lặp và độ lệch cho phép giữa hai lần chạy]
- **Pinned:** [model ID và version, version prompt, config, version scorer]

## Results

| Date | Code / prompt / model | Set | Result | Notes |
|---|---|---|---|---|
| *[YYYY-MM-DD]* | *`a1b2c3d` / v4 / [model ID]* | *Dev v3* | *Usable 76%, order ID 100%, p95 4.1 s* | *Chưa đạt usable; lỗi chủ yếu ở email nhắc nhiều đơn* |

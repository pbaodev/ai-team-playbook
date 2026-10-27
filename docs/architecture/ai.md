# AI architecture

- **Status:** [Draft | Accepted | Superseded]
- **Owner:** [AI/ML]
- **Updated:** [YYYY-MM-DD]
- **Related:** [ARCHITECTURE](../../ARCHITECTURE.md) · ADR-0001 · [eval plan](../../eval/plan.md)

> Điền ở Phase 2 khi phần AI có hơn một lần gọi model; nếu chỉ một lần thì gộp vào ARCHITECTURE.md. Chỉ ghi phần AI
> thực sự có; không thêm hội thoại, tool hay agent cho đủ mẫu. Hướng tiếp cận và lý do chọn nằm ở ADR-0001. Dòng in
> nghiêng là ví dụ, xóa khi điền.

## Task

- **Input:** [AI nhận gì]
- **Output:** [AI tạo ra gì, ai dùng]
- **Approach:** [rule-based / prompt / RAG / fine-tune / train, theo ADR-0001]
- **Done by code:** [phần tính toán, kiểm quyền, so ngưỡng. LLM chọn, code tính.]
- **Needs a human:** [bước cần người xác nhận trước khi dùng kết quả]

## Pipeline

| Step | Input → Output | Model or service | Prompt or config | On failure |
|---|---|---|---|---|
| *extract* | *Email → mã đơn, lý do* | *[model ID]* | *`prompts/extract.md` v2* | *Thiếu mã đơn: trả `needs_info`, không đoán* |
| *compute* | *Mã đơn → số tiền hoàn* | *Code, không dùng LLM* | *`config/policy.yaml`* | *Không tìm thấy đơn: báo CSKH* |
| *draft* | *Thông tin đơn, chính sách → bản nháp* | *[model ID]* | *`prompts/draft.md` v4* | *Sai schema: gọi lại 1 lần, rồi báo lỗi* |

- **LLM calls in sequence:** [số lần gọi nối tiếp trong một request] · **Latency budget:** [p95]
- **Retrieval:** [nguồn, cách cập nhật index, ai được truy xuất gì]
- **Tools:** [contract, cách kiểm quyền, xử lý khi bị gọi lặp hoặc chưa biết kết quả]
- **State:** [lưu gì giữa các lượt, trong bao lâu]

Bỏ dòng không áp dụng.

## Guardrails

Chỉ ghi rủi ro có thật với sản phẩm, lấy từ failure mode trong brief. Status `Planned` nghĩa là chưa có bằng chứng
biện pháp đó đã hoạt động.

| Risk | Control | Where | Status |
|---|---|---|---|
| *Đầu ra sai định dạng* | *Validate theo JSON schema* | *`src/drafting/validate.py`* | *Done* |
| *Prompt injection qua nội dung email* | *Email đặt trong khối dữ liệu; tool chỉ có quyền đọc* | *[vị trí]* | *Planned* |
| *PII gửi tới provider* | *Che số điện thoại và địa chỉ trước khi gọi LLM* | *[vị trí]* | *Planned* |

## Versioning

- **Prompts:** [nơi lưu, cách đánh version]
- **Model:** [model ID; ghim version nếu provider hỗ trợ, nếu không thì ghi cách phát hiện provider đổi model]
- **By environment:** [phần nào khác nhau giữa staging và production]
- **Rollout:** [cách đưa prompt hoặc model mới vào dùng, cách quay lại bản cũ]

## Cost and latency

| Unit | Estimated | Measured | Budget |
|---|---|---|---|
| *Một email* | *$0.004, 3.2 s (spike Phase 1)* | *[link kết quả eval]* | *< $0.01, p95 < 5 s* |

## Training

Bỏ mục này nếu không train hoặc fine-tune.

- **Data:** [nguồn, cách chia train / validation / test, cách tránh leakage]
- **Experiments:** [nơi chạy, cách ghi tham số và kết quả]
- **Artifacts:** [nơi lưu model và version, cách quay lại version trước]
- **Before use:** [model phải đạt gì so với baseline trước khi đưa vào dùng]

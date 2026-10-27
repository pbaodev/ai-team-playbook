# Domain: [tên dự án]

- **Status:** [Draft | Accepted | Superseded]
- **Owner:** [Product]
- **Updated:** [YYYY-MM-DD]
- **Related:** [brief](brief.md) · [questions](discovery/questions.md) · [SPEC](SPEC.md)

> Điền ở Phase 2. Đây là nguồn chính cho thuật ngữ, luật nghiệp vụ, dữ liệu và edge case. SPEC, code, prompt và test
> dẫn mã `BR-xxx`, `EC-xxx` tới đây thay vì viết lại. Luật chưa được người nắm nghiệp vụ xác nhận thì để Status
> `Assumed` và dẫn mã `A-xxx`. Mục nào dài quá một màn hình thì tách thành file riêng và để link ở đây. Dòng in nghiêng
> là ví dụ, xóa khi điền.

## Glossary

Chỉ ghi từ mà người dùng, nghiệp vụ và code có thể hiểu khác nhau.

| Term | Meaning | Code name | Not to confuse with |
|---|---|---|---|
| *Yêu cầu hoàn tiền* | *Khách đề nghị trả lại tiền cho một đơn đã giao, kể cả khi chưa duyệt* | *`RefundRequest`* | *Hủy đơn: trước khi giao, không phát sinh hoàn tiền* |

## Business rules

Status: `Confirmed` khi người nắm nghiệp vụ đã xác nhận, `Assumed` khi đang dựa trên assumption, `Disputed` khi các
nguồn mâu thuẫn và chưa ai chốt. Luật `Disputed` không được đưa vào code.

| ID | When | Then | Source | Status |
|---|---|---|---|---|
| *BR-001* | *Khách yêu cầu hoàn trong 7 ngày kể từ khi nhận hàng* | *Hoàn 100% giá trị đơn* | *Chính sách đổi trả v2, mục 3* | *Confirmed* |
| *BR-002* | *Email nhắc tới mã đơn* | *Mã đơn trong bản nháp khớp từng ký tự với email* | *A-003* | *Assumed* |

### Parameters

Con số trong luật (phí, ngưỡng, thời hạn) đặt trong config, không hard-code. Bảng này ghi ý nghĩa và nơi lưu.

| Parameter | Meaning and unit | Value | Location | Used by |
|---|---|---|---|---|
| *`refund_window_days`* | *Số ngày từ khi nhận hàng mà khách còn được hoàn* | *7* | *`config/policy.yaml`* | *BR-001* |

## Data model

Ghi entity mà nghiệp vụ cần hiểu. Đã có schema thì dẫn link tới schema, không chép lại từng trường.

| Entity | Key attributes | Identifier and relations | Schema |
|---|---|---|---|
| *RefundRequest* | *Số tiền, lý do, trạng thái* | *`id`; thuộc một `Order`* | *`migrations/0003_refund.sql`* |

### States

| Entity | From | To | Trigger and actor | Rule |
|---|---|---|---|---|
| *RefundRequest* | *`pending`* | *`approved`* | *Nhân viên CSKH duyệt* | *BR-001* |

### Sensitive data

Mỗi đường dữ liệu ghi một dòng. Được phép dùng dữ liệu trong app không có nghĩa là được đưa vào repo, log, prompt,
dataset eval hay dịch vụ bên ngoài.

| Data | Purpose | Stored in / sent to | Access | Protection | Retention |
|---|---|---|---|---|---|
| *Số điện thoại khách* | *Liên hệ khi hoàn tiền* | *DB; không gửi cho LLM* | *CSKH* | *Che trong log và trace* | *Xóa sau 12 tháng* |

## Edge cases

Ca chưa biết cách xử lý thì ghi `Undecided` ở cột Expected handling và mở câu hỏi `Q-xxx`. Ca đã có link tới test
chưa có nghĩa là test đó đã chạy trên bản hiện tại.

| ID | Situation | Expected handling | Rule | Verified by |
|---|---|---|---|---|
| *EC-001* | *Email nhắc nhiều mã đơn* | *Bản nháp liệt kê từng đơn và hỏi khách đơn nào cần hoàn* | *BR-002* | *Eval nhóm `multi-order`* |

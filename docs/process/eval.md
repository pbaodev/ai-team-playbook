# Eval

> **Người đọc:** QA/Eval, AI/ML, và người review PR đụng phần AI. File này ghi luật eval chung của playbook. Chỉ số và
> ngưỡng của từng dự án ở `eval/plan.md`.

Gói eval gồm lõi chung và hai biến thể. Dự án chọn biến thể trong ADR chọn hướng ở GĐ1; fine-tune LLM áp dụng cả hai.

## Lõi chung

1. Định nghĩa chỉ số, ngưỡng và cách đo **trước khi** xây phần được đo. Mỗi chỉ số gắn với một hậu quả nghiệp vụ, bắt
   đầu từ 3–5 sai lầm nặng nhất đã liệt kê ở GĐ1.
2. Tách tập **dev** (dùng khi tinh chỉnh) và tập **test** (giữ riêng, chỉ để đo). Tập test đóng băng ở GĐ3; đổi dữ
   liệu, nhãn, cách tính hay ngưỡng phải qua CR.
3. Người tối ưu khác người rà nhãn.
4. Mỗi kết quả lưu kèm phiên bản: commit, dữ liệu, prompt, model, thời điểm.
5. Kịch bản tấn công (lộ PII, vượt quyền, prompt injection) và kịch bản lỗi tool nằm sẵn trong bộ eval.
6. Kết quả LLM dao động giữa các lần chạy: cố định cấu hình, chạy lặp, so trong sai số cho phép ghi ở `eval/plan.md`.

## Hai biến thể

| | Gọi API + prompt | Train hoặc fine-tune |
|---|---|---|
| Vai trò của dữ liệu | Chỉ để đo; tập dev dùng để chỉnh prompt | Vừa là nguyên liệu train vừa để đo: chia train, val, test |
| Rủi ro lớn nhất | Model của nhà cung cấp tự đổi; kết quả dao động | Rò dữ liệu giữa train và test: lọc trùng, chia theo thời gian hoặc theo người dùng |
| Gán nhãn | Vài trăm dòng, một người rà | Hàng nghìn dòng: hướng dẫn gán nhãn, đo độ đồng thuận giữa người gán |
| Baseline | Không bắt buộc | Bắt buộc: phải thắng model gọi API hoặc luật đơn giản |
| Quản lý phiên bản | Prompt, model | Dữ liệu, siêu tham số, seed, checkpoint |
| Thoái hoá | Đổi prompt làm hỏng ca cũ | Model mới quên năng lực chung: thêm bộ kiểm năng lực chung và an toàn |
| Khi chạy thật | Độ trễ, chi phí mỗi lượt | Thêm thông lượng khi serve, ảnh hưởng của lượng tử hoá, drift |
| Bàn giao | Báo cáo eval | Thêm model card |

## Dùng tập dữ liệu

- Tập vàng bắt đầu khoảng 50–100 dòng phủ các rủi ro lớn nhất. Mỗi lỗi phát hiện được thêm thành một dòng.
- Tập dev chạy ở mọi PR đụng phần AI. Tập test chỉ chạy ở cổng phát hành.
- Tập test lộ ra lỗi thì viết một ca tương tự vào tập dev để sửa, không sửa theo đúng câu trong tập test.
- Câu trong tập test không đưa vào prompt hay làm ví dụ mẫu.
- Định kỳ bổ sung vào tập test các ca mới lấy từ lỗi thật trên prod.

## Dữ liệu

- Chỉ dùng dữ liệu được phép dùng: công khai, mô phỏng, hoặc đã ẩn danh và kiểm không còn PII trước khi commit.
- Mỗi bộ ghi nguồn gốc: loại, cách tạo, người tạo, ngày, giới hạn khi dùng.
- Dữ liệu do AI sinh tính là mô phỏng, ghi `origin: ai_generated`; nhãn phải được người rà lại.

## Checklist PR đụng phần AI

Áp dụng thêm vào Definition of Done cho PR đổi prompt, model, tool, logic agent hoặc dữ liệu tri thức:

- [ ] Đã chạy eval tập dev liên quan, đính kèm kết quả trước và sau; không giảm quá sai số cho phép.
- [ ] Kịch bản tấn công vẫn đạt.
- [ ] Tool mới hoặc tool được sửa có audit log đủ trường, input đã che, và có kịch bản lỗi dẫn tới phản hồi an toàn.
- [ ] Ghi ảnh hưởng tới độ trễ và lượng token của luồng liên quan.

# Eval

> Trang này dành cho QA/Eval, AI/ML và người review PR có đụng tới phần AI. Đây là luật eval chung của playbook. Chỉ số
> và ngưỡng cụ thể của từng dự án nằm ở `eval/plan.md`.

Luật eval gồm phần chung cho mọi dự án và hai biến thể. Dự án chọn biến thể trong ADR chọn hướng ở GĐ1. Fine-tune LLM
thì áp dụng cả hai.

## Luật chung

1. Chốt chỉ số, ngưỡng và cách đo trước khi xây phần được đo. Chỉ số nào cũng phải gắn với một hậu quả nghiệp vụ, và nên
   bắt đầu từ 3–5 lỗi nặng nhất đã liệt kê ở GĐ1.
2. Tách dev set để tinh chỉnh và test set để đo. Test set giữ riêng và đóng băng ở GĐ3. Muốn đổi dữ liệu, nhãn, cách
   tính hay ngưỡng của test set thì phải có CR.
3. Người tối ưu và người rà nhãn phải là hai người khác nhau.
4. Kết quả eval nào cũng lưu kèm phiên bản: commit, dataset, prompt, model và thời điểm chạy.
5. Bộ eval phải có sẵn kịch bản tấn công (lộ PII, vượt quyền, prompt injection) và kịch bản tool lỗi.
6. Kết quả của LLM thay đổi giữa các lần chạy. Vì vậy phải cố định cấu hình, chạy lặp vài lần, và so sánh trong sai số
   cho phép đã ghi ở `eval/plan.md`.

## Hai biến thể

| | Gọi API + prompt | Train hoặc fine-tune |
|---|---|---|
| Dữ liệu dùng để làm gì | Chỉ để đo. Dev set dùng khi chỉnh prompt | Vừa để train vừa để đo, chia thành train, val, test |
| Rủi ro lớn nhất | Nhà cung cấp đổi model mà không báo, kết quả dao động giữa các lần chạy | Data leakage giữa train và test. Cần lọc trùng, chia theo thời gian hoặc theo người dùng |
| Gán nhãn | Vài trăm dòng, một người rà là đủ | Hàng nghìn dòng. Cần hướng dẫn gán nhãn và đo inter-annotator agreement |
| Baseline | Không bắt buộc | Bắt buộc. Model train ra phải thắng model gọi API hoặc một luật đơn giản |
| Quản lý phiên bản | Prompt, model | Dataset, hyperparameter, seed, checkpoint |
| Regression | Sửa prompt xong, những ca trước đây đúng giờ lại sai | Model mới quên năng lực chung. Cần thêm bộ kiểm năng lực chung và an toàn |
| Khi chạy thật | Latency và chi phí mỗi lượt | Thêm throughput khi serve, ảnh hưởng của quantization, drift |
| Bàn giao | Báo cáo eval | Báo cáo eval và model card |

## Dùng dev set và test set

- Golden set bắt đầu khoảng 50–100 dòng, phủ những rủi ro lớn nhất. Gặp lỗi nào thì thêm lỗi đó thành một dòng mới.
- Dev set chạy ở mọi PR đụng tới phần AI. Test set chỉ chạy ở release gate.
- Nếu test set lộ ra lỗi, viết một ca tương tự vào dev set rồi sửa theo ca đó. Không sửa theo đúng câu trong test set.
- Không đưa câu nào trong test set vào prompt hay dùng làm ví dụ mẫu.
- Định kỳ thêm vào test set những ca mới lấy từ lỗi thật trên prod.

## Dữ liệu

- Chỉ dùng dữ liệu được phép dùng: dữ liệu công khai, dữ liệu mô phỏng, hoặc dữ liệu đã ẩn danh và đã kiểm không còn PII
  trước khi commit.
- Dataset nào cũng ghi nguồn gốc: loại dữ liệu, cách tạo, ai tạo, ngày tạo, và giới hạn khi dùng.
- Dữ liệu do AI sinh ra được tính là dữ liệu mô phỏng, ghi `origin: ai_generated`, và nhãn phải có người rà lại.

## Checklist cho PR đụng tới phần AI

Ngoài Definition of Done, PR đổi prompt, model, tool, logic agent hoặc dữ liệu tri thức cần thêm:

- [ ] Đã chạy eval trên dev set, đính kèm kết quả trước và sau, và không giảm quá sai số cho phép.
- [ ] Kịch bản tấn công vẫn đạt.
- [ ] Tool mới hoặc tool bị sửa có audit log đủ trường, input đã che PII, và có kịch bản lỗi cho thấy agent phản hồi an
      toàn.
- [ ] Ghi ảnh hưởng tới latency và số token của luồng liên quan.

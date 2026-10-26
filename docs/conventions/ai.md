# Convention AI

> Cách viết prompt và code có đụng tới LLM, bổ sung cho [`general.md`](general.md). AI/ML giữ file này. Cấu trúc agent
> xem ở `docs/architecture/ai.md`, cách đo xem ở [`eval.md`](../process/eval.md).

## Prompt

1. Mỗi prompt một file riêng và có phiên bản. Kết quả eval ghi kèm phiên bản prompt đã dùng.
2. Prompt không chứa luật nghiệp vụ hay con số. Những thứ đó nằm trong `docs/domain/` và config, code đưa vào prompt khi
   cần.
3. Không đưa câu nào trong test set vào prompt hay dùng làm ví dụ mẫu.

## Gọi LLM

4. LLM chọn, code tính. Tiền, quyền, ngưỡng và các mã nghiệp vụ do code quyết định.
5. Đầu ra của LLM phải có schema và được validate. Sai schema thì gọi lại một lần, vẫn sai thì đi theo đường dự phòng đã
   định sẵn.
6. Model và tham số theo từng vai (phân loại, trả lời, tóm tắt…) để trong config, và luôn ghim phiên bản model.
7. Che PII trước khi gửi nội dung cho LLM.
8. Lời gọi LLM nào cũng ghi usage (token, latency, model) và trace. Trace cũng phải che PII.

## Tool

9. Tool nào cũng có contract rõ ràng: tham số, kết quả, mã lỗi.
10. Tool đọc được phép thử lại. Tool ghi không tự thử lại khi chưa rõ lần trước đã chạy hay chưa.
11. Tool ghi chỉ chạy sau khi người dùng xác nhận, nếu spec yêu cầu bước xác nhận.
12. Mỗi lần gọi tool ghi audit log: tên tool, input đã che PII, output, latency, trạng thái.

## Test

13. Unit test dùng LLM giả với kịch bản cố định. Hành vi thật của LLM đo bằng eval, không đo bằng unit test.

## Train

14. Mỗi thí nghiệm một file config, ghim seed và phiên bản dữ liệu.
15. Notebook chỉ dùng để khám phá, không merge vào `main`. Code cần dùng lâu thì chuyển thành script có test.
16. Model đã train lưu vào registry, kèm phiên bản dữ liệu, config và kết quả eval.

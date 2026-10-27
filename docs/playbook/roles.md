# Roles

Sáu vai mặc định. Vai là người giữ và chốt một mảng, không phải người duy nhất được làm mảng đó: ai cũng có thể viết
nháp hoặc mở PR vào mảng khác, còn người giữ vai review và chốt. Ai giữ vai nào ghi tại [team.md](../team.md).

## Roles and decisions

| Role | Owns | Decides |
|---|---|---|
| Product | Phạm vi, ưu tiên, milestone; brief, PRD, domain, questions; đầu mối với người ngoài nhóm | `Go`/`Pivot`/`Stop`, nghiệm thu, CR về phạm vi |
| Tech Lead | Kiến trúc, ADR, SPEC, shared contract, convention, chia task | ADR kỹ thuật, CR kỹ thuật, shared contract, migration |
| UX | UI flow, design system, frontend architecture; thường do frontend engineer giữ | Thiết kế màn hình, component dùng chung |
| AI/ML | Pipeline hoặc agent, prompt, model, RAG, AI architecture, ADR-0001 | Thay đổi prompt và model |
| QA/Eval | Eval plan, dataset, golden set, rà nhãn | Release gate, thay đổi test set |
| Ops | CI, staging, deploy, monitoring, runbook, secret | Deploy production, rollback |

Người đặt hàng hoặc người nắm nghiệp vụ ở ngoài nhóm trả lời câu hỏi và xác nhận luật nghiệp vụ; Product là đầu mối.

## Staffing

| Team size | Default |
|---|---|
| 6 trở lên | Mỗi vai một người; người thêm vào làm feature và review theo mảng mình rành |
| 5 | QA/Eval kiêm Ops, vì cả hai cùng lo pipeline (CI, staging, chạy eval) và việc Ops dồn chủ yếu vào đầu dự án |
| 3–4 | Product kiêm QA/Eval; Tech Lead kiêm Ops; UX do người làm frontend giữ |
| 1–2 | Một người giữ nhiều vai. Ghi trong `team.md` phần nào chưa có review độc lập, bù bằng AI review và eval tự động |

Giữ QA/Eval tách khỏi AI/ML khi có thể, để người đo không đồng thời là người đang tối ưu cho đạt chỉ số.

## During build

- **Ai làm gì:** chia theo feature hoặc vertical slice. Một người cùng agent làm trọn một feature, cả backend, frontend
  và AI, nên không ai phải chờ người khác ở chỗ giao giữa các tầng.
- **Ai duyệt:** người giữ vai là code owner của mảng mình, khai trong [CODEOWNERS](../../.github/CODEOWNERS). Khi ai đó
  sửa vào mảng không phải chuyên môn của họ, vẫn có người rành mảng đó duyệt.
- **Khi đổi người:** cập nhật `team.md`, CODEOWNERS và quyền truy cập trong cùng một PR.

## Conflicts of interest

- Không tự duyệt PR của chính mình.
- Người viết CR không là người duyệt duy nhất.
- Người tối ưu prompt hoặc model không rà nhãn test set.
- Tài liệu muốn chuyển sang `Accepted` cần ít nhất một người khác người viết duyệt.

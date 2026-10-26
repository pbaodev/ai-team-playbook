# Vai trò

> Trang này dành cho cả nhóm lúc phân vai ở kickoff, và cho người review khi cần biết ai phải duyệt PR. Ai giữ vai nào
> trong dự án thì ghi ở [`team.md`](team.md).

Vai là người giữ và chốt một mảng, không phải người duy nhất được làm mảng đó. Giai đoạn nào thì mọi người cũng có việc.
Ai cũng có thể viết nháp, góp ý hay mở PR vào mảng của người khác, còn người giữ vai sẽ review và chốt.

## Năm vai

| Vai | Phụ trách | Có quyền chốt |
|---|---|---|
| PM + BA | Phạm vi, thứ tự ưu tiên, lịch; `brief.md`, `prd.md`, `domain/`, sổ câu hỏi; làm đầu mối với người ngoài nhóm | Nghiệm thu, CR về phạm vi |
| Tech Lead (TL) | Kiến trúc, ADR, `SPEC.md`, shared contract, convention, `tasks/plan.md` | ADR, CR kỹ thuật, shared contract, migration |
| SWE frontend (FE) | `ui-flow.md`, design system, `architecture/frontend.md` | Thiết kế màn hình, component dùng chung |
| AI/ML | Agent hoặc pipeline, prompt, model, RAG, `architecture/ai.md` | Thay đổi prompt và model |
| QA/Eval + DevOps | `eval/plan.md`, dataset, CI, staging, deploy, monitoring | Release gate |

Ngoài nhóm còn có người đặt hàng hoặc người nắm nghiệp vụ. Họ trả lời câu hỏi và xác nhận luật nghiệp vụ, PM là người
liên lạc với họ.

## Ghép người

| Nhóm | Cách ghép |
|---|---|
| 5 người | Mỗi người một vai như bảng trên |
| 4 người | PM/BA kiêm luôn rà nhãn eval và tổ chức cho người dùng thử. Phần DevOps chuyển sang TL |
| Hơn 5 người | Thêm người làm feature. Vai giữ nguyên, người mới review theo mảng mình rành |

QA/Eval nên tách khỏi AI/ML, để người đo không đồng thời là người đang cố tối ưu cho đạt chỉ số. QA/Eval kiêm DevOps là
hợp lý vì cả hai cùng lo pipeline (CI, staging, chạy eval), và việc DevOps chủ yếu dồn vào đầu dự án.

## Lúc build

Lúc build, việc được chia theo một cách, còn trách nhiệm review theo một cách khác.

- **Ai làm gì:** chia theo feature hoặc vertical slice. Một người cùng agent làm trọn một feature, cả backend, frontend
  và AI. Như vậy không ai phải ngồi chờ người khác, và cũng ít đụng nhau ở chỗ giao giữa các tầng.
- **Ai duyệt:** người giữ vai là code owner của mảng mình, khai trong CODEOWNERS. Nhờ vậy, khi ai đó sửa vào mảng không
  phải chuyên môn của họ, vẫn có người rành mảng đó duyệt.

## Tránh xung đột lợi ích

- Không tự duyệt PR của chính mình.
- Người viết CR không được là người duyệt duy nhất.
- Người tối ưu prompt không rà nhãn test set.
- Tài liệu nào muốn chốt cũng phải có ít nhất một người khác người viết duyệt.

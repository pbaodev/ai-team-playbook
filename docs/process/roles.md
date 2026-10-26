# Vai trò

> **Người đọc:** cả nhóm khi chia vai ở kickoff, và người review khi xác định ai phải duyệt. File này ghi mỗi vai giữ gì,
> chốt gì, cách ghép người, và luật tránh xung đột. Ai giữ vai nào trong dự án ghi ở [`team.md`](team.md).

**Vai là người giữ và chốt một mảng, không phải người duy nhất được làm.** Giai đoạn nào mọi người cũng có việc. Ai
cũng được viết nháp, góp ý và mở PR vào mảng của vai khác; người giữ vai review và chốt.

## Năm vai

| Vai | Giữ | Chốt |
|---|---|---|
| PM + BA | Phạm vi, ưu tiên, lịch; `brief.md`, `prd.md`, `domain/`, sổ câu hỏi; đầu mối với người ngoài nhóm | Nghiệm thu, CR về phạm vi |
| Tech Lead (TL) | Kiến trúc, ADR, `SPEC.md`, hợp đồng chung, convention, `tasks/plan.md` | ADR, CR kỹ thuật, hợp đồng chung, migration |
| SWE frontend (FE) | `ui-flow.md`, design system, `architecture/frontend.md` | Thiết kế màn hình, thành phần giao diện dùng chung |
| AI/ML | Agent hoặc pipeline, prompt, model, RAG, `architecture/ai.md` | Thay đổi prompt, model |
| QA/Eval + DevOps | `eval/plan.md`, bộ dữ liệu, CI, staging, deploy, giám sát | Cổng phát hành |

**Ngoài nhóm:** người đặt hàng hoặc người nắm nghiệp vụ trả lời câu hỏi và xác nhận luật nghiệp vụ. PM là đầu mối.

## Ghép người

| Nhóm | Ghép |
|---|---|
| 5 người | Mỗi người một vai như bảng trên |
| 4 người | PM/BA kiêm rà nhãn eval và cho người dùng thử; DevOps chuyển về TL |
| Hơn 5 người | Thêm SWE làm feature; vai không đổi, người thêm vào review theo mảng mình quen |

QA/Eval tách khỏi AI/ML để người đo không đồng thời là người tối ưu cho đạt chỉ số. QA/Eval ghép với DevOps vì cả hai
giữ đường ống (CI, staging, bộ chạy eval) và việc DevOps dồn nhiều vào đầu dự án.

## Lúc build: hai trục

- **Ai làm:** chia theo feature hoặc lát dọc. Một người cùng agent làm trọn một feature, cả BE, FE và AI. Cách này
  tránh chờ nhau và đụng nhau ở ranh giới giữa các tầng.
- **Ai giữ chất lượng:** người giữ vai là người review bắt buộc của mảng đó, khai trong CODEOWNERS. PR đụng mảng ngoài
  chuyên môn của người viết vẫn có người hiểu mảng đó duyệt.

## Tránh xung đột

- Người viết code không tự duyệt PR của mình.
- Người viết CR không là người duyệt duy nhất.
- Người tối ưu prompt không rà nhãn tập test.
- Mỗi tài liệu chốt có ít nhất một người khác người viết đã duyệt.

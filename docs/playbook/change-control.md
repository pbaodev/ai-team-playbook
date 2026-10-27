# Change control

Áp dụng sau Exit criteria của Phase 3, khi PRD, SPEC và eval plan đã `Accepted`. Trước mốc đó, mọi thay đổi đi qua
PR bình thường. Nhóm làm khác default ở đây thì ghi vào [team.md](../team.md).

## Classify the change

| Type | Example | Process | Approved by |
|---|---|---|---|
| Fix | Code làm khác SPEC | Issue Bug, PR thường | Reviewer |
| Clarification | SPEC mơ hồ; bổ sung mà không đổi hành vi | PR sửa SPEC, ghi Changelog | Tech Lead |
| Behavior | Đổi acceptance criteria hoặc hành vi AI mà người dùng thấy | CR | Product |
| Interface | Đổi shared contract, schema, migration | CR | Tech Lead |
| Scope or approach | Thêm hoặc bỏ user story; đổi hướng AI | CR; cập nhật PRD hoặc viết ADR mới | Product |
| Model or provider | Đổi model, nhà cung cấp, hoặc model được provider cập nhật | CR, kèm eval trên dev set | AI/ML |
| Eval | Đổi test set, nhãn, cách chấm hoặc ngưỡng | CR | QA/Eval |

Mức ảnh hưởng không tính theo số dòng code: sửa một câu prompt có thể đổi hành vi nhiều hơn viết lại cả một module.
Không chắc thay đổi thuộc loại nào thì chọn loại nặng hơn.

## CR process

1. Người đề xuất mở Issue theo [mẫu Change Request](../../.github/ISSUE_TEMPLATE/change_request.md). Mã CR là `CR-`
   cộng số Issue, ví dụ `CR-42`.
2. Người duyệt theo bảng trên quyết định và ghi lý do vào Issue. Người viết CR không là người duyệt duy nhất.
3. Một PR cập nhật cùng lúc tài liệu nguồn (PRD, SPEC, domain hoặc ADR), code và test. SPEC tăng version, và
   Changelog ghi mã CR.
4. CR đóng khi PR đã merge. Việc cần theo dõi sau thay đổi ghi vào Issue.

Không sửa một quyết định đã `Accepted` để trông như phương án mới được chọn từ đầu. ADR cũ chuyển sang
`Superseded by ADR-NNNN`.

## Eval changes

- Test set đã freeze thì không sửa tại chỗ. Thêm, bỏ ca hoặc sửa nhãn đều tạo version mới, kèm lý do ghi trong
  eval plan.
- Sau khi đổi ngưỡng hoặc cách chấm, chạy lại baseline. Kết quả theo cách chấm cũ và mới không so trực tiếp được.
- Không hạ ngưỡng rồi báo kết quả như đã đạt chuẩn cũ.

## Emergencies

Khi có sự cố Severe (xem Incident ở Phase 5 trong [phases.md](phases.md)), Ops hoặc người đang xử lý được rollback, tắt
tính năng hoặc thu hồi key mà không cần chờ CR. Trong 48 giờ, người đó mở CR hoặc Bug ghi lại thay đổi đã làm và cập
nhật tài liệu liên quan.

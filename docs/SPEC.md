# SPEC: [tên dự án]

- **Status:** [Draft | Accepted | Superseded]
- **Version:** [v1.0]
- **Owner:** [Tech Lead]
- **Updated:** [YYYY-MM-DD]
- **Related:** [PRD](prd.md) · [ARCHITECTURE](../ARCHITECTURE.md) · [eval plan](../eval/plan.md)

> SPEC là tài liệu chính khi làm task: người và agent đọc mục liên quan trước khi sửa code. SPEC ghi hệ thống phải hoạt
> động thế nào; bối cảnh nằm ở brief, lý do chọn nằm ở ADR. Sau khi `Accepted`, mọi thay đổi đi theo
> [change-control.md](playbook/change-control.md) và được ghi vào Changelog. Dòng in nghiêng là ví dụ, xóa khi điền.

## Overview

[Hệ thống làm gì, 2–3 câu. Sơ đồ thành phần nằm ở ARCHITECTURE.md.]

## Modules

| Module | Responsibility | Path | Owner |
|---|---|---|---|
| *drafting* | *Sinh bản nháp trả lời từ email và chính sách* | *`src/drafting/`* | *AI/ML* |

## Interfaces

Ghi nơi lưu contract thay vì chép lại nội dung.

| Interface | Provider → Consumer | Contract | Errors |
|---|---|---|---|
| *`POST /drafts`* | *api → web* | *`contracts/openapi.yaml`* | *`422` khi email thiếu mã đơn* |

## Behavior

Mỗi user story một mục, dẫn mã luật nghiệp vụ và edge case liên quan.

### US-001: [tên]

- **Flow:** [các bước từ đầu vào tới kết quả]
- **Rules:** [BR-xxx]
- **Edge cases:** [EC-xxx và cách xử lý]
- **AI behavior:** [đầu vào, đầu ra; khi thiếu thông tin hoặc không chắc thì hệ thống làm gì]

## Traceability

| Requirement | Modules | Tests and eval |
|---|---|---|
| *US-001* | *drafting, api* | *`tests/test_drafts.py`; eval nhóm `missing-order-id`* |

## Commands

| Purpose | Command |
|---|---|
| Setup | `make setup` |
| Lint, type check, test | `make check` |
| Eval trên dev set | [lệnh] |
| Chạy local | [lệnh] |

## Test strategy

- **Unit:** [phạm vi; LLM và dịch vụ ngoài được mock]
- **Integration:** [kết nối và contract thật, chạy ở môi trường nào]
- **Eval:** dev set khi task đụng phần AI; test set chỉ chạy ở release gate, theo eval plan.
- **E2E:** [luồng chính chạy trên staging]

## Boundaries

Default cho cả người và agent; sửa theo dự án.

- **Always:** làm trong phạm vi task; viết test cho hành vi mới; chạy `make check` trước khi mở PR; ghi rõ đã kiểm gì
  và chưa kiểm gì.
- **Ask first:** thêm dependency hoặc dịch vụ; đổi shared contract, schema hoặc migration; đổi prompt hoặc model ngoài
  phạm vi task; sửa file trong mục Shared files.
- **Never:** commit secret hoặc dữ liệu thật của người dùng; sửa test set đã freeze; push thẳng `main`, force-push hoặc
  dùng `--no-verify`.

## Shared files

File nhiều người cùng sửa và cách phối hợp.

| Path | Rule |
|---|---|
| *`migrations/`* | *Một migration mỗi PR; báo trong kênh nhóm trước khi merge* |
| *`eval/datasets/test/`* | *Chỉ QA/Eval sửa, và chỉ ở version mới* |

## Changelog

| Version | Date | Change | CR |
|---|---|---|---|
| *v1.0* | *[YYYY-MM-DD]* | *Bản đầu, duyệt cuối Phase 3* | *—* |

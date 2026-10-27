# AGENTS.md

Hướng dẫn cho AI agent (Claude Code, Codex, Cursor…) làm việc trong repo. Trang này chỉ ra cần đọc gì trước khi làm và
những luật luôn áp dụng; nội dung chi tiết nằm ở các file được dẫn tới.

## Read first

| Task | Read |
|---|---|
| Mọi task | Task trên tracker; mục liên quan và Boundaries trong [SPEC](docs/SPEC.md); [team.md](docs/team.md) |
| Sửa code | Modules và Interfaces trong SPEC; [conventions](docs/conventions/README.md); ADR liên quan trong [decisions](docs/decisions/README.md) |
| Đụng luật nghiệp vụ hoặc dữ liệu | [domain.md](docs/domain.md) |
| Đụng prompt, model, retrieval hoặc tool | [AI architecture](docs/architecture/ai.md), [eval plan](eval/plan.md), [eval guide](docs/playbook/eval.md) |
| Viết hoặc sửa tài liệu | [documents.md](docs/playbook/documents.md) |
| Đổi hành vi đã ghi trong SPEC | [change-control.md](docs/playbook/change-control.md) |

`docs/playbook/` là hướng dẫn của template; mọi file khác trong `docs/` là tài liệu của dự án. Chỉ tài liệu có Status
`Accepted` là đã chốt. Mục còn trống, dòng in nghiêng và tài liệu `Draft` hoặc `Proposed` chưa phải quyết định.

## Commands

Lệnh của dự án nằm ở mục Commands trong [SPEC](docs/SPEC.md#commands). Khi nhóm chưa cấu hình, `make setup` và
`make check` in thông báo "chưa được cấu hình" và trả lỗi. Lúc đó repo chưa có lệnh nào kiểm được ứng dụng.

## Tasks

Task, bug và CR nằm trên tracker ghi ở mục Tools của [team.md](docs/team.md); default là GitHub Issues kèm board
GitHub Projects. Task chỉ nằm ở tracker: không tạo `tasks/todo.md` hay danh sách task khác trong repo. PR ghi
`Closes #123` để task tự đóng khi merge.

## Rules

- Chỉ sửa trong phạm vi task. Cần sửa ngoài phạm vi thì hỏi trước.
- SPEC, tài liệu và code nói khác nhau thì dừng phần bị ảnh hưởng và hỏi người giữ tài liệu đó. Không tự chọn một bên.
- Làm theo Boundaries trong SPEC: việc ở mục Ask first thì hỏi trước, việc ở mục Never thì không làm.
- Nhánh, commit và PR theo [working-agreement.md](docs/playbook/working-agreement.md); mỗi task một PR. Không push hay
  merge khi chưa được yêu cầu, không push thẳng `main`, không force-push, không dùng `--no-verify`.
- Không thêm thư viện hay dịch vụ khi Tech Lead chưa đồng ý. Không sửa test set đã freeze.
- Không đưa secret hay dữ liệu thật của người dùng vào code, test, log, prompt mẫu hay PR.

## Using agent-skills

Skill của agent-skills có nơi lưu mặc định riêng. Trong repo này, theo cột bên phải.

| Skill | Default của skill | Trong repo này |
|---|---|---|
| `/spec` | `SPEC.md` theo cấu trúc của skill | Sửa [docs/SPEC.md](docs/SPEC.md) theo mẫu sẵn có |
| `/plan` | `tasks/plan.md`, `tasks/todo.md` | Tạo task trên tracker. Quyết định ghi ADR, rủi ro ghi brief, câu hỏi ghi `questions.md`, thứ tự theo milestone |
| `/build` | Lấy task kế tiếp trong `tasks/todo.md` | Làm task được giao trên tracker |
| `/constraints` | `CONSTRAINTS.md` | Boundaries trong SPEC, ngưỡng trong eval plan, quy tắc code trong `docs/conventions/` |
| Git workflow | Nhánh `feature/<desc>`, không squash | Theo [working-agreement.md](docs/playbook/working-agreement.md) |
| ADR | `docs/decisions/` | Theo [_template.md](docs/decisions/_template.md), thêm một dòng vào [index](docs/decisions/README.md) |

## Reporting

Khi báo kết quả hoặc viết PR, ghi đã đổi gì, đã chạy lệnh gì ở môi trường nào (local, CI, staging), kết quả ra sao và
phần nào chưa kiểm. Đọc code hay đọc thiết kế không phải bằng chứng là code đã chạy đúng.

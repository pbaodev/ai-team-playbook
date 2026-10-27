# Phases

Sáu phase từ kickoff tới vận hành, dùng chung một khung: Goal, Input, Output, Owner, Exit criteria, Activities và
Variations. Bảng tóm tắt nằm ở [playbook/README.md](README.md).

- **Default:** owner, con số và thứ tự trên trang này là mặc định cho nhóm 3–6 người làm sản phẩm có người dùng thật.
  Nhóm chỉ ghi vào [team.md](../team.md) những chỗ làm khác.
- **Owner** là vai trong [roles.md](roles.md): Product, Tech Lead, UX, AI/ML, QA/Eval, Ops. Một người có thể giữ
  nhiều vai.
- **Exit criteria** chặn việc chốt, không chặn việc bắt đầu. Việc của phase sau có thể làm nháp từ sớm.
- **Variations** ghi cách làm khác default theo từng điều kiện, ví dụ PoC, nhóm nhỏ hoặc chưa có dữ liệu thật.
- Sau Exit criteria của Phase 3, thay đổi hành vi đã cam kết đi theo [change-control.md](change-control.md).

## Phase 0 — Kickoff

**Goal:** Nhóm thống nhất cách phối hợp và có repo, tracker, kênh trao đổi dùng được.

- **Input:** Template này, danh sách thành viên.
- **Output:** [team.md](../team.md), repo đã bật branch protection cho `main`.
- **Owner:** Product.
- **Exit criteria:** `team.md` đã merge; `main` được bảo vệ; CI chạy trên mỗi PR; secret dùng chung đã nằm trong
  password manager.

**Activities**

1. Kickoff: mục tiêu, các milestone dự kiến, lịch review hằng tuần.
2. Phân vai theo [roles.md](roles.md).
3. Đọc [working-agreement.md](working-agreement.md); ghi vào `team.md` những chỗ nhóm làm khác default.
4. Chọn công cụ: Git host, tracker, kênh chat, nơi lưu secret.
5. Tạo repo từ template, bật branch protection cho `main`, điền [CODEOWNERS](../../.github/CODEOWNERS) nếu dùng.
6. Lưu tài khoản hạ tầng và key dùng chung vào password manager, ít nhất hai người truy cập được.
7. Mỗi người tạo API key LLM riêng, có giới hạn chi tiêu.

Bước 1–4 làm trong buổi kickoff.

**Variations**

- Nhóm 1–2 người: bỏ CODEOWNERS và review bắt buộc; `team.md` chỉ cần mục công cụ và secret.

## Phase 1 — Discovery

**Goal:** Hiểu đúng bài toán và chọn hướng giải quyết bằng thử nghiệm trên mẫu thật, kể cả khả năng không dùng AI.

- **Input:** Yêu cầu ban đầu; người dùng hoặc người nắm nghiệp vụ.
- **Output:** [brief](../brief.md), [request](../discovery/request.md), [questions](../discovery/questions.md),
  ADR-0001 chọn hướng AI.
- **Owner:** Product. AI/ML giữ spike và ADR-0001.
- **Exit criteria:** Brief và ADR-0001 ở trạng thái `Accepted`; ADR-0001 có kết quả spike và chi phí ước tính; mọi câu
  hỏi `blocks-spec` đã gửi tới đúng người; mục Decision của brief ghi `Go`, `Pivot` hoặc `Stop`.

**Activities**

1. Lưu yêu cầu gốc vào `request.md`. Khi có bổ sung, thêm dòng mới; không sửa nội dung đã nhận.
2. Mở `questions.md`, đánh mã `Q-001`, `Q-002`… và gắn mức chặn: `blocks-spec`, `blocks-build` hoặc `nice-to-know`.
   Câu chưa có trả lời mà vẫn phải làm tiếp thì ghi thành assumption, kèm hậu quả nếu sai.
3. Gặp ít nhất 3 người dùng hoặc người nắm nghiệp vụ; thu 20–50 mẫu thật và ẩn danh trước khi đưa vào repo.
4. Kiểm kê dữ liệu: nguồn, quyền sử dụng, PII. Dự án train thì đánh giá thêm dữ liệu có đủ để train không.
5. Liệt kê 3–5 failure mode nặng nhất mà phần AI có thể gây ra, ghi vào mục Risks của brief. Danh sách này là đầu vào
   cho eval plan ở Phase 3.
6. Spike trên mẫu thật với giới hạn thời gian và chi phí đặt trước: prompt thử hoặc baseline. Ghi chỗ sai, latency và
   chi phí ước tính.
7. Viết ADR-0001 chọn hướng: rule-based, prompt, RAG, fine-tune, train hoặc không dùng AI.
8. Hoàn thiện brief từ kết quả các bước trên.

**Guidelines**

- Chỉ Product hỏi người ngoài nhóm, và gửi kèm mã `Q-xxx`, để người được hỏi không nhận cùng một câu từ nhiều người.
- Câu trả lời nhận qua chat được chép vào `questions.md`, ghi người trả lời và ngày.
- Kết quả spike trên vài chục mẫu chỉ đủ để chọn hướng, chưa phải bằng chứng về chất lượng sản phẩm.

**Variations**

- PoC nội bộ: ghi kết quả spike và hướng chọn trong mục Solution của brief, không cần ADR-0001; bỏ bước 3 nếu người
  đặt hàng cũng là người dùng.
- Chưa được phép dùng dữ liệu thật: dùng mẫu tổng hợp và ghi rõ trong ADR-0001 rằng kết quả spike chưa đại diện cho
  dữ liệu thật.

## Phase 2 — Design

**Goal:** Chốt kiến trúc, luật nghiệp vụ, luồng giao diện và shared contract, để các feature làm song song được.

- **Input:** Brief, ADR-0001, câu trả lời trong `questions.md`.
- **Output:** [ARCHITECTURE.md](../../ARCHITECTURE.md), [domain](../domain.md), [UI flow](../ui-flow.md),
  [backend](../architecture/backend.md) / [frontend](../architecture/frontend.md) / [AI](../architecture/ai.md) cho
  phần cần chi tiết, [ADR](../decisions/README.md), shared contract, staging.
- **Owner:** Tech Lead. Product duyệt domain; UX duyệt UI flow; AI/ML viết phần AI.
- **Exit criteria:** Mọi quyết định lớn có ADR `Accepted`; shared contract đã merge; câu hỏi `blocks-spec` đã có trả
  lời hoặc thành assumption được duyệt; staging deploy được; mỗi tài liệu có ít nhất một người khác người viết duyệt.

**Activities**

1. Viết domain: glossary, business rule có mã `BR-xxx`, data model, edge case có mã `EC-xxx`.
2. Viết ADR cho các quyết định lớn: stack, lưu trữ dữ liệu, auth, bảo mật, hạ tầng.
3. Viết `ARCHITECTURE.md`: sơ đồ tổng, luồng chính end-to-end, cách deploy.
4. Viết `architecture/ai.md`: pipeline hoặc agent graph, prompt và model cho từng bước, guardrail, số lần gọi LLM nối
   tiếp trong một request và ngân sách latency.
5. Nếu có giao diện: viết `ui-flow.md` và `architecture/frontend.md`. Màn hình tải dữ liệu cần trạng thái loading,
   empty và error.
6. Chốt shared contract: DB schema, API, event, agent state, tool contract.
7. Chọn phương pháp eval theo [eval.md](eval.md): chỉ số, cách chấm, loại dataset, cách chia tập. Dự án train thêm
   hướng dẫn gán nhãn.
8. Cấu hình `make setup`, `make check` và CI theo stack; dựng staging và pipeline deploy.
9. Ghi vào [conventions](../conventions/README.md) những quy tắc mà linter và formatter không tự kiểm được.

**Guidelines**

- LLM chọn, code tính: tiền, quyền và ngưỡng nằm trong code hoặc config, không nằm trong prompt.
- Che PII ở mọi đường dữ liệu vào hệ thống và log, không chỉ ở nội dung gửi cho LLM.
- Mỗi feature thêm module, node hoặc tool của riêng nó, không phải sửa một file trung tâm. File ai cũng sửa sẽ thành
  điểm conflict thường xuyên.
- Assumption là con số (ngưỡng, phí, thời hạn) thì đặt trong config thay vì hard-code.
- Đổi shared contract đã merge thì báo cả nhóm. Từ Phase 3 trở đi, việc đổi contract đi qua CR.

**Variations**

- PoC: chưa cần staging và ADR hạ tầng.
- Phần AI chỉ có một lần gọi LLM: gộp `ai.md` vào `ARCHITECTURE.md`.
- Sản phẩm không có giao diện: bỏ bước 5.

## Phase 3 — Spec & Plan

**Goal:** Chốt bản tiếp theo làm gì, thế nào là đạt và làm theo thứ tự nào.

- **Input:** Output của Phase 2.
- **Output:** `docs/prd.md` (ngắn), `docs/SPEC.md`, `eval/plan.md`, golden set đã chia dev set và test set, task trên
  tracker.
- **Owner:** Tech Lead giữ SPEC và task. Product viết PRD. QA/Eval giữ eval plan và golden set.
- **Exit criteria:** PRD, SPEC v1.0 và eval plan đã merge; test set đã freeze và ghi ngày; mỗi yêu cầu trong
  `request.md` đã vào PRD hoặc nằm trong Non-goals kèm lý do; mỗi task có acceptance criteria và link tới mục SPEC;
  slice đầu đã có người nhận.

**Activities**

1. Viết PRD ngắn: user story, acceptance criteria, non-goals. Bối cảnh bài toán thì dẫn link tới brief, không chép lại.
2. Viết SPEC: module, interface giữa các module, lệnh, test strategy, boundaries cho agent (Always / Ask first / Never)
   và bảng truy từ yêu cầu trong PRD tới module. Đây là tài liệu chính agent đọc khi làm task.
3. Viết eval plan: chỉ số, ngưỡng, độ lệch cho phép giữa hai lần chạy, ngân sách chi phí và latency.
4. Dựng golden set 50–100 ca từ mẫu ở Phase 1 và danh sách failure mode, ghi nguồn từng ca. Chia dev set và test set.
   Người rà nhãn khác người dựng. Xong thì freeze test set.
5. Review độc lập PRD, SPEC và eval plan: một người không viết các file đó, cộng một lượt AI review.
6. Chia task theo mục Task breakdown, tạo Issue theo [mẫu Task](../../.github/ISSUE_TEMPLATE/task.md) và gom theo
   milestone.

**Task breakdown**

- Chia theo vertical slice: một luồng người dùng chạy được end-to-end. Slice đầu là walking skeleton (bộ khung mỏng
  nhất chạy được) và phải deploy lên staging.
- Một người cùng agent làm trọn một feature: backend, frontend và AI.
- Mỗi task vừa một PR, ghi mục tiêu, mục SPEC cần đạt, phạm vi, non-goals và task phụ thuộc.
- Task đầu tiên là eval runner, vì nó phải có trước phần nó đo.
- Liệt kê các file nhiều người cùng sửa (migration, file sinh tự động, config, dataset eval) và cách phối hợp cho từng
  file.

**Variations**

- PoC: bỏ PRD và đưa acceptance criteria vào SPEC; SPEC giữ trong một trang; dùng smoke set 10–20 ca, chưa cần test
  set riêng.
- Chưa đủ dữ liệu để đặt ngưỡng: ghi eval là exploratory, chốt ngưỡng sau milestone đầu.

## Phase 4 — Build & Release

**Goal:** Làm theo từng vertical slice; mỗi milestone kết thúc bằng một bản phát hành đã qua release gate.

- **Input:** PRD, SPEC v1.0, eval plan, task đã chia.
- **Output:** Code đã merge, kết quả eval, bản phát hành, changelog.
- **Owner:** Tech Lead giữ milestone. Product nghiệm thu. QA/Eval giữ release gate. Ops phát hành.
- **Exit criteria (release gate):** Acceptance criteria trong PRD đạt khi thử trên staging; eval trên test set đạt
  ngưỡng trong eval plan; E2E và smoke test pass; rollback đã sẵn sàng.

**Task loop**

1. Nhận task, chuyển sang `In progress`, cập nhật nhánh từ `main`.
2. Đọc task, mục SPEC liên quan và convention. Chỉ sửa trong phạm vi task, viết test kèm theo.
3. Chạy `make check`. Task đụng phần AI thì chạy eval trên dev set, trước và sau khi sửa.
4. Mở PR theo [mẫu PR](../../.github/PULL_REQUEST_TEMPLATE.md): link task, mục SPEC, mức rủi ro, kết quả eval nếu có.
   Cho AI review trước.
5. Một người khác review. PR rủi ro cao cần code owner của mảng đó duyệt.
6. Squash merge. Staging tự deploy; chuyển task sang `Done`.

**Milestone close**

1. Đóng milestone: mọi task đã merge, staging chạy bản mới nhất.
2. Product nghiệm thu theo acceptance criteria trong PRD; lỗi mở [Issue Bug](../../.github/ISSUE_TEMPLATE/bug.md).
3. Cho ít nhất 3 người dùng thử theo kịch bản; góp ý ghi thành Issue. Góp ý làm hỏng acceptance criteria thì sửa trước
   khi phát hành.
4. Release gate: chạy eval trên test set và E2E trên staging, đo cả latency.
5. Phát hành: backup, deploy, smoke test, gắn tag, viết changelog. Có sự cố thì rollback.
6. Retro: giữ gì, bỏ gì, thử gì. Đổi cách làm thì cập nhật `team.md`.

**Guidelines**

- Nghiệm thu và thử tay trước, eval trên test set sau. Sản phẩm còn lỗi hành vi thì điểm eval cao cũng không có ý nghĩa.
- Test set chỉ chạy ở release gate; tinh chỉnh prompt và model trên dev set (xem [eval.md](eval.md)).
- Khi báo kết quả, ghi rõ môi trường: `demo`, `staging` hay `production`.

**Variations**

- PoC hoặc demo: bỏ bước thử với người dùng và release gate trên test set; báo kết quả là `demo`.
- Phát hành liên tục: release gate chạy tự động ở mỗi lần deploy production thay vì cuối milestone.

## Phase 5 — Operate & Improve

**Goal:** Giữ sản phẩm chạy ổn, phát hiện sự cố sớm và biến lỗi thật thành cải tiến.

- **Input:** Bản production đầu tiên. Phase này chạy song song với Phase 4; phần setup chuẩn bị từ Phase 2.
- **Output:** Monitoring và alert, AI trace, kênh feedback, runbook, ca eval mới từ lỗi thật.
- **Owner:** Ops. AI/ML giữ trace và thay đổi model. Product giữ triage feedback.
- **Exit criteria:** Không có, đây là vòng lặp. Trước bản production đầu tiên: alert, trace và runbook đã sẵn sàng,
  rollback đã thử ít nhất một lần.

**Setup**

1. Monitoring và alert: uptime, error rate, latency p95, chi phí LLM mỗi ngày, token mỗi request.
2. AI trace: version prompt, model, tool đã gọi; che PII; đặt thời hạn lưu. Dự án train thêm theo dõi drift và điều
   kiện train lại.
3. Kênh feedback trong app, gửi kèm ngữ cảnh đã ẩn danh đủ để tái hiện lỗi.
4. Runbook: deploy, rollback, khôi phục backup, rotate key, người xử lý khi có sự cố.

**Recurring**

| Việc | Owner | Cadence |
|---|---|---|
| Triage lỗi và feedback thành Bug, CR hoặc ca eval mới | Product + AI/ML | Hằng tuần, trước planning |
| Lỗi hành vi AI trên production: ẩn danh rồi thêm vào dev set; bổ sung ca tương tự vào test set ở version mới | QA/Eval | Mỗi khi có lỗi |
| So chi phí và latency với ngân sách | Ops | Hằng tuần |
| Nhà cung cấp đổi model hoặc API: chạy lại eval trên dev set | AI/ML | Khi có thay đổi |
| Cập nhật dependency, vá lỗ hổng bảo mật | Tech Lead | Hằng tháng |
| Thử khôi phục từ backup | Ops | Hằng tháng |

**Incident**

- Severe (production sập, lộ PII, sai tiền hoặc sai quyền): giảm ảnh hưởng trước bằng rollback, tắt tính năng hoặc thu
  hồi key; tìm nguyên nhân sau; báo cả nhóm ngay. Trong 48 giờ, người xử lý viết postmortem: chuyện gì xảy ra, vì sao,
  sửa gì để không lặp lại. Postmortem không đổ lỗi cá nhân.
- Normal: mở Issue Bug trong ngày, đưa vào milestone kế tiếp.

**Variations**

- Internal tool: chỉ cần error log, theo dõi chi phí LLM và runbook rollback.
- PoC: bỏ qua phase này.

# Các giai đoạn

> Trang này dành cho cả nhóm, nhất là người chủ trì từng giai đoạn. Mỗi giai đoạn có bảng việc cần làm, ai chủ trì,
> việc nào phải chờ việc nào, và gate để sang giai đoạn sau. Vai trò xem ở [`roles.md`](roles.md), vị trí các file xem
> ở [`documents.md`](documents.md).

Cột **Sau** ghi những việc phải xong trước. Các việc có cùng điều kiện thì làm song song được. Thời gian ghi ở mỗi giai
đoạn là mặc định, nhóm có thể đổi trong [`team.md`](team.md).

## GĐ0 Khởi động · 1–2 ngày

Mục tiêu là cả nhóm thống nhất cách làm việc và có sẵn repo, CI, board để dùng.

| # | Việc | Chủ trì | Sau |
|---|---|---|---|
| 1 | Họp kickoff, thống nhất mục tiêu, ngày dự kiến của từng milestone và lịch review hằng tuần | PM | — |
| 2 | Phân vai: ai giữ vai nào | PM | 1 |
| 3 | Đọc [`working-agreement.md`](working-agreement.md), sửa những chỗ nhóm muốn làm khác | PM | 1 |
| 4 | Chọn công cụ: GitHub hay GitLab, Issues hay Jira, kênh chat | TL | 1 |
| 5 | Tạo repo từ template, bật bảo vệ `main`, điền CODEOWNERS | TL | 2, 4 |
| 6 | Kiểm tra CI chạy xanh trên repo mới | DevOps | 5 |
| 7 | Dựng board trên tracker | PM | 4 |
| 8 | Cất tài khoản hạ tầng và key dùng chung vào password manager, ít nhất 2 người truy cập được | DevOps | 4 |
| 9 | Mỗi người cài máy: chạy `setup` và `check` xanh, tạo API key LLM riêng có giới hạn chi tiêu, cài plugin cho AI agent | Từng người | 5 |

Việc 1 đến 4 làm luôn trong buổi kickoff, kết quả ghi vào [`team.md`](team.md).

**Gate:** `team.md` đã merge và việc 5 đến 8 đã xong. Việc 9 chỉ cần xong trước GĐ4.

## GĐ1 Khám phá · 2–4 ngày

Mục tiêu là hiểu đúng bài toán, biết rõ mình còn thiếu thông tin gì, rồi chọn hướng làm dựa trên kết quả thử thật. Phần
thử nhanh nên giới hạn trong 1–2 ngày.

| # | Việc | Chủ trì | Sau |
|---|---|---|---|
| 1 | Chép nguyên văn yêu cầu vào `discovery/request.md`. File này giữ nguyên, không sửa | PM | — |
| 2 | Lập sổ câu hỏi `discovery/questions.md`. Mỗi người nhận 1–2 nhóm câu hỏi và xếp mức: chặn spec, cần trước khi build, hay biết thì tốt. Câu nào chưa có trả lời mà vẫn phải làm tiếp thì ghi thành giả định, kèm hậu quả nếu giả định sai | PM/BA | 1 |
| 3 | Gặp ít nhất 3 người dùng hoặc người nắm nghiệp vụ, xin 20–50 mẫu thật. Ẩn danh mẫu trước khi đưa vào repo | PM/BA | 1 |
| 4 | Kiểm kê dữ liệu: đang có gì, lấy từ đâu, có được phép dùng không, có PII không. Dự án train thì xem thêm dữ liệu có đủ để train không | QA/Eval | 1 |
| 5 | Liệt kê 3–5 lỗi nặng nhất mà AI có thể gây ra. Danh sách này sẽ thành chỉ số an toàn và kịch bản eval | QA/Eval | 1 |
| 6 | Viết `brief.md`, gói trong một trang | PM | 2, 3 |
| 7 | Thử nhanh trên mẫu thật: viết prompt thử và ghi lại chỗ sai, hoặc dựng baseline nếu là dự án train | AI/ML | 3, 5 |
| 8 | Viết ADR chọn hướng (prompt, RAG, fine-tune hay train), kèm kết quả đo ở việc 7 và chi phí ước tính | AI/ML + TL | 7 |

**Gate (PM chốt):** `brief.md` và ADR chọn hướng đã merge, mọi câu hỏi chặn spec đã gửi tới đúng người, và nhóm đã
quyết làm hay không, đi theo hướng nào.

- Chỉ PM hỏi người ngoài nhóm, và gửi kèm mã `Q-NNN`, để người được hỏi không nhận cùng một câu từ nhiều người.
- Câu trả lời nhận qua chat phải chép vào sổ câu hỏi, ghi rõ ai trả lời và ngày nào.

## GĐ2 Thiết kế · 3–5 ngày

Mục tiêu là chốt kiến trúc, luật nghiệp vụ, luồng giao diện, cách đo, và nhất là shared contract. Có shared contract rồi
thì lúc build mỗi người mới làm feature của mình song song được.

| # | Việc | Chủ trì | Sau |
|---|---|---|---|
| 1 | Viết `domain/`: thuật ngữ, luật nghiệp vụ dạng bảng có mã, data model, edge case | BA | Câu trả lời trong sổ câu hỏi |
| 2 | Viết ADR cho các quyết định lớn: stack, dữ liệu, auth, bảo mật. ADR hạ tầng do DevOps chủ trì | TL | ADR chọn hướng |
| 3 | Viết `ARCHITECTURE.md`: sơ đồ tổng, luồng chính từ đầu tới cuối, cách deploy | TL | 2 |
| 4 | Viết `architecture/backend.md` | TL | 3 |
| 5 | Viết `architecture/frontend.md` và `ui-flow.md`, có wireframe các màn chính với đủ trạng thái loading, empty, error | FE | 1, 3 |
| 6 | Viết `architecture/ai.md`: agent graph hoặc pipeline, node, state, tool, prompt, model cho từng vai, guardrail. Ghi rõ mỗi lượt gọi LLM mấy lần nối tiếp và ngân sách latency | AI/ML | 1, 3 |
| 7 | Chốt shared contract: DB schema, API, event, agent state, tool contract. FE và AI/ML góp phần của mình | TL | 1, 4, 5, 6 |
| 8 | Chọn phương pháp eval: chỉ số, cách chấm, loại dataset, cách chia tập. Dự án train thêm hướng dẫn gán nhãn | QA/Eval | 1, 6 |
| 9 | Viết convention theo stack và cấu hình công cụ để ép luật. Ai giữ mảng nào viết phần của mảng đó | TL | 2 |
| 10 | Dựng staging và pipeline deploy, để code hiện có deploy được ngay | DevOps | 2 |

**Gate:** TL duyệt phần kỹ thuật, PM/BA duyệt `domain/` và UX. Để qua gate cần: quyết định lớn nào cũng có ADR đã
Accepted, shared contract đã merge, câu hỏi chặn spec đã có trả lời hoặc đã thành giả định được duyệt, staging deploy
được, và tài liệu nào cũng có ít nhất một người khác người viết đã duyệt.

- Thiết kế agent graph sao cho mỗi feature thêm node hoặc tool của mình mà không phải sửa file trung tâm. File trung tâm
  mà ai cũng sửa sẽ thành chỗ conflict liên tục.
- Che PII ở mọi đường dữ liệu đi vào hệ thống, không chỉ ở nội dung gửi cho LLM.
- Giả định nào có con số thì đưa số đó vào config. Sau này câu trả lời khác đi thì chỉ sửa config, không phải sửa thiết
  kế.
- Shared contract đã merge mà cần đổi thì báo cả nhóm. Từ GĐ3 trở đi, đổi contract phải qua CR.

## GĐ3 Spec & Plan · 1–2 ngày

Mục tiêu là chốt bản này làm gì, thế nào là đạt và làm theo thứ tự nào. Test set phải đóng băng trước khi bắt đầu build.

| # | Việc | Chủ trì | Sau |
|---|---|---|---|
| 1 | Viết `prd.md` v1.0: user story, tiêu chí nghiệm thu, những gì làm và không làm | PM | — |
| 2 | Viết `SPEC.md` v1.0: module, interface giữa các module, lệnh, chiến lược test, ranh giới "luôn làm / hỏi trước / không bao giờ", và bảng truy từ yêu cầu tới module | TL | 1 |
| 3 | Viết `eval/plan.md`: chỉ số, ngưỡng, sai số cho phép giữa hai lần chạy, ngân sách chi phí và latency | QA/Eval | 1 |
| 4 | Dựng golden set ban đầu khoảng 50–100 dòng, chia dev set và test set, ghi nguồn gốc từng dòng. Người rà nhãn khác người dựng. Xong thì đóng băng test set | QA/Eval dựng, BA rà | 3 |
| 5 | Phản biện độc lập PRD, SPEC và eval plan: một người không viết các file đó đọc kỹ, cộng thêm một agent reviewer | FE hoặc AI/ML | 2, 3 |
| 6 | Viết `tasks/plan.md` theo cách chia ở dưới | TL | 5 |
| 7 | Tạo việc trên tracker: mỗi vertical slice một Epic, mỗi task một Issue, milestone có ngày | PM | 6 |

**Chia plan thế nào:**

- Vertical slice là một luồng người dùng chạy được từ đầu tới cuối. Slice đầu tiên là walking skeleton, tức bộ khung
  mỏng nhất chạy được, và phải deploy lên staging.
- Mỗi feature có một người phụ trách, làm trọn cả backend, frontend và AI.
- Mỗi task vừa một PR. Task ghi rõ việc cần làm, file được sửa, mục SPEC phải đạt, những gì không làm, và task nào phải
  xong trước.
- Task đầu tiên là bộ chạy eval, vì nó phải có trước mọi task xây phần mà nó đo.
- Plan có một bảng các file nhiều người cùng sửa (migration, file sinh tự động, config, dataset eval) và luật riêng cho
  từng file.
- Mỗi bản phát hành có plan riêng. CR mới thì đưa vào plan của milestone kế tiếp.

**Gate (cả nhóm duyệt v1.0):** PRD, SPEC và eval plan đã merge. Test set đã đóng băng và ghi ngày. Yêu cầu nào trong
`request.md` cũng đã vào spec hoặc nằm trong Non-goals kèm lý do. Task nào cũng có tiêu chí và link tới SPEC. Ai cũng có
việc trong slice đầu.

## GĐ4 Xây & phát hành · lặp lại mỗi milestone

Làm theo từng vertical slice. Mỗi milestone, mặc định 1 tuần, kết thúc bằng một bản phát hành đã kiểm chứng. Mỗi lần
merge, staging tự deploy. Prod chỉ deploy khi qua release gate.

**Làm một task** (người phụ trách feature cùng agent):

1. Tự gán task, chuyển sang In progress, kéo `main` mới nhất.
2. Agent đọc task, mục SPEC liên quan và convention của mảng đó, chỉ sửa trong phạm vi task và viết test kèm.
3. Chạy `check`. Nếu task đụng tới phần AI thì chạy thêm eval trên dev set, trước và sau khi sửa.
4. Mở PR, ghi link task, mục SPEC, mức rủi ro và kết quả eval nếu có. Cho AI review trước.
5. Nhờ một người khác review. PR rủi ro cao thì code owner của mảng đó duyệt.
6. Squash merge. Staging tự deploy, chuyển task sang Done.

**Cuối milestone:**

| # | Việc | Chủ trì | Sau |
|---|---|---|---|
| 1 | Đóng milestone: mọi task đã merge, staging đang chạy bản mới nhất | TL | — |
| 2 | Nghiệm thu: thử các luồng theo tiêu chí trong PRD, gặp lỗi thì mở Issue Bug | PM | 1 |
| 3 | Cho ít nhất 3 người dùng thử theo kịch bản, góp ý ghi thành Issue. Góp ý nào làm hỏng tiêu chí nghiệm thu thì sửa trước khi phát hành | PM/BA | 2 |
| 4 | Release gate: chạy eval trên test set và E2E trên staging, đo cả latency, phải đạt ngưỡng trong `eval/plan.md` | QA/Eval | 2 |
| 5 | Phát hành lên prod: backup, deploy, smoke test, gắn tag, viết changelog. Có sự cố thì rollback | DevOps | 4 |
| 6 | Retro 30 phút: nên giữ gì, bỏ gì, thử gì. Đổi luật thì sửa `team.md` | PM | 5 |

Phải nghiệm thu và thử tay xong mới chạy eval để phát hành. Sản phẩm còn lỗi hành vi thì điểm eval cao cũng chưa nói lên
được gì.

## GĐ5 Vận hành · song song với GĐ4

Mục tiêu là giữ sản phẩm chạy ổn, phát hiện sự cố sớm, và biến lỗi thật thành cải tiến. Giai đoạn này bắt đầu từ bản
phát hành prod đầu tiên.

**Dựng một lần:**

| # | Việc | Chủ trì | Sau |
|---|---|---|---|
| 1 | Monitoring và alert: uptime, lỗi, latency p95, chi phí LLM mỗi ngày, token mỗi hội thoại | DevOps | Bản phát hành đầu |
| 2 | Trace cho AI: ghi phiên bản prompt, model, các tool đã gọi; che PII; có thời hạn lưu. Dự án train thêm theo dõi drift và điều kiện để train lại | AI/ML | 1 |
| 3 | Nút góp ý trong app, gửi kèm ảnh chụp ngữ cảnh đã ẩn danh, đủ để tái hiện lỗi | PM | Bản phát hành đầu |
| 4 | Runbook: cách deploy, rollback, khôi phục backup, đổi key; ai xử lý khi có sự cố | DevOps | 1 |

**Việc định kỳ:**

| Việc | Ai | Khi nào |
|---|---|---|
| Rà lỗi và góp ý, phân loại thành Bug, CR hoặc dòng eval mới | PM + AI/ML | Hằng tuần, trước buổi planning |
| Lỗi hành vi AI gặp trên prod: ẩn danh rồi thêm vào dev set. Định kỳ bổ sung ca tương tự vào test set | QA/Eval | Mỗi khi có lỗi |
| So chi phí và latency với ngân sách | DevOps | Hằng tuần |
| Nhà cung cấp đổi model hoặc API: chạy lại eval trên dev set. Luôn ghim phiên bản model | AI/ML | Khi có thay đổi |
| Cập nhật thư viện, vá lỗ hổng bảo mật | TL | Hằng tháng |
| Thử khôi phục từ backup | DevOps | Hằng tháng |

**Sự cố:**

- Sự cố nghiêm trọng là khi prod sập, lộ PII, sai tiền hoặc sai quyền. Lúc đó rollback trước, tìm nguyên nhân sau, và
  báo cả nhóm ngay. Trong 48 giờ, người xử lý viết postmortem: chuyện gì xảy ra, vì sao, sửa gì để không lặp lại.
  Postmortem không đổ lỗi cho cá nhân.
- Sự cố thường thì mở Issue Bug ngay trong ngày và đưa vào milestone kế tiếp.

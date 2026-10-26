# Các giai đoạn

> **Người đọc:** cả nhóm, nhất là người chủ trì từng giai đoạn. File này ghi việc của từng giai đoạn: ai chủ trì, việc
> nào chờ việc nào, cổng để sang giai đoạn sau. Vai trò ở [`roles.md`](roles.md); file nằm ở đâu ở
> [`documents.md`](documents.md).

Cách đọc bảng: cột **Sau** ghi việc phải xong trước. Việc có cùng điều kiện chạy song song. Thời gian là mặc định, nhóm
chỉnh trong [`team.md`](team.md). Cổng chỉ chặn việc **chốt**: việc của giai đoạn sau được làm nháp sớm.

## GĐ0 Khởi động · 1–2 ngày

Thống nhất cách làm việc; có repo, CI, board chạy được.

| # | Việc | Chủ trì | Sau |
|---|---|---|---|
| 1 | Kickoff: mục tiêu, ngày mục tiêu của các milestone, nhịp review hằng tuần | PM | — |
| 2 | Ai giữ vai nào | PM | 1 |
| 3 | Rà [`working-agreement.md`](working-agreement.md), sửa chỗ nhóm muốn khác | PM | 1 |
| 4 | Chọn công cụ: GitHub hay GitLab, Issues hay Jira, kênh chat | TL | 1 |
| 5 | Tạo repo từ template, bảo vệ `main`, điền CODEOWNERS | TL | 2, 4 |
| 6 | Kiểm CI xanh trên repo mới | DevOps | 5 |
| 7 | Dựng board trên tracker | PM | 4 |
| 8 | Lưu tài khoản hạ tầng và khoá dùng chung trong trình quản lý mật khẩu, ít nhất 2 người truy cập được | DevOps | 4 |
| 9 | Mỗi người cài máy: `setup`, `check` xanh, API key LLM có hạn mức chi tiêu, plugin cho AI agent | Từng người | 5 |

Việc 1–4 làm trong một buổi kickoff, kết quả ghi vào [`team.md`](team.md).

**Cổng:** `team.md` đã merge; việc 5–8 xong. Việc 9 xong trước GĐ4.

## GĐ1 Khám phá · 2–4 ngày

Hiểu đúng bài toán, biết mình chưa biết gì, chọn hướng bằng kết quả thử thật. Phần thử nhanh giới hạn trước 1–2 ngày.

| # | Việc | Chủ trì | Sau |
|---|---|---|---|
| 1 | Ghi nguyên văn yêu cầu vào `discovery/request.md`, không sửa về sau | PM | — |
| 2 | Sổ câu hỏi `discovery/questions.md`: mỗi người nhận 1–2 nhóm câu hỏi, xếp mức *chặn spec*, *trước build*, *có thì tốt*; câu chưa có trả lời mà phải đi tiếp thì ghi giả định kèm "nếu sai thì ảnh hưởng tới đâu" | PM/BA | 1 |
| 3 | Gặp ít nhất 3 người dùng hoặc người nắm nghiệp vụ; thu 20–50 mẫu thật, ẩn danh trước khi đưa vào repo | PM/BA | 1 |
| 4 | Kiểm kê dữ liệu: có gì, nguồn, quyền dùng, PII; dự án train thêm: đủ để train không | QA/Eval | 1 |
| 5 | Liệt kê 3–5 sai lầm nặng nhất của AI; đây sẽ là chỉ số an toàn và kịch bản eval | QA/Eval | 1 |
| 6 | `brief.md` một trang | PM | 2, 3 |
| 7 | Thử nhanh trên mẫu thật: prompt thử và ghi chỗ sai, hoặc baseline với dự án train | AI/ML | 3, 5 |
| 8 | ADR chọn hướng (prompt, RAG, fine-tune hay train), kèm số đo của việc 7 và chi phí ước tính | AI/ML + TL | 7 |

**Cổng (PM chốt):** `brief.md` và ADR chọn hướng đã merge; mọi câu *chặn spec* đã được gửi tới người cần hỏi; quyết
định làm hay không, theo hướng nào.

- PM là đầu mối hỏi người ngoài nhóm, gửi theo mã `Q-NNN` để người được hỏi không nhận câu trùng.
- Câu trả lời nhận qua chat phải chép vào sổ, ghi nguồn và ngày.

## GĐ2 Thiết kế · 3–5 ngày

Chốt cấu trúc hệ thống, luật nghiệp vụ, luồng giao diện, cách đo, và **hợp đồng chung** để lúc build mỗi người làm một
feature song song.

| # | Việc | Chủ trì | Sau |
|---|---|---|---|
| 1 | `domain/`: thuật ngữ, luật nghiệp vụ dạng bảng có mã, mô hình dữ liệu, edge case | BA | Câu trả lời ở sổ câu hỏi |
| 2 | ADR cho các quyết định lớn: stack, dữ liệu, auth, bảo mật; ADR hạ tầng do DevOps chủ trì | TL | ADR chọn hướng |
| 3 | `ARCHITECTURE.md`: sơ đồ tổng, luồng chính end-to-end, deploy | TL | 2 |
| 4 | `architecture/backend.md` | TL | 3 |
| 5 | `architecture/frontend.md`, `ui-flow.md` cùng wireframe các màn chính, gồm trạng thái chờ, rỗng, lỗi | FE | 1, 3 |
| 6 | `architecture/ai.md`: graph hoặc pipeline, node, state, tool, prompt, model theo từng vai, guardrail, **số lần gọi LLM nối tiếp và ngân sách độ trễ mỗi lượt** | AI/ML | 1, 3 |
| 7 | **Hợp đồng chung**: schema DB, API, sự kiện, agent state, hợp đồng tool; FE và AI/ML góp phần của mình | TL | 1, 4, 5, 6 |
| 8 | Phương pháp eval: chỉ số, cách chấm, loại bộ dữ liệu, cách chia tập; dự án train thêm hướng dẫn gán nhãn | QA/Eval | 1, 6 |
| 9 | Convention theo stack và cấu hình công cụ ép luật | TL; người giữ mảng nào viết phần mảng đó | 2 |
| 10 | Staging và pipeline deploy: repo hiện tại deploy được ngay | DevOps | 2 |

**Cổng:** TL duyệt phần kỹ thuật, PM/BA duyệt `domain/` và UX. Mọi quyết định lớn có ADR Accepted; hợp đồng chung đã
merge; mọi câu *chặn spec* đã có trả lời hoặc thành giả định được duyệt; staging deploy được; mỗi tài liệu có ít nhất
một người khác người viết đã duyệt.

- Agent graph thiết kế để mỗi feature thêm node hoặc tool của mình mà không sửa file trung tâm.
- Che PII ở mọi đường dữ liệu đi vào hệ thống, không chỉ ở nội dung gửi LLM.
- Giả định có con số thì để số trong config: câu trả lời khác đi chỉ phải sửa config, không phải sửa thiết kế.
- Hợp đồng chung đã merge mà muốn đổi thì báo cả nhóm; từ GĐ3 phải qua CR.

## GĐ3 Spec & Plan · 1–2 ngày

Chốt bản này xây gì, thế nào là đạt, xây theo thứ tự nào; đóng băng tập test trước khi build.

| # | Việc | Chủ trì | Sau |
|---|---|---|---|
| 1 | `prd.md` v1.0: user story, tiêu chí nghiệm thu, phạm vi làm và không làm | PM | — |
| 2 | `SPEC.md` v1.0: module, giao diện giữa module, lệnh, chiến lược test, ranh giới *luôn làm / hỏi trước / không bao giờ*, bảng truy vết từ yêu cầu tới module | TL | 1 |
| 3 | `eval/plan.md`: chỉ số, ngưỡng, sai số cho phép giữa hai lần chạy, ngân sách chi phí và độ trễ | QA/Eval | 1 |
| 4 | Tập vàng ban đầu 50–100 dòng, chia dev và test, ghi nguồn gốc; người rà khác người dựng; đóng băng tập test | QA/Eval dựng, BA rà | 3 |
| 5 | Phản biện độc lập PRD, SPEC, eval plan: một người không viết các file đó, cộng một agent reviewer | FE hoặc AI/ML | 2, 3 |
| 6 | `tasks/plan.md`, chia theo mục dưới | TL | 5 |
| 7 | Tạo việc trên tracker: mỗi lát một Epic, mỗi task một Issue, milestone có ngày | PM | 6 |

**Cách chia plan:**

- **Lát dọc** là một luồng người dùng chạy được từ đầu tới cuối. Lát đầu là bộ khung chạy được, deploy lên staging.
- **Feature** có một người phụ trách, làm trọn BE, FE và AI.
- **Task** bằng một PR, ghi: việc, file được sửa, mục SPEC phải đạt, phần *không làm*, task phải xong trước.
- Bộ chạy eval là task đầu tiên, đứng trước mọi task xây phần mà nó đo.
- Plan có bảng các file nhiều người cùng sửa (migration, file sinh tự động, config, bộ eval) và luật cho từng file.
- Mỗi bản phát hành một plan; CR mới đưa vào plan của milestone kế tiếp.

**Cổng (cả nhóm approve v1.0):** PRD, SPEC, eval plan đã merge; tập test đã đóng băng, ghi ngày; mọi yêu cầu trong
`request.md` đã vào spec hoặc nằm ở Non-goals kèm lý do; mọi task có tiêu chí và trỏ tới SPEC; mỗi người có việc ở lát
đầu.

## GĐ4 Xây & phát hành · lặp mỗi milestone

Xây theo lát dọc; mỗi milestone (mặc định 1 tuần) kết thúc bằng một bản phát hành đã qua kiểm chứng. Mỗi lần merge,
staging tự deploy; prod chỉ deploy ở cổng phát hành.

**Vòng làm một task** (người phụ trách feature cùng agent):

1. Tự gán task, chuyển sang In progress, kéo `main`.
2. Agent đọc task, mục SPEC liên quan và convention của mảng; chỉ làm trong phạm vi task; viết test kèm.
3. Chạy `check`. Task đụng phần AI thì chạy thêm eval tập dev trước và sau.
4. Mở PR: link task, mục SPEC, mức rủi ro, kết quả eval nếu có. Cho AI review trước.
5. Một người khác review; mức rủi ro cao thì người giữ mảng duyệt.
6. Squash merge, staging tự deploy, chuyển task sang Done.

**Cuối milestone:**

| # | Việc | Chủ trì | Sau |
|---|---|---|---|
| 1 | Đóng milestone: mọi task đã merge, staging chạy bản mới nhất | TL | — |
| 2 | Nghiệm thu: thử các luồng theo tiêu chí của PRD; lỗi thì mở Issue Bug | PM | 1 |
| 3 | Cho ít nhất 3 người dùng thử theo kịch bản, góp ý ghi thành Issue; góp ý chặn tiêu chí nghiệm thu thì sửa trước khi phát hành | PM/BA | 2 |
| 4 | **Cổng phát hành:** eval tập test và E2E trên staging, gồm độ trễ; đạt ngưỡng ở `eval/plan.md` | QA/Eval | 2 |
| 5 | Phát hành prod: sao lưu, deploy, smoke test, gắn tag, viết changelog; hỏng thì rollback | DevOps | 4 |
| 6 | Retro 30 phút: giữ gì, bỏ gì, thử gì; đổi luật thì sửa `team.md` | PM | 5 |

Thử tay và nghiệm thu đứng trước cổng eval: sản phẩm còn lỗi hành vi thì số eval chưa nói lên chất lượng.

## GĐ5 Vận hành · song song GĐ4

Giữ sản phẩm chạy ổn, phát hiện sự cố sớm, biến lỗi thật thành cải tiến. Bắt đầu từ bản phát hành prod đầu tiên.

**Dựng một lần:**

| # | Việc | Chủ trì | Sau |
|---|---|---|---|
| 1 | Giám sát và cảnh báo: uptime, lỗi, độ trễ p95, chi phí LLM mỗi ngày, token mỗi hội thoại | DevOps | Bản phát hành đầu |
| 2 | Trace của AI: phiên bản prompt, model, tool đã gọi; PII đã che; có hạn lưu. Dự án train thêm: theo dõi drift và điều kiện train lại | AI/ML | 1 |
| 3 | Kênh phản hồi trong app: góp ý kèm ảnh chụp ngữ cảnh đã ẩn danh, đủ để tái hiện lỗi | PM | Bản phát hành đầu |
| 4 | Runbook: deploy, rollback, khôi phục sao lưu, xoay khoá; ai xử lý khi có sự cố | DevOps | 1 |

**Việc định kỳ:**

| Việc | Ai | Nhịp |
|---|---|---|
| Rà lỗi và phản hồi, phân loại thành Bug, CR hoặc dòng eval mới | PM + AI/ML | Hằng tuần, trước planning |
| Lỗi hành vi AI thật: ẩn danh, thêm vào tập dev; ca tương tự bổ sung vào tập test theo định kỳ | QA/Eval | Mỗi lỗi |
| So chi phí và độ trễ với ngân sách | DevOps | Hằng tuần |
| Nhà cung cấp đổi model hay API: chạy lại eval tập dev; luôn ghim phiên bản model | AI/ML | Khi có thay đổi |
| Cập nhật thư viện, vá bảo mật | TL | Hằng tháng |
| Thử khôi phục từ bản sao lưu | DevOps | Hằng tháng |

**Sự cố:**

- **Nghiêm trọng** (prod sập, lộ PII, sai tiền hoặc sai quyền): rollback trước, tìm nguyên nhân sau, báo cả nhóm ngay.
  Trong 48 giờ viết postmortem không đổ lỗi cho cá nhân: chuyện gì xảy ra, vì sao, sửa gì để không lặp lại.
- **Thường:** mở Issue Bug trong ngày, đưa vào milestone kế tiếp.

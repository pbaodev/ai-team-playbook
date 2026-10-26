# Convention chung

> Luật áp dụng cho mọi ngôn ngữ trong repo. Luật nào máy kiểm được thì đã cấu hình trong công cụ ở mục cuối, phần còn
> lại người review kiểm khi đọc PR.

## Cấu trúc

1. Chia theo feature trước, trong mỗi feature mới chia tầng. Code của một feature nằm gần nhau, nên muốn bỏ một feature
   thì chỉ cần xoá một thư mục.
2. Phụ thuộc đi một chiều. `core` là phần dùng chung và không import feature nào. Feature gọi nhau qua service công khai,
   không với tay vào bên trong feature khác.
3. Tách luật thuần khỏi I/O. Luật nghiệp vụ viết thành hàm thuần, không đụng database hay mạng. Như vậy test chạy nhanh,
   và đổi framework cũng không ảnh hưởng tới luật.
4. File dài quá khoảng 300 dòng thì tách. Mỗi hàm làm một việc.

## Dữ liệu và config

5. Không hardcode con số, ngưỡng, URL hay tên model. Những thứ này để trong config và đọc từ biến môi trường.
6. Dữ liệu đi qua ranh giới (API, tool, LLM, file) phải qua schema có kiểu như Pydantic hay zod, không truyền dict tự do.
7. Thời gian lưu theo UTC. Tiền lưu bằng số nguyên theo đơn vị nhỏ nhất, không dùng số thực.

## Lỗi và log

8. Lỗi có mã chuẩn và trả về theo một định dạng chung. Không nuốt lỗi, không để `except` trống.
9. Log có cấu trúc, và không chứa secret hay PII bản rõ.

## Đặt tên và comment

10. Tên phải nói lên ý định. Thứ máy đọc viết tiếng Anh theo chuẩn của ngôn ngữ (`snake_case` cho Python, `camelCase`
    cho TypeScript), class viết `PascalCase`.
11. Comment giải thích vì sao code viết như vậy, không giải thích code đang làm gì.
12. Không để code chết, code bị comment lại, hay lệnh print để debug.

## Test

13. Test đi cùng PR. Test hành vi, không test chi tiết cài đặt.
14. Test không gọi dịch vụ ngoài thật, kể cả LLM, mà dùng bản giả. Hành vi thật của LLM đo bằng eval.
15. Mỗi test tự dựng dữ liệu riêng, để các test chạy song song không ảnh hưởng nhau.

## Thư viện

16. Muốn thêm thư viện thì hỏi TL trước, và khoá phiên bản bằng lockfile.

## Công cụ ép luật

| Việc | Python | TypeScript |
|---|---|---|
| Lint | ruff | ESLint |
| Format | ruff format | Prettier |
| Kiểm kiểu | pyright hoặc mypy | `tsc --strict` |
| Chiều phụ thuộc | import-linter | dependency-cruiser |
| Chạy trước khi commit | pre-commit | pre-commit hoặc lefthook |

Tất cả gom vào `make check`, chạy ở máy trước khi mở PR và chạy lại trên CI.

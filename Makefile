.PHONY: setup check

# Lệnh chuẩn của dự án. Quy trình, CI và AI agent đều gọi đúng các tên lệnh này, nên mỗi dự án chỉ thay phần thân
# theo stack của mình, giữ nguyên tên lệnh.

# Cài dependency, tạo .env từ .env.example nếu chưa có.
setup:
	@test -f .env || cp .env.example .env
	@echo "setup: thêm lệnh cài dependency của stack vào Makefile"

# Lint, format, type, test. Chạy trước khi mở PR; CI cũng chạy lệnh này.
check:
	@echo "check: thêm lint, format, type, test của stack vào Makefile"

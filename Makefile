
all: run

snake.com: snake.S
	nasm -f bin $< -o $@
	@echo "Wrote $$(stat -c%s $@) bytes"

run: snake.com
	dosbox -c "mount c ." -c "c:" -c "snake.com"


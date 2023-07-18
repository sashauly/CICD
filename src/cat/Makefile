CC = gcc
CFLAGS = -std=c11 -Wall -Werror -Wextra -D_GNU_SOURCE
OS := $(shell uname)

all: s21_cat
	
s21_cat:
	$(CC) $(CFLAGS) s21_cat.c -o s21_cat

test: clean all
	bash test_func_cat.sh
	make clean

clang: clean
	cp ../../materials/linters/.clang-format ../../src/.clang-format
	clang-format -n s21_cat.c s21_cat.h
	rm ../.clang-format

leaks:
	leaks -atExit -- ./s21_cat

valgrind:
	CK_FORK=no valgrind --vgdb=no --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file=RESULT_VALGRIND.txt ./s21_cat

clean:
	rm -rf s21_cat s21_cat.dSYM s21_cat_test.txt cat_test.txt

rebuild: clean all
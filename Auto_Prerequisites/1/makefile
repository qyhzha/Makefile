.PHONY : all

CC := gcc

all :
	@$(CC) -MM $-E main.c | sed 's,\(.*\)\.o[ :]*,\1.o :,g'
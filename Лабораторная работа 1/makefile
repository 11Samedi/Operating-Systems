.PHONY: clean run asm

OBJS = main.o fibonacci.o
CC = gcc
CFLAGS = -Wall -Wextra -Wpedantic -O3 -g

run: fibonacci
	./fibonacci

fibonacci: $(OBJS)
	$(CC) $(CFLAGS) -o fibonacci $(OBJS)

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f fibonacci $(OBJS)

asm:
	$(CC) -S -o fibonacci.s fibonacci.c
	$(CC) -S -o main.s main.c
all: info

FLAGS=-m32 -ffreestanding -nostdlib

info: setup.o main.o linker.ld
	ld -T linker.ld setup.o main.o -o info -z max-page-size=0x1000

setup.o: setup.S
	gcc $(FLAGS) -c setup.S -o setup.o

main.o: main.c
	gcc $(FLAGS) -c main.c -o main.o

clean:
	rm -rf *.o info

.PHONY: clean all

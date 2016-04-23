all: mbr

mbr: hello.o linker.ld
	ld -T linker.ld hello.o -o mbr

hello.o: hello.S
	gcc -m32 -c hello.S -o hello.o

.PHONY: clean
clean:
	rm -rf *.o mbr

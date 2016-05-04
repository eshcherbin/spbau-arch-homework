	.text
	.global start

header:
    .align 4
    .long 0x1badb002
    .long 2
    .long -(0x1badb004)

start:
    movl $(stack + 0x1000), %esp
    pushl %ebx
    call printmem

loop:
    jmp loop

    .comm stack, 0x1000

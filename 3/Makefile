AS = ./avra
PP = cpp

all: blink.hex

blink.asm: blink.S
	$(PP) -P blink.S blink.asm

blink.hex: blink.asm
	$(AS) blink.asm $(CFLAGS) -o blink.hex

clean:
	rm *.asm *.cof *.obj *.hex

.PHONY: clean

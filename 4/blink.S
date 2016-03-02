#include "atmega328.h"

	.device ATmega328P
	.org 0x00
	rjmp reset

	.org 0x16
	rjmp timer1_compa

	.org 0x34
reset:
	ldi r16, high(RAMEND)
	out SPH, r16
	ldi r16, low(RAMEND)
	out SPL, r16

	rcall setup
	sei

	ldi r18, bit(5)
	clr r20
	out DDRB, r18
    out PORTB, r20
loop:
	rjmp loop

setup:
    push r16

    clr r16
	sts TCNT1H, r16
	sts TCNT1L, r16
	sts TCCR1A, r16
	ldi r16, (bit(CS12) | bit(WGM12))
	sts TCCR1B, r16
	ldi r16, 0xdb
	sts OCR1AH, r16
	ldi r16, 0xb9
	sts OCR1AL, r16
	ldi r16, bit(OCIE1A)
	sts TIMSK1, r16

    pop r16
	ret

timer1_compa:
    push r19
    push r16
    push r17
    push r22
    in r22, SREG

    clr r16

    ldi r17, 0xb9
    lds r19, OCR1AL
    cp r17, r19

    brne else
if:
    ldi r16, 0x18
    sts OCR1AH, r16
    ldi r16, 0x69
    sts OCR1AL, r16

    eor r20, r18
    out PORTB, r20

    rjmp endif
else:
    ldi r16, 0xdb
    sts OCR1AH, r16
    ldi r16, 0xb9
    sts OCR1AL, r16

    eor r20, r18
    out PORTB, r20
endif:

    out SREG, r22
    pop r22
    pop r17
    pop r16
    pop r19
	reti


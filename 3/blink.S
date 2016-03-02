#include "atmega328.h"

#define bit(x) (1 << (x))
#define DDRB 0x04
#define PORTB 0x05
	.device ATmega328P
	.org 0x00
	rjmp reset

	.org 0x34

reset:
	ldi r27, bit(5)
	out DDRB, r27


loop:

	ldi r24, 0x46
	ldi r25, 0x3d
	
	eor r26, r27
	out PORTB, r26	
	
	rcall delay

	rjmp loop


foo:
	ldi r16, 255  ;1
	ldi r17, 1    ;1
bar:
	sub r16, r17  ;1
	cpi r16, 0    ;1
	brne bar  ;2
	ret

__sub16:
	sub r24, r20
	sbc r25, r21
	ret


delay:

	ldi r20, 1
	ldi r21, 0

delay_loop:
	rcall __sub16
	rcall foo
	
	cpi r24, 0
	brne delay_loop
	cpi r25, 0
	brne delay_loop
	ret
	



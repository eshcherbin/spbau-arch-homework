#include "atmega328.h"

	.device ATmega328P
	.org 0x00
	rjmp reset

	.org 0x34
reset:
	ldi r16, high(RAMEND)
	out SPH, r16
	ldi r16, low(RAMEND)
	out SPL, r16

	rcall setup_uart
    rcall setup_temp

loop:
    
    lds r17, ADCL
    lds r18, ADCH
    
    sts iospace(UDR0), r17
wait_low:
    lds r19, iospace(UCSR0A)
    andi r19, bit(UDRE0)
    cpi r19, bit(UDRE0)
    brne wait_low

    sts iospace(UDR0), r18
wait_high:
    lds r19, iospace(UCSR0A)
    andi r19, bit(UDRE0)
    cpi r19, bit(UDRE0)
    brne wait_high
    
	rjmp loop


setup_uart:
	ldi r16, low(207)
	sts iospace(UBRR0L), r16
	ldi r16, high(207)
	sts iospace(UBRR0H), r16

	ldi r16, bit(U2X0)
	sts iospace(UCSR0A), r16

	ldi r16, (bit(UCSZ00) | bit(UCSZ01))
	sts iospace(UCSR0C), r16

	ldi r16, bit(TXEN0)
	sts iospace(UCSR0B), r16
	ret


setup_temp:
    ldi r16, bit(REFS0)
    sts ADMUX, r16

    ldi r16, (bit(ADPS0) | bit(ADPS1) | bit(ADPS2) | bit(ADATE) | bit(ADEN) | bit(ADSC))
    sts ADCSRA, r16
    ret

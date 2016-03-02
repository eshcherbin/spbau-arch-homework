#include <avr/io.h>
#include <avr/interrupt.h>

uint32_t jiffies;
uint8_t value;

int main()
{
	TCNT0 = 0;
	TCCR0A = (1 << WGM01);
	TCCR0B = ((1 << CS00) | (1 << CS01));
	OCR0A = 0xf9;
	TIMSK0 = (1 << OCIE0A);
	sei();

	while (1);
	return 0;
}

ISR(TIMER0_COMPA_vect)
{
	jiffies += 1;
	if (jiffies & 0x00000100) {
		value ^= 0xFF;
		PORTB = value;
	}	
}


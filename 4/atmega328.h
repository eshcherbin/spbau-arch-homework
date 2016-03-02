#define RAMEND     0x08FF
#define PINB       0x03
#define DDRB       0x04
#define PORTB      0x05
#define SPH        0x3e
#define SPL        0x3d
#define SREG       0x3f

#define TCCR0A     0x24
#define TCCR0B     0x25
#define TCNT0      0x26
#define OCR0A      0x27
#define OCR0B      0x28
#define TIMSK0     0x4e

#define TCCR1A     0x80
#define TCCR1B     0x81
#define TCNT1L     0x84
#define TCNT1H     0x85
#define OCR1AL     0x88
#define OCR1AH     0x89
#define OCR1BL     0x8a
#define OCR1BH     0x8b
#define TIMSK1     0x6f

#define WGM00      0x00
#define WGM01      0x01
#define WGM02      0x03
#define WGM12      0x03
#define CS00       0x00
#define CS01       0x01
#define CS12       0x02
#define OCIE1A     0x01

#define high(x)    (((x) & 0xff00) >> 8)
#define low(x)     ((x) & 0x00ff)
#define iospace(x) ((x) + 0x20)
#define bit(x)     (1 << (x))

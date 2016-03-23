#define RAMEND     0x08FF
#define DATABEGIN  0x0100
#define PINB       0x03
#define DDRB       0x04
#define PORTB      0x05
#define SPH        0x3e
#define SPL        0x3d
#define SREG       0x3f

#define UDR0       0xa6
#define UBRR0H     0xa5
#define UBRR0L     0xa4

#define UCSR0C     0xa2
#define UCPOL0     0x00
#define UCSZ00     0x01
#define UCSZ01     0x02
#define USBS0      0x03
#define UPM00      0x04
#define UPM01      0x05
#define UMSEL00    0x06
#define UMSEL01    0x07

#define UCSR0B     0xa1
#define TXB80      0x00
#define RXB80      0x01
#define UCSZ02     0x02
#define TXEN0      0x03
#define RXEN0      0x04
#define UDRIE0     0x05
#define TXCIE0     0x06
#define RXCIE0     0x07

#define UCSR0A     0xa0
#define MPCM0      0x00
#define U2X0       0x01
#define UPE0       0x02
#define DOR0       0x03
#define FE0        0x04
#define UDRE0      0x05
#define TXC0       0x06
#define RXCO       0x07

#define REFS0      0x06
#define ADMUX      0x7c
#define ADCSRA     0x7a
#define ADPS0      0x00
#define ADPS1      0x01
#define ADPS2      0x02
#define ADATE      0x05
#define ADEN       0x07
#define ADSC       0x06
#define ADCL       0x78
#define ADCH       0x79

#define high(x)    (((x) & 0xff00) >> 8)
#define low(x)     ((x) & 0x00ff)
#define iospace(x) ((x) + 0x20)
#define bit(x)     (1 << (x))

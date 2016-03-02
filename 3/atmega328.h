#define RAMEND     0x08FF
#define DATABEGIN  0x0100
#define DDRB       0x04
#define PORTB      0x05
#define SPH        0x3e
#define SPL        0x3d

#define high(x)    (((x) & 0xff00) >> 8)
#define low(x)     ((x) & 0x00ff)
#define iospace(x) ((x) + 0x20)
#define bit(x)     (1 << (x))

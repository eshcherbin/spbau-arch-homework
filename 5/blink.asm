 .device ATmega328P
 .org 0x00
 rjmp reset
 .org 0x34
reset:
 ldi r16, (((0x08FF) & 0xff00) >> 8)
 out 0x3e, r16
 ldi r16, ((0x08FF) & 0x00ff)
 out 0x3d, r16
 rcall setup_uart
    rcall setup_temp
loop:
    lds r17, 0x78
    lds r18, 0x79
    sts ((0xa6) + 0x20), r17
wait_low:
    lds r19, ((0xa0) + 0x20)
    andi r19, (1 << (0x05))
    cpi r19, (1 << (0x05))
    brne wait_low
    sts ((0xa6) + 0x20), r18
wait_high:
    lds r19, ((0xa0) + 0x20)
    andi r19, (1 << (0x05))
    cpi r19, (1 << (0x05))
    brne wait_high
 rjmp loop
setup_uart:
 ldi r16, ((207) & 0x00ff)
 sts ((0xa4) + 0x20), r16
 ldi r16, (((207) & 0xff00) >> 8)
 sts ((0xa5) + 0x20), r16
 ldi r16, (1 << (0x01))
 sts ((0xa0) + 0x20), r16
 ldi r16, ((1 << (0x01)) | (1 << (0x02)))
 sts ((0xa2) + 0x20), r16
 ldi r16, (1 << (0x03))
 sts ((0xa1) + 0x20), r16
 ret
setup_temp:
    ldi r16, (1 << (0x06))
    sts 0x7c, r16
    ldi r16, ((1 << (0x00)) | (1 << (0x01)) | (1 << (0x02)) | (1 << (0x05)) | (1 << (0x07)) | (1 << (0x06)))
    sts 0x7a, r16
    ret

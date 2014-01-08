.text
    liuz SP 0xFF
    add D Z Z
init:
    liuz B 0x40
    lw B 0(B)
    add D D B
    push D
    la A msgtick
    jal ser_out_msg
    pop D
    j init

ser_out_msg:
    lb B 0(A)
    jz B ser_out_msg_ret
    liuz C 0x41
    lil C 0x02
    sb B 0(C)
    incri A 1
    j ser_out_msg
ser_out_msg_ret:
    jr RA

msgtick:
    asciiz "Tick!"

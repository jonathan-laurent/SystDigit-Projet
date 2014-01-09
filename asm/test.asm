.text
init:
    liuz B 0x40
    lw B 0(B)
    jz B init
    add D D B
    push D
    li A msgtick
    jal ser_out_msg
    pop D
    j init

ser_out_msg:
    liuz C 0x41
    lil C 0x02
ser_out_msg_loop:
    lb B 0(A)
    jz B ser_out_msg_ret
    sb B 0(C)
    incri A 1
    j ser_out_msg_loop
ser_out_msg_ret:
    jr RA

msgtick:
    ascii "Tick!"

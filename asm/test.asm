.text
init:
    li B _clock
    lw B 0(B)
    jz B init
    add D D B
    push D
    li A msgtick
    jal ser_out_msg
    pop D
    j init

ser_out_msg:
    li C _output
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

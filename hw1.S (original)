.text
.global hw1_function

hw1_function:
    li a0, 10
    li t0, 32
    li t1, 31

loop_start:
    srl t2, a0, t1
    andi t2, t2, 1
    bnez t2, loop_end
    
    addi t0, t0, -1
    addi t1, t1, -1
    bgez t1, loop_start

loop_end:
    li a0, 28
    ret

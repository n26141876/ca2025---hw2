.section .data
.align 2
InputDataSet:
    .word 0x0000000a
    .word 0x00000040
    .word 0x00000400
    .word 0x00000003

.section .text
.global hw1_function

hw1_function:
    la t0, InputDataSet

    lw t1, 0(t0)
    lw t2, 4(t0)
    lw t3, 8(t0)
    lw t4, 12(t0)

    add a0, t1, t2
    add a0, a0, t3
    add a0, a0, t4

    ret

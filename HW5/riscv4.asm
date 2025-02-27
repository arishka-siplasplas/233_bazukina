.text
.globl main

main:
    li a7, 5
    ecall
    mv t0, a0
    li t1, 0
    slli t2, t0, 2
    addi sp, sp, -128
    mv t3, sp
    mv t6, t0

read_loop:
    beqz t0, print_loop
    li a7, 5
    ecall
    sw a0, 0(t3)
    addi t3, t3, 4
    addi t0, t0, -1
    j read_loop

print_loop:
    beqz t6, end
    addi t3, t3, -4
    lw t4, 0(t3)
    andi t5, t4, 1
    bnez t5, skip
    li a7, 1
    mv a0, t4
    ecall
    li a7, 11
    li a0, 10
    ecall

skip:
    addi t6, t6, -1
    j print_loop

end:
    li a7, 11
    li a0, 10
    ecall
    li a7, 10
    ecall
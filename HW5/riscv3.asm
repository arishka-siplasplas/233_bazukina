.text
.globl main

main:
    li a7, 5
    ecall
    mv t0, a0

    li t1, 0
    li t2, 1

loop:
    beq t0, zero, print_result

    li a7, 5
    ecall

    mul t3, a0, t2
    add t1, t1, t3

    neg t2, t2
    addi t0, t0, -1
    j loop

print_result:
    li a7, 1
    mv a0, t1
    ecall

    li a7, 11
    li a0, 10
    ecall

    li a7, 10
    ecall

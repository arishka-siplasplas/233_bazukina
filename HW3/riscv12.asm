.text
.globl main

main:
    li a7, 5
    ecall
    mv t0, a0

    li a7, 5
    ecall
    mv t1, a0

    li t2, 1
    sll t2, t2, t1
    or t0, t0, t2

    li a7, 1
    mv a0, t0
    ecall

    li a7, 11
    li a0, '\n'
    ecall

    li a7, 10
    ecall

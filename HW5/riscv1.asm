.text
.globl main

main:
    li a7, 5
    ecall
    mv t0, a0
    
    li a7, 5
    ecall
    mv t1, a0
    
    li a7, 5
    ecall
    mv t2, a0
    
    li a7, 5
    ecall
    mv t3, a0
    
    add t4, t0, t2
    li a7, 1
    mv a0, t4
    ecall

    li a7, 11
    li a0, 10
    ecall

    add t5, t1, t3
    li a7, 1
    mv a0, t5
    ecall

    li a7, 11
    li a0, 10
    ecall

    li a7, 10
    ecall

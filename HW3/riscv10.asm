.text
.globl main

main:
    li a7, 5
    ecall
    mv t0, a0
    
    li t1, -1
    slli t1, t1, 2
    
    and t2, t0, t1
    
    li a7, 1
    mv a0, t2
    ecall
    
    li a7, 11
    li a0, '\n'
    ecall
    
    li a7, 10
    ecall

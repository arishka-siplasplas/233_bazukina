.text
.globl main

main:
    li a7, 5
    ecall
    mv t0, a0
    
    li a7, 5
    ecall
    mv t1, a0
    
    slli t2, t0, 2
    slli t3, t0, 1
    add t2, t2, t3
    
    slli t4, t1, 2
    sub t4, t4, t1
    
    sub t2, t2, t4
    
    li a7, 1
    mv a0, t2
    ecall
    
    li a7, 11
    li a0, '\n'
    ecall
    
    li a7, 10
    ecall

.text
.globl main

main:
    li a7, 5
    ecall
    mv t0, a0
    
    li a7, 5
    ecall
    mv t1, a0
    
    addi t0, t0, 5
    addi t1, t1, -7
    sub t2, t0, t1
    
    li a7, 1
    mv a0, t2
    ecall
    
    li a7, 11
    li a0, '\n' 
    ecall
    
    
    li a7, 10
    ecall
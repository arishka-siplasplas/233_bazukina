.text
.globl main

main:
    li a7, 5
    ecall
    mv t0, a0
    
    li a7, 5
    ecall
    mv t1, a0
    
     mul t2, t0, t0
    li t3, 2
    mul t3, t2, t3
    
    li t4, 3
    mul t4, t1, t4
    addi t5, t4, 4
    sub t3, t3, t5
    
    li a7, 1
    mv a0, t3
    ecall
    
    li a7, 11
    li a0, '\n'
    ecall
    
    li a7, 10
    ecall

.text
.globl main

main:
    li a7, 5
    ecall
    mv t0, a0 
    
    li a7, 5
    ecall
    mv t1, a0
    
    addi t2, t0, 5
    div t3, t2, t1
    
    addi t4, t1, -1
    li t5, 10
    div t6, t5, t4
    
    add t0, t3, t6
    
    li a7, 1
    mv a0, t0
    ecall
    
    li a7, 11
    li a0, '\n'
    ecall
    
    li a7, 10
    ecall

.text
.globl main

main:
    li a7, 5
    ecall
    mv t0, a0
    
    li a7, 5
    ecall
    mv t1, a0
    
    div t2, t0, t1
    mul t3, t2, t1
    rem t4, t0, t1
    
    add t5, t3, t4
    
    li a7, 1
    mv a0, t5
    ecall
    
    li a7, 11
    li a0, '\n'
    ecall
    
    li a7, 10
    ecall

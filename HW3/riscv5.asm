.text
.globl main

main:
    li a7, 5
    ecall
    mv t0, a0
    
    li a7, 5
    ecall
    mv t1, a0
    
    slli t2, t0, 2  # x << 2
    sub t2, t2, t1  # (x << 2) - y
    addi t2, t2, 5  # ((x << 2) - y + 5)
    
    li t3, 1
    sra t2, t2, t3  # ((x << 2) - y + 5) >> 1
    
    li a7, 1
    mv a0, t2
    ecall
    
    li a7, 11
    li a0, '\n' 
    ecall
    
    li a7, 10
    ecall

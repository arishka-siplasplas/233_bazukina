.text
.globl main

main:
    li a7, 5
    ecall
    mv t0, a0
    
    li a7, 5
    ecall
    mv t1, a0
    
    srli t0, t0, 2  # x >> 2
    addi t1, t1, -1 # y - 1
    slli t1, t1, 3  # (y - 1) << 3
    add t2, t0, t1  # (x >> 2) + ((y - 1) << 3)
    
    li a7, 1
    mv a0, t2
    ecall
    
    li a7, 11
    li a0, '\n' 
    ecall
    
    li a7, 10
    ecall

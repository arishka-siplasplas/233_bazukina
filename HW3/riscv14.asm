.text
.globl main

main:
    li a7, 5
    ecall
    mv t0, a0
    
    li a7, 5
    ecall
    mv t1, a0
    
    blt t0, t1, less_than
    
    li t2, 0
    j end

less_than:
    li t2, 1

end:
    li a7, 1
    mv a0, t2
    ecall
    
    li a7, 11
    li a0, '\n'
    ecall
    
    li a7, 10
    ecall

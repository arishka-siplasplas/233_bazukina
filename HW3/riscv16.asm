.text
.globl main

main:
    li a7, 5
    ecall
    mv t0, a0
    
    li a7, 5
    ecall
    mv t1, a0
    
    li t2, -5
    bgt t0, t2, greater_x
    
    li t3, 0
    j check_y

greater_x:
    li t3, 1

check_y:
    li t4, 5
    blt t1, t4, less_than_y
    
    li t3, 0
    j end

less_than_y:
    li t5, 1
    
    and t3, t3, t5

end:
    li a7, 1
    mv a0, t3
    ecall
    
    li a7, 11
    li a0, '\n'
    ecall
    
    li a7, 10
    ecall

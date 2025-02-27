.text
.globl main

main:
    li a7, 5
    ecall
    mv t0, a0
    li t1, 0
    slli t2, t0, 2
    addi sp, sp, -128
    mv t3, sp
    mv t5, sp

read_loop:
    beqz t0, print_loop
    li a7, 5
    ecall
    sw a0, 0(t3)
    addi t3, t3, 4
    addi t0, t0, -1
    j read_loop

print_loop:
    beq t1, t2, end
    lw t4, 0(t5)
    mv t6, sp

check_dup:
    beq t5, t6, print_num
    lw t0, 0(t6)
    bne t4, t0, next
    j skip

next:
    addi t6, t6, 4
    bne t6, t5, check_dup
    j print_num

print_num:
    li a7, 1
    mv a0, t4
    ecall
    li a7, 11
    li a0, 10
    ecall

skip:
    addi t5, t5, 4
    addi t1, t1, 4
    j print_loop

end:
    li a7, 11
    li a0, 10
    ecall
    li a7, 10
    ecall

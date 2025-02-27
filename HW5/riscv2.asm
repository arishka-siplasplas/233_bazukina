.text
.globl main

main:
    li a7, 5
    ecall
    mv t0, a0

    li t3, 10

    blt t0, zero, negate
    j process_digits
    

negate:
    neg t0, t0

process_digits:
    li t1, 0

loop:
    beq t0, zero, print_result
    rem t2, t0, t3
    add t1, t1, t2
    div t0, t0, t3
    j loop

print_result:
    li a7, 1
    mv a0, t1
    ecall

    li a7, 11
    li a0, 10
    ecall

    li a7, 10
    ecall

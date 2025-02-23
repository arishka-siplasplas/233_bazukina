.text
.globl main
main:
    lui     s0, 0x10010
    addi    s1, s0, 12
    sw      s1, 0(s0)
    lui     t0, 0x30000
    addi    t1, zero, 3
    addi    t0, t0, 16
    lw      s1, 0(s0)
    add     t2, t1, s1
    beq     t0, t2, ending

jumpic:
    jal     zero, ending
    
ending:
    auipc   t2, 0x0
    addi    t2, t2, -4
    jalr    zero, 0(t2)
    addi    a7, zero, 10
    ecall

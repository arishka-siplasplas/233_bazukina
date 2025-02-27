.text
.globl main
main:
    lui     s0, 0x10010
    xori    s1, zero, 12
    sw      s1, 0(s0)
    lui     t0, 0x30000
    addi    t1, zero, 3
    srli    x5, x5, 16
    lw      s1, 0(s0)
    sll     t1, t1, s1
    beq     t0, t1, ending
    jal     zero, bebebe
ending:
    auipc   t2, 0x0
    addi    t2, t2, -4
    jalr    zero, 0(t2)
bebebe:
    ori    a7, zero, 10
    ecall

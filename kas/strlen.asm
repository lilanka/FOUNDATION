.section .text
.global strlen
strlen:
    add t0, zero, zero # test comment
1:
    add  t1, t0, a0 
    lb   t1, 0(t1) 
    beq  t1, zero, 1f
    addi t0, t0, 1 
    jal  zero, 1b 
1:
    addi a0, t0, 0
    jalr zero, ra

.text
  
  .macro read_int(%x)
  li a7, 5
  ecall
  mv %x, a0
  .end_macro
  
  .macro print_double(%x)
  li a7, 3
  fmv.d  fa0, %x
  ecall
  .end_macro
  
  .macro newline
  li a7, 11
  li a0, '\n'
  ecall
  .end_macro
  
  .macro exit
  li a7, 10
  ecall
  .end_macro
  
  main:
    read_int(t0)
    read_int(t1)
    read_int(a0)
    fcvt.d.w ft0, t0
    fcvt.d.w ft1, t1
    fdiv.d  fa0, ft0, ft1
    jal truncate
    print_double(fa0)
    newline
    exit
    
    
  truncate:
  li a1, 31
  ble a0, a1, no_overflow
  li a0, 31
  no_overflow:
  li t2, 1 # t2 - 10^0
  li t3, 10
  loop: # t2 = 10^(a0)
    beqz, a0, break
    addi a0, a0, -1
    mul t2, t2, t3
    j loop
  break:
  fcvt.d.w ft2, t2
  fmul.d fa0, fa0, ft2
  fcvt.w.d a0, fa0
  fcvt.d.w fa0, a0
  fdiv.d fa0, fa0, ft2
  jalr ra
  
  
  
  
  
  
  
  
  
    
    
    
    

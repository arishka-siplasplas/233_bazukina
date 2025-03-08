.text
  
  .macro read_double(%x)
  li a7, 7
  ecall
  fmv.d %x, fa0
  .end_macro
  
  .macro print_double(%x)
  li a7, 3
  fmv.d fa0, %x
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
    read_double(ft1) # number
    read_double(ft2) # precision
    li t0, 1
    fcvt.d.w fa1, t0 
    li t0, 100
    fcvt.d.w fa2, t0
    li t0, 2
    fcvt.d.w fa3, t0
    
    loop:
      fadd.d ft0, fa1, fa2 # k = m + n
      fdiv.d ft0, ft0, fa3 # k = (m + n)/2
      fmv.d  ft7, ft0
      fmul.d ft0, ft0, ft0 # k^2
      fmul.d ft0, ft0, ft7 # k^3
      
      fle.d t0, ft0, ft1
      bnez t0, less
      # k^3 > A
      fmv.d fa2, ft7
      j check
      
      less:
      # k^3 < A
      fmv.d fa1, ft7
      j check
      
      check:
      fsub.d ft6, fa2, fa1
      fge.d t0, ft6, ft2
      beqz t0, end
      j loop
      
      end:
      print_double(ft7)
      newline
      exit

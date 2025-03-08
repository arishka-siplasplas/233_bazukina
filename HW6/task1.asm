.text

  .macro newline
  li a7, 11
  li a0, '\n'
  ecall
  .end_macro
  
  .macro read_int(%x)
  li a7, 5
  ecall
  mv %x, a0
  .end_macro
    
  .macro print_char(%x)
  li a7, 11
  li a0, %x
  ecall
  .end_macro 
  
  .macro printline(%num, %c1, %c2)
  while:
    beqz %num, end
    print_char(%c1)
    print_char(%c2)
    addi, %num, %num, -1
    j while
  end:
    print_char(%c1)
  .end_macro 
  
      
  main:
    read_int(t0)
    read_int(t1)
    li t2, 0
    
    loop:
      beq t1, t2, finish
      mv t3, t0
      printline t3, '+', '-'
      newline
      mv t3, t0
      printline t3, '|', ' '
      newline
      addi t2, t2, 1
      j loop
    finish:
      mv t3, t0
      printline t3, '+', '-'
      newline
      newline
      
      li a7, 10
      ecall
        

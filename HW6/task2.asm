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
  
  main:
    loop:
      read_int a2
      read_int a3
      read_int a4
      jal CheckTriangles
      beqz a0, end
      li s2, 1
      beq a0, s2, yes
      print_char('N')
      newline
      j loop
      yes:
        print_char('Y')
        newline
        j loop
      
      end:
        newline
        li a7, 10
      	ecall
      
    
    
  CheckTriangles:
    li a0, 2
    
    bnez a2, run
    bnez a3, run
    beqz a4, all_zero
    
    run:
      add t0, a2, a3
      blt t0, a4, failed
      
      add t0, a2, a4
      blt t0, a3, failed
      
      add t0, a3, a4
      blt t0, a2, failed
      
      li a0, 1
      j return
    
    failed:
      j return
    
    all_zero:
      li a0, 0
      j return
      
    return:
      jalr ra
    
        
        
        
        
        
        
      
      
      

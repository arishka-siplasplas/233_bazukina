.text

  .macro print_int (%x)
  li a7, 1
  mv a0, %x
  ecall
  .end_macro
  
  .macro print_char(%x)
  li a7, 11
  li a0, %x
  ecall
  .end_macro 
  
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

  main:
   
    read_int t0
    mv s2, sp
    fill_arr:
      beqz t0, end
      read_int t1
      sw t1, 0(sp)
      addi t0, t0, -1
      addi sp, sp, -4
      j fill_arr
    end:
      mv a0, s2
      mv a1, sp
      jal bubble_sort
      print_arr:
        beq s2, a1, stop
        lw t0, 0(s2)
        print_int t0
        print_char ' '
        addi s2, s2, -4
        j print_arr
      stop:
        newline
        li a7, 10
        ecall
      
     
   bubble_sort:
     addi t1, a1, 4
     
     loop:
       li t2, 0
       mv t3, a0
       
       inner_loop:
         beq t3, t1, check
         lw t4, 0(t3)
         lw t5, -4(t3)
         blt t5, t4, swap_case
         addi t3, t3, -4
         j inner_loop
         
         swap_case: 
           li t2, 1
           sw t4, -4(t3)
           sw t5, 0(t3)
           addi, t3, t3, -4
           j inner_loop
          
          check:
            beqz t2, return
            j loop
          
        return:
          jalr ra
          
          
      
     
  
  

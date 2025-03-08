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
    read_int a3 # array size
    read_int a5 # flag
    mv t0, a3 # store array size in t0
    mv a4, sp # store array begining adress
    fill_arr:
      beqz t0, end
      read_int t1 # read int
      sw t1, 0(sp) # put int to array
      addi t0, t0, -1 # decrement remaining array size
      addi sp, sp, -4 # move stack pointer
      j fill_arr
    end:
      jal key_sort
      mv t0, a0 # store array size in t0
      mv t1, a1 # store begining of the array in t1
      print_arr:
        beqz t0, exit
        lw t2, 0(t1)
        print_int t2
        newline
        addi t0, t0, -1 # decrement remaining array size
        addi t1, t1, -4 # move array pointer
        j print_arr
        exit:
          newline
          li a7, 10
          ecall
      
  
  key_sort:
  # a3 - array size in words
  # a4 - array beginning adress
  # a5 - flag that tells how to compare
  mv a6, ra # store return adress
  loop:
    addi t4, a3, -1 # store array size in t4
    mv t3, a4 # store beginning of the array in t3
    li t2, 0 # flag (1 if no swaps occured, 0 if some swaps occured)
    inner_loop:
      beqz t4, check
      lw t5, 0(t3)
      lw t6, -4(t3)
      mv a0, t5
      mv a1, t6
      beqz a5, usual_case
      jal compare_mod
      beqz a0, swap
      addi t4, t4, -1 # decrement array size
      addi t3, t3, -4 # decrement array pointer
      j inner_loop
      
      usual_case:
        jal compare_usual
        beqz a0, swap
        addi t4, t4, -1 # decrement array size
        addi t3, t3, -4 # decrement array pointer
        j inner_loop
        
      swap:
        li t2, 1 # set flag to 1 if we swapped
        sw t5, -4(t3)
        sw t6, 0(t3)
        addi t4, t4, -1 # decrement array size
        addi t3, t3, -4 # decrement array pointer
        j inner_loop
        
      check:
        beqz t2, return
        j loop
        
    return:
      mv a0, a3 # return array size in a0
      mv a1, a4 # return array beginning adress in a1
      mv ra, a6
      jalr ra
        
  
    
  compare_usual:
    bgt a0, a1, improper_order_usual
    li a0, 1
    jalr ra
    improper_order_usual:
      li a0, 0
      jalr ra
      
  compare_mod:
    li a2, 10
    rem a0, a0, a2
    rem a1, a1, a2
    blt a0, a1, imporper_order_mod
    li a0, 1
    jalr ra
    imporper_order_mod:
      li a0, 0
      jalr ra
      
     
  
          
          
      
     
  
  

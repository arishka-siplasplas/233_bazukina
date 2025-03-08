binary_search:
  # a0 - pointer to the array
  # a1 - value to find
  # a2 - start index
  # a3 - end index
  sub t0, a3, a2 # (end - start)
  li t1, 2
  div t0, t0, t1 # (end - start) / 2
  add t0, a2, t0 # start + (end - start) / 2
  
  bgt a2, a3, return # if start > end: return -1
  
  find_data_mid:
    mv t1, t0 # store mid index in t1
    li t2, 4
    mul t1, t1, t2 # find shift size to reach mid
    add t1, a0, t1 # store in t1 pointer to data[mid]
    lw t3, 0(t1) # load data[mid]
    
  beq t3, a1, return_mid # if data[mid] == value: return mid
  bgt t3, a1, return_greater_case
  
  return_less_case:
    addi a2, t0, 1 # update start index to mid + 1
    j binary_search
    
  return_greater_case:
    addi a3, t0, -1 # update end index to mid - 1
    j binary_search
    
  return_mid:
    mv a0, t0 # set return value to index of mid
    jalr ra
    
  return:
    li a0, -1 # set return value to -1
    jalr ra
    
    
    
    
    
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
    
    .macro print_double(%x)
    li a7, 3
    fmv.d fa0, %x
    ecall
    .end_macro
	
    .macro read_int(%x)
    li a7, 5
    ecall
    mv %x, a0
    .end_macro
  
    .macro newline
    li a7, 11       
    li a0, '\n'     
    ecall           
    .end_macro
    
   .macro print_double %x
    li a7, 3
    fmv.d fa0, %x
    ecall
    .end_macro

main:
    read_int t0         
    li t1, 4                
    fcvt.d.w fs1, t1        
    li t2, 1                
    fcvt.d.w fs2, t2        
    li t3, 100000           
    li t5, 0                
    fcvt.d.w fs5, t5        
    li t4, 2                
    fcvt.d.w fs4, t4        
    li t6, -1               
    fcvt.d.w fs6, t6        
    li a7, 0                

for_loop:
    bge a7, t3, end_for      
    
    fdiv.d fs3, fs1, fs2    
    fadd.d fs5, fs5, fs3    
    fmul.d fs2, fs2, fs6    
    fmul.d fs4, fs4, fs6    
    fadd.d fs2, fs2, fs4    
    addi a7, a7, 1        
    
    j for_loop             

end_for:
    fmv.d fa0, fs5          
    mv a0, t0               
    jal round             
    
    print_double(fa0)    

    newline                 
    li a7, 10               
    ecall                   

round:
    mv t3, a0 
    fmv.d fs5, fa0 
    li t4, 10 
    fcvt.d.w fs4, t4 
    li t6, 1 
loop_multip:
    beqz t3, kill 
    fmul.d fs5, fs5, fs4 
    mul t6, t6, t4 
    addi t3, t3, -1 
    j loop_multip 
    
kill:
    fcvt.w.d t5, fs5 
    fcvt.d.w fs5, t5 
    fcvt.d.w fs6, t6 
    fdiv.d fs5, fs5, fs6 
    fmv.d fa0, fs5 
    jalr zero, 0(ra)

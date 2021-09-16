.data 
 //base:  $2
 //exp: $3
.text
.global main
main:
    pushq %rbp                     # prologue
    movq  %rsp, %rbp
    movq  $2, %r8  # move the base into rdi
    movq $3, %r9    # move the exponent into rsi 
    decq %r9         # the amount of times that we want to implement the loop is equal to (exponent -1)
    call power_loop    # call the loop      
    movq %rsi, %rdi
    
    movq %rdi, %rbx
   // movq $60, %rax
    movl $1, %eax
    int $0x80
    

power_loop: 
    cmpq $0, %r9     # check if the base has been multiplied with itself (exponent -1) times
    je end             # if it has, end the loop
    pushq %rbp           # if not, then do epilogue 
    movq %rsp, %rbp 
    movq %r8, %rax     # mov the base stored in rdi into rax
    mulq %rax           # multiply base with itself 
    movq %rax, %r8     # move the multiplied base back into rdi, we do this because rax isn't callee-saved
    decq %r9           # decrement the exponent
    jmp power_loop      # go back to the beginning of the loop 
end:
    movq %rbp, %rsp
    popq %rbp
    ret
.data
result: .asciz "the result is: %ld /n"
.text
.global main
main:
    pushq %rbp               # prologue
    movq  %rsp, %rbp
    pushq $2         # move the base into rdi
    pushq $3 

                       # the amount of times that we want to implement the loop is equal to (exponent -1)
    call power_loop_start    # call the loop   
    movq $result, %rdi
    //movq %rbx, %rsi
    movq $0, %rax
    call printf
   // movq $60, %rax
    movq $1, %rax
    int $0x80
power_loop_start:
pushq %rbp          
movq %rsp, %rbp 
pushq %r12
pushq %r13
pushq %r14
movq $2, %r12
movq $2, %r13
movq $3, %r14
//jmp power_loop
//movq 24(%rsp), %r12  # move the base into r8
//movq 24(%rsp), %r13       # also move the base into r9, r9 will store the multiplied value 


power_loop: 
    cmpq $1, %r14     # check if the base has been multiplied with itself (exponent -1) times
    je end             # if it has, end the loop
    
    movq %r13, %rax                     # mov the base stored in r8 into rax
    mulq %r12           # multiply base with with r9 
    movq %rax, %r13    # move the multiplied base into r9, we do this because rax isn't callee-saved
    decq %r14         # decrement the exponent
    jmp power_loop      # go back to the beginning of the loop 
end:
    movq %r13, %rbx
    popq %r14
    popq %r13
    popq %r12
    movq %rbp, %rsp
    popq %rbp
    ret

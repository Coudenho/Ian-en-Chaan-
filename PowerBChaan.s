.data
result: .asciz "the result is: %ld /n"
.text
.global main
main:
     pushq %rbp               # prologue
     movq  %rsp, %rbp
     pushq $2         # move the base into rdi
     pushq $3                       # move the exponent into rsi 
                       # the amount of times that we want to implement the loop is equal to (exponent -1)
    pushq %rdi
    pushq %r8
    pushq %r9
    call power_loop_start    # call the loop   
    movq $result, %rdi
    movq $3, %rsi
    movq $0, %rax
    call printf
   // movq $60, %rax
    movl $1, %eax
    int $0x80

power_loop_start:
pushq %rbp          
movq %rsp, %rbp 

movq 56(%rsp), %r8  # move the base into r8
movq 56(%rsp), %r9       # also move the base into r9, r9 will store the multiplied value 


power_loop: 
    cmpq $0, 48(%rsp)     # check if the base has been multiplied with itself (exponent -1) times
    je end             # if it has, end the loop
    
    movq %r8, %rax                     # mov the base stored in r8 into rax
    mulq %r9           # multiply base with with r9 
    movq %rax, %r9    # move the multiplied base into r9, we do this because rax isn't callee-saved
    decq 48(%rsp)           # decrement the exponent
    jmp power_loop      # go back to the beginning of the loop 
end:
    movq %rbp, %rsp
    popq %rbp
    movq %r9, %r12
    addq $8, %rsp
    popq %r9
    popq %r8
    popq %rdi
    subq $32, %rsp
    ret

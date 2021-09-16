.data 
 //base:  $2
 //exp: $3
.text
.global main
main:
    pushq %rbp                     # prologue
    movq  %rsp, %rbp
     pushq $2         # move the base into rdi
     pushq $3                       # move the exponent into rsi 
                       # the amount of times that we want to implement the loop is equal to (exponent -1)
    call power_loop_start    # call the loop      
    movq %r9, %rdi
    movq $0, %rax
    call printf
   // movq $60, %rax
    movq $1, %rax
    int $0x80
power_loop_start:
pushq %rbp           # if not, then do prologue
movq %rsp, %rbp 
movq 24(%rsp), %r8  # move the base into r8
movq %r8, %r9       # also move the base into r9, r9 will store the multiplied value 
jmp power_loop

power_loop: 
    cmpq $0, 16(%rsp)     # check if the base has been multiplied with itself (exponent -1) times
    je end             # if it has, end the loop
    
    movq %r8, %rax                     # mov the base stored in r8 into rax
    mulq %r9           # multiply base with with r9 
    movq %rax, %r9    # move the multiplied base into r9, we do this because rax isn't callee-saved
    decq 16(%rsp)           # decrement the exponent
    jmp power_loop      # go back to the beginning of the loop 
end:
    movq %rbp, %rsp
    popq %rbp
    ret

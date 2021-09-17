.data
result: .asciz "the result is: %ld \n"
.text
.global main
main:
   // subq $32, %rsp
   // pushq %rbp               # prologue
   // movq %rsp, %rbp
    
    pushq $5
    pushq $3
   // movq $3, %rsi
    //movq $4, %rdi
    call power_loop_start
    movq %rax, %rsi
    movq $0, %rax
    movq $result, %rdi
   
  
    call printf
    //subq $8 , %rsp
   
   // addq $8 , %rsp
    movl $1, %eax
    int $0x80

power_loop_start:
pushq %rbp
movq %rsp, %rbp
subq $8, %rsp
movq 16(%rbp), %rdx
movq 24(%rbp), %rcx 
movq %rdx, -8(%rbp)


power_loop:

    cmpq $1, %rcx  # check if the base has been multiplied with itself (exponent -1) times
    je end             # if it has, end the loop
   // movq 16(%rbp), %rax
                       # mov the base stored in r8 into rax
   // imulq %rbx, %rax           # multiply base with with r9 
    //movq %rax, 16(%rbp)
    movq -8(%rbp), %rax
    imulq %rdx, %rax
    movq %rax, -8(%rbp)
    decq %rcx        # decrement the exponent
    jmp power_loop      # go back to the beginning of the loop 
end:
    movq -8(%rbp), %rax
    movq %rbp, %rsp
    popq %rbp
    ret


    //movq $0, %rax
    //movq result, %rdi
    //movq 8(%rbp), %rsi
  //  movq -8(%rbp), %rsi
   // call printf
   // movl $1, %eax
   // int $0x80

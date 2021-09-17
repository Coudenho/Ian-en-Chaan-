.data
enter: .asciz "Enter first a base and than an exponent: \n"
formatstr: .asciz "%ld%ld"
result: .asciz "the result is: %ld \n"
.text
.global main
main:

   pushq %rbp               # prologue
   movq %rsp, %rbp

    movq $0, %rax    
	movq $enter, %rdi
	call printf

    subq $16, %rsp
    leaq -16(%rbp), %rsi
    leaq -8(%rbp), %rdx
    movq $formatstr, %rdi
    movq $0, %rax
    call scanf

    call power_loop_start
    movq %rax, %rsi
    movq $0, %rax
    movq $result, %rdi
    call printf
   
    // movl $1, %eax
    // int $0x80

    movq %rbp, %rsp
    popq %rbp
    call exit

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

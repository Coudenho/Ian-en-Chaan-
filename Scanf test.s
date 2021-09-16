.data 

formatstr: .asciz "%ld"
enterb: .asciz "Enter base: \n"
enterexp: .asciz "Enter exponent: \n"

.text
.global main
main:
#prologue
    push %rbp
    mov %rsp, %rbp
    
    movq $0, %rax    
	movq $enterb, %rdi
	call printf

    subq $16, %rsp
    leaq -16(%rbp), %rsi
    movq $formatstr, %rdi
    movq $0, %rax
    call scanf
    call printf
    movq %rdi, %rsi

    movq $0, %rax    
	movq $enterexp, %rdi
	call printf

    movq $formatstr, %rdi
    movq $0, %rax
    call scanf
    call printf
    movq %rdi, %r8

    popq %rbx
    movq $0, %rax
    movq %rsi, %rdi
    call printf

//epilogue
    mov %rbp, %rsp
	pop %rbp

    call exit

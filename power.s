.data
name: .asciz "Chaan %ld \n"
.text

.global main
main:
	
	pushq %rbp
	movq  %rsp, %rbp
	movq $6, 8(%rbp)
    movq  8(%rbp), %rcx


	movq $name, %rdi
	movq 8(%rbp), %rax
	movq %rax, %rsi
	movq $0, %rax
	//call scanf 
	call printf
	                 

	//movq %rbp, %rsp
//popq %rbp
//ret
	movl $1, %eax
	int $0x80

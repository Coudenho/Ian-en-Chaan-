.data
name: .asciz "Chaan \n"
.text

.global main
main:
	push %rbp
	mov  %rsp, %rbp

	movq $0, %rax
	movq $name, %rdi
	call printf
	movl $1, %eax
	int $0x80
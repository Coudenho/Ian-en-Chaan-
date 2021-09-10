.data
name: .asciz "Chaan en Ian, cvandenoudenho en ifastl ,3.10 part A \n"
.text

.global main
main:
//prologue
	push %rbp
	mov  %rsp, %rbp  //nieuwe stuk stack, beide op zelfde niveau beginne

	movq $0, %rax    
	movq $name, %rdi
	call printf
	movl $1, %eax
	int $0x80

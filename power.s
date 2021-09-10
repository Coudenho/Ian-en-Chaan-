.data
<<<<<<< HEAD
name: .asciz "Chaan en Ian, cvandenoudenho en ifastl ,3.10 part A \n"
=======
name: .asciz "Chaan \n"
>>>>>>> 766962dac387d7ee36c13c55705086b948fa231c
.text

.global main
main:
<<<<<<< HEAD
//prologue
	push %rbp
	mov  %rsp, %rbp  //nieuwe stuk stack, beide op zelfde niveau beginne

	movq $0, %rax    
	movq $name, %rdi
	call printf
	movl $1, %eax
	int $0x80
=======
	push %rbp
	mov  %rsp, %rbp

	movq $0, %rax
	movq $name, %rdi
	call printf
	movl $1, %eax
	int $0x80
>>>>>>> 766962dac387d7ee36c13c55705086b948fa231c

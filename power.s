.text
.global main
main:
	pushq %ebp
	movq %esp, %ebp

	movq $1, %eax
	int 0x80
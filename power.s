.data #read n write
hello: .asciz "hello users \n"
promt: .asciz "give me number\n"
format: .asciz "%ld"
output: .asciz "The number is %ld\n"

.text #where the code is executed
test
test2
.global main
main:
	#prologue
	pushq %rbp
	movq %rsp,%rbp

	movq $hello,%rdi
	movq $0,%rax
	call printf

	call inout

	#epilogue
	movq %rbp,%rsp
	popq %rbp

	movq $0,%rdi
	call exit

inout:
	#prologue
	pushq %rbp
	movq %rsp,%rbp

	movq $promt,%rdi
	movq $0,%rax
	call printf

	movq $0,%rax
	subq $16,%rsp #16 bytes alligned
	
	call scanf

	movq -16(%rbp),%rdi
	call increment

	movq %rax,%rsi #the second argument
	movq $output,%rdi
	movq $0,%rax
	call printf


	#epilogue
	movq %rbp,%rsp
	popq %rbp

	ret

increment:
	#prologue
	pushq %rbp
	movq %rsp,%rbp

	incq %rdi
	movq %rdi,%rax

	#epilogue
	movq %rbp,%rsp
	popq %rbp

	ret

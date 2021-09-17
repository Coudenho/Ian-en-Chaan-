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

    subq $16, %rsp          #reserve stack space
    leaq -16(%rbp), %rsi    #first input on -16rbp and store that adress in rsi
    leaq -8(%rbp), %rdx     #first input on -16rbp and store that adress in rsi
    movq $formatstr, %rdi   #define our form of input 
    movq $0, %rax           #clear all vectors
    call scanf              #call the scanf function

    call power_loop_start   #call the subroutine
    movq %rax, %rsi         #move rax/result to rsi
    movq $0, %rax           #clear all vectors = 0
    movq $result, %rdi      #move the the result intro rdi, string result contains 1 integer which is rsi
    call printf             #print what is in rdi
   
    movq %rbp, %rsp
    popq %rbp
    call exit

power_loop_start:
pushq %rbp                  #prologue (new start of stack)
movq %rsp, %rbp             #prologue               
movq 16(%rbp), %rdx         #move second input to rdx
movq 24(%rbp), %rcx         #move first input to rcx
movq %rdx, -8(%rbp)         #move rdx/first input to current top of stack


power_loop:

    cmpq $1, %rcx  # check if the base has been multiplied with itself (exponent -1) times
    je end             # if it has, end the loop
    movq -8(%rbp), %rax  #move first input (base) into rax
    imulq %rdx , %rax     #multiply rdx (which is the base) with rax and store it in rax
    movq %rax, -8(%rbp)   #move rax/outcome of the multiplication to what was top of stack/ -8rbp
    decq %rcx             # decrement the exponent (second input, that is stored in rcx)
    jmp power_loop      # go back to the beginning of the loop 
end:
    movq -8(%rbp), %rax  #move the result/top of stack into rax
    movq %rbp, %rsp
    popq %rbp
    ret                  #return to main

    #I made a sort of drawing of the stack of this code

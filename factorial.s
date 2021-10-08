.data
enter: .asciz "Enter  a number:\n"
formatstr: .asciz "%ld"
result: .asciz "the result is: %ld \n"
.text
.global main
main:

   pushq %rbp               # prologue
   movq %rsp, %rbp

    movq $0, %rax           #Clear all vectors
	movq $enter, %rdi       #move enter into rdi
	call printf	            #print what is in rdi

    subq $16, %rsp          #reserve stack space
    leaq -16(%rbp), %rsi     #input on -16rbp and store that adress in rsi
    movq $formatstr, %rdi   #define our form of input 
    movq $0, %rax           #clear all vectors
    call scanf              #call the scanf function
    movq -16(%rbp), %rsi

    call factorial          #call the subroutine
    movq %rdi, %rsi         #move rdx/result to rsi
    movq $0, %rax           #clear all vectors = 0
    movq $result, %rdi      #move the  result intro rdi, string result contains 1 integer which is rsi
    call printf             #print what is in rdi
   
    movq %rdi, %rax
    movq %rbp, %rsp
    popq %rbp
    call exit

    factorial:
        pushq %rbp
        movq %rsp, %rbp
        cmpq $1, %rdi
        jl factorial_end
            pushq %rdi
            decq %rdi
            call factorial
            popq %rdi
            mulq %rdi
            ret
        
        
        factorial_end:     
            popq %rbp
            movq %rbp, %rsp
            ret

     
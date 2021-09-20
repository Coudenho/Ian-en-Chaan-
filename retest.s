.data
enter: .asciz "Enter first an EXPONENT and than a BASE: \n"
formatstr: .asciz "%ld%ld"
result: .asciz "the result is: %ld \n"
.text
.global main
main:

   pushq %rbp               # prologue
   movq %rsp, %rbp

    movq $0, %rax           #Clear all vectors
	movq $enter, %rdi   #move enter into rdi
	call printf	    #print what is in rdi

    subq $16, %rsp          #reserve stack space
    
 
    movq $0, %rax           #clear all vectors
    leaq -8(%rbp), %rsi    #first input on -16rbp and store that adress in rsi
    leaq -16(%rbp), %rdx     #first input on -16rbp and store that adress in rsi
    movq $formatstr, %rdi   #define our form of input
    call scanf              #call the scanf function
 
    movq -8(%rbp), %rdi
    
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
movq %rsi, -8(%rbp)         #move rdx/first input to current top of stack


power_loop:

    cmpq $1, %rdi  # check if the base has been multiplied with itself (exponent -1) times
    je end             # if it has, end the loop
    cmpq $1, %rdi
    jl if_zero
    movq -8(%rbp), %rax  #move first input (base) into rax
    imulq %rsi , %rax     #multiply rdx (which is the base) with rax and store it in rax
    movq %rax, -8(%rbp)   #move rax/outcome of the multiplication to what was top of stack/ -8rbp
    decq %rdi             # decrement the exponent (second input, that is stored in rcx)
    jmp power_loop      # go back to the beginning of the loop 

if_zero:
    movq $1, -8(%rbp)

end:
    movq -8(%rbp), %rax  #move the result/top of stack into rax
    movq %rbp, %rsp
    popq %rbp
    ret                  #return to main

    #I made a sort of drawing of the stack of this code

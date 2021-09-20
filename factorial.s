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
                 
#    movq 16(%rbp), %rdi         #move  input to rdx
    movq $1, %rax               #move 1 into rax, 

execution:
    pushq %rbp                  #prologue (new start of stack)
    movq %rsp, %rbp             #prologue  
    cmpq $1, %rsi  # check if the base has been multiplied with itself (exponent -1) times
    je end             # if it has, end the loop
    decq %rsi
    call execution
    imulq %rsi , %rax     #multiply rdx (which is the base) with rax (first time *1) and store it in rax
    decq %rsi             #decrement the input with 1
    movq %rbp, %rsp
    popq %rbp    
    call execution      # go back to the beginning of the loop 

end:    movq %rax, %rdi        #move the result from rax into rdx
    ret

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
    movq -16(%rbp), %rdi
  /  movq $enter, %rdi
   / movq $0, %rax
    /call printf
   / movq $1, %rax
    call factorial          #call the subroutine
    movq %rdi, %rsi         #move rdx/result to rsi
    movq $0, %rax           #clear all vectors = 0
    movq $result, %rdi      #move the  result intro rdi, string result contains 1 integer which is rsi
    call printf             #print what is in rdi
   
   // movq %rdi, %rax
  
    movq %rbp, %rsp
    popq %rbp
    /subq $8, %rsp
    call exit

    factorial:
                 
#    movq 16(%rbp), %rdi         #move  input to rdx
  /  movq $1, %rax               #move 1 into rax, 
   // pushq %rbp                  #prologue (new start of stack)
    //movq %rsp, %rbp             #prologue  
    movq $1, %rsi
    call execution
    ret
execution:
   
    cmpq $1, %rdi  # check if the base has been multiplied with itself (exponent -1) times
    je end
    //addq $8, %rsp
    //popq %rax
    movq %rsi, %rax
    imulq %rdi , %rax     #multiply rdx (which is the base) with rax (first time *1) and store it in rax
    movq %rax, %rsi
    decq  %rdi

    call execution
   // addq $8, %rsp
    ret
    //je end             # if it has, end the loop
    
    //decq %rdi
    //call execution
    
   // decq %rsi
    //decq %rsi             #decrement the input with 1
    //movq %rbp, %rsp
    //popq %rbp    
    //call execution      # go back to the beginning of the loop 

end:    
 movq %rax, %rdi        #move the result from rax into rdx
 ret

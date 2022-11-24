%include "util.asm"

GLOBAL _start


section .text 

_start :
	mov rdi,number1
	call printstr
	call readint
	mov  [num1],rax
	
	mov rdi,number2
	call printstr
	call readint
	mov [num2],rax
	
	mov rdi,operators
	call printstr
	mov rdi,op
	mov rsi,2
	call readstr
	
	jmp compare_operators
	
addition :
	mov rdi,[num1]
	add rdi,[num2]
	jmp result
	
subtraction :
	mov rdi,[num1]
	sub rdi,[num2]
	jmp result
	
multiplication :
	mov rdi,[num1]
	imul rdi,[num2]
	jmp result
	
division :
	mov rdx,0
	mov rax,[num1]
	mov rbx,[num2]
	idiv rbx
	mov rdi,rax
	jmp result
	
	
result :
	call printint 
	call endl
	call exit0
	

compare_operators :
	
	mov rcx,[op]
	cmp rcx,43
	je addition 
	cmp rcx,45
	je subtraction 
	cmp rcx,42
	je multiplication 
	cmp rcx,47
	je division 
	
operator_error:

	mov rdi,error_msg
	call printstr
	call exit0	
	
	
section .data

	number1 : db "Enter first number : ",0
	number2 : db "Enter second number : ",0
	operators : db "Select the operation to be performed(+,-,*,/): ",0
	error_msg : db "Selected operation is invalid!",0
	
	
section .bss 

	num1 : resb 8
	num2 : resb 8
	op : resb 2

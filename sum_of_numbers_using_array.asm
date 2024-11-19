section .data                              ; this section is for initialised data
	msg db 'The sum of numbers using array' , 10 
	len equ $-msg			
	x db 1 , 2 , 3 , 0                         
	
	section .bss                               ; this section of for uninitialised data
	sum resb 2                                  ; two bytes are reserved for sum variable

	section .text                              ; this section to write instructions
	global _start
	_start:

	mov eax , 4                        
	mov ebx , 0 
	mov ecx , x
	
	t:                                    ; t is label here , where it works like loop , upto certain conditions it repeat the command
	add ebx , [ecx]	
	add ecx , 1                            ; incrementing ecx by 1 
	dec eax                                ; decrementing eax by 1
	jnz t                                  ; jnz - jump not upto zero 

	add ebx , '0'                          ; converting integer to ascii
	mov [sum] , ebx                         ; copying ebx value in sum variable
		
	mov eax , 4		                          ; this statements for printing message
	mov ebx , 1
	mov ecx , msg 
	mov edx , len
	int 80h
  
	mov eax , 4                              ; this statements for printing sum
	mov ebx , 1
	mov ecx , sum
	mov edx , 2
	int 80h

	mov eax , 1                              ; exitting statements
	mov ebx , 0
	int 80h
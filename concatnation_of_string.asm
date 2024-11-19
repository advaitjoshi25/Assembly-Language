section .data
    first db "Advait", 0         ; First name
    middle db "Amey", 0      ; Middle name
    last db "Joshi", 0       ; Last name
    fullname db 30 dup(0)      ; Reserve space for the full name

section .bss
    ; Reserved space for first, middle, and last names
    first resb 10
    middle resb 10
    last resb 10

section .text
    global _start

_start:
    ; Concatenate first name
    mov esi, first
    mov edi, fullname
concatenate_first:
    mov al, [esi]
    cmp al, 0                
    je middle_name
    mov [edi], al
    inc esi
    inc edi
    jmp concatenate_first

middle_name:
    ; Concatenate middle name
    mov esi, middle
concatenate_middle:
    mov al, [esi]
    cmp al, 0                
    je last_name
    mov [edi], al
    inc esi
    inc edi
    jmp concatenate_middle

last_name:
    ; Concatenate last name
    mov esi, last
concatenate_last:
    mov al, [esi]
    cmp al, 0                
    je done
    mov [edi], al
    inc esi
    inc edi
    jmp concatenate_last

done:
    ; Print the concatenated full name
    mov eax, 4               ; syscall number for write (printf statement)
    mov ebx, 1               
    mov edx, 30              ; length of full name
    mov ecx, fullname       
    int 0x80

    ; Exit program
    mov eax, 1               ; EXIT 
    xor ebx, ebx             
    int 0x80
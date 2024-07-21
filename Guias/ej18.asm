;18.Se tienen las siguientes definiciones de rótulos en un programa assembler Intel x86:
;	STRING_A    	RESD  1
;	STRING_B   		RESD  1
;	CHAR    		RESB  1
;Las variables STRING_A y STRING_B tienen la dirección de inicio de un string 
;(cadena de caracteres terminados con un byte x’00’) mientras que la variable CHAR contiene un 
;caracter en codificación ASCII. Se pide:
;a.	Realizar una rutina interna que reciba como parámetros a los rótulos STRING_A y STRING_B y 
;devuelva un byte RESULT1 con una ‘S’ si los dos strings son iguales o una ‘N’ en caso contrario. 
;b.	Realizar una rutina interna que reciba como parámetros al rótulo STRING_A y CHAR y devuelva una 
;FULLWORD con la cantidad de ocurrencias del caracter CHAR dentro del string, en BPF c/s de 32 bits.

extern printf

%macro mPrintf 0
    sub rsp , 8
    call printf
    add rsp,8
%endmacro 

section .data
    STRING_A db 'ooooo, oooo!', 0
    STRING_B db 'Hello, world!', 0
    CHAR db 'o'
    RESULT1 db 0
    FORMAT1 db 'Strings are: %c', 10, 0
    FORMAT2 db 'Occurrences of %c: %li', 10, 0

section .bss
    tempChar resb 1
    COUNT resd 1

section .text
global main

;-----------------------------------------------
compare_strings:
    lea rdi, [STRING_A]
    lea rsi, [STRING_B]
    mov al, 'S'        
compare_loop:
    mov bl, [rdi]     
    mov bh, [rsi]     
    cmp bl, bh        
    jne not_equal     
    test bl, bl      
    jz equal          
    inc rdi           
    inc rsi           
    jmp compare_loop  

not_equal:
    mov al, 'N'       
equal:
    ret


; -----------------------------------

count_char_occurrences:
    lea rdi, [STRING_A]
    mov bh, byte [CHAR]   
    xor rax, rax     
count_loop:
    mov bl, [rdi]     
    cmp bl, bh        
    jne next_char     
    inc rax           
next_char:
    test bl, bl       
    jz done           
    inc rdi           
    jmp count_loop   
    ret

;----------------------------------------------

main:
    call compare_strings
    mov [RESULT1], al


    mov rdi, FORMAT1
    mov sil, byte [RESULT1]
    mPrintf

;;2da parte

    call count_char_occurrences
    mov [COUNT], rax

    mov rdi, FORMAT2
    mov sil, byte [CHAR]
    mov rdx, [COUNT]
    call mPrintf

ret


;18.Se tienen las siguientes definiciones de rótulos en un programa assembler Intel x86:
;	STRING_A    	RESD  1
;	STRING_B   		RESD  1
;	CHAR    		RESB  1
;Las variables STRING_A y STRING_B tienen la dirección de inicio de un string
; (cadena de caracteres terminados con un byte x’00’) mientras que la variable CHAR contiene un 
;caracter en codificación ASCII. Se pide:
;a.	Realizar una rutina interna que reciba como parámetros a los rótulos STRING_A y STRING_B y 
;devuelva un byte RESULT1 con una ‘S’ si los dos strings son iguales o una ‘N’ en caso contrario. 
;b.	Realizar una rutina interna que reciba como parámetros al rótulo STRING_A y CHAR y devuelva una 
;FULLWORD con la cantidad de ocurrencias del caracter CHAR dentro del string, en BPF c/s de 32 bits.

section .data
    STRING_A db 'Hello, world!', 0
    STRING_B db 'Hello, world!', 0
    CHAR db 'O'
    RESULT1 db 0
    COUNT resd 1
    FORMAT1 db 'Strings are: %c', 10, 0
    FORMAT2 db 'Occurrences of %c: %d', 10, 0

section .bss
    tempChar resb 1

section .text
global main
extern printf

%macro mPrintf 1
    sub rsp, 8
    mov rdi, %1
    mov rax, 0
    call printf
    add rsp, 8
%endmacro

compare_strings:
    push rsi
    push rdi
    mov rsi, [rsp + 16]  ; Load address of STRING_A
    mov rdi, [rsp + 24]  ; Load address of STRING_B
.compare_loop:
    lodsb               ; Load byte from STRING_A into AL
    scasb               ; Compare byte from STRING_B with AL
    jne .not_equal
    test al, al         ; Check if end of STRING_A (null terminator)
    jz .end_compare
    jmp .compare_loop
.not_equal:
    mov byte [RESULT1], 'N'
    jmp .exit_compare
.end_compare:
    mov byte [RESULT1], 'S'
.exit_compare:
    pop rdi
    pop rsi
    ret

count_char_occurrences:
    push rsi
    push rdi
    mov ecx, 0          ; Initialize count to 0
    mov rsi, [rsp + 16] ; Load address of STRING_A
    mov al, byte [rsp + 24] ; Load CHAR into AL
.count_loop:
    lodsb               ; Load byte from STRING_A into AL
    test al, al         ; Check if end of STRING_A (null terminator)
    jz .end_count
    cmp al, [rsp + 24]  ; Compare AL with CHAR
    jne .count_loop
    inc ecx             ; Increment count if match found
    jmp .count_loop
.end_count:
    mov [COUNT], ecx
    pop rdi
    pop rsi
    ret

main:
    ; Compare STRING_A and STRING_B
    lea rsi, [STRING_A]
    lea rdi, [STRING_B]
    push rsi
    push rdi
    call compare_strings

    ; Print result of string comparison
    lea rdi, [FORMAT1]
    movzx rsi, byte [RESULT1]
    mPrintf rdi

    ; Count occurrences of CHAR in STRING_A
    lea rsi, [STRING_A]
    movzx rdi, byte [CHAR]
    push rsi
    push rdi
    call count_char_occurrences

    ; Print the count of occurrences
    lea rdi, [FORMAT2]
    movzx rsi, byte [CHAR]
    mov rdx, [COUNT]
    mPrintf rdi

    ; Exit the program
    mov eax, 0
    ret

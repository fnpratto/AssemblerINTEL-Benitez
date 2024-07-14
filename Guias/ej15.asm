;15.	Se lee de un archivo una serie de números en formato carácter de 3 bytes.
; Se pide realizar un programa que realice la sumatoria de esos números e
; informe el resultado por pantalla, 
;indicando además la cantidad de números válidos e inválidos leídos del archivo.

section .data
    filename db 'numbers.txt', 0
    format db "%d", 0
    modo db "r+",0
    validMsg db "Numeros validos: %d", 10, 0
    invalidMsg db "Numeros Invalidos : %d", 10, 0
    sumMsg db "Suma de los  Numeros validos: %d", 10, 0
    buffer resb 4  ; buffer for reading numbers

section .bss
    ValidosCant resd 1
    InvalidosCant resd 1
    Sumatoria resd 1
    idArchivo resq 1

section .text
extern fopen, fgets, fclose, printf, atoi
global main

%macro mPrintf 1
    sub rsp, 8
    mov rdi, %1
    mov rax, 0
    call printf
    add rsp, 8
%endmacro

main:
    mov dword [ValidosCant], 0
    mov dword [InvalidosCant], 0
    mov dword [Sumatoria], 0

    ; Open file
    lea rdi, [filename]
    mov rsi, modo
    sub rsp, 8
    call fopen
    add rsp, 8

    cmp rax, 0
    jle errorOpen
    mov qword[idArchivo], rax

    ; Read numbers from file
read_loop:
    lea rdi, [buffer]
    mov rsi, rbx
    mov rdx, 4
    call fgets
    test rax, rax
    jz close_file  ; If fgets failed, exit loop

    ; Convert number to integer
    lea rdi, [buffer]
    call atoi
    mov rcx, rax  ; Save converted number

    ; Check if the number is valid
    cmp rcx, -999
    jl invalid_number
    cmp rcx, 999
    jg invalid_number

    ; Valid number
    add dword [ValidosCant], 1
    add dword [Sumatoria], ecx
    jmp read_loop

invalid_number:
    add dword [InvalidosCant], 1
    jmp read_loop

close_file:
    ; Close the file
    mov rdi, rbx
    call fclose

    ; Print results
    lea rdi, [validMsg]
    mov esi, [ValidosCant]
    mPrintf rdi

    lea rdi, [invalidMsg]
    mov esi, [InvalidosCant]
    mPrintf rdi

    lea rdi, [sumMsg]
    mov esi, [Sumatoria]
    mPrintf rdi

end:
    ; Exit program
    mov eax, 0
    ret

errorOpen:
    ret

;15.	Se lee de un archivo una serie de números en formato carácter de 3 bytes.
; Se pide realizar un programa que realice la sumatoria de esos números e
; informe el resultado por pantalla, 
;indicando además la cantidad de números válidos e inválidos leídos del archivo.

section .data
    filename db 'number.txt', 0
    format db "%q", 0
    modo db "r",0
    validMsg db "Numeros validos: %li", 10, 0
    invalidMsg db "Numeros Invalidos : %li", 10, 0
    sumMsg db "Suma de los  Numeros validos: %li", 10, 0
    registro_read   times 	0 	db ""
    errorOpenMsg db "Error al abrir el archivo", 0


section .bss
    ValidosCant resq 1
    InvalidosCant resq 1
    Sumatoria resq 1
    idArchivo resq 1
    buffer resq 1  ; buffer for reading numbers
    auxiliar resq 1


section .text
extern fopen, fgets, fclose, printf, atoi
global main

%macro mPrintf 0
    sub     rsp,8
    call    printf
    add     rsp,8
%endmacro


main:
    mov qword [ValidosCant], 0
    mov qword [InvalidosCant], 0
    mov qword [Sumatoria], 0

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
    mov rsi, 8
    mov rdx, qword[idArchivo]
    sub rsp, 8
    call fgets
    add rsp, 8
    cmp rax, 0
    jz close_file  ; If fgets failed, exit loop

    ; Convert number to integer
    lea rdi, [buffer]
    sub rsp, 8
    call atoi
    add rsp, 8
    ; Check if the number is valid
    cmp rax, 0
    je invalid_number


    ; Valid number
    add qword[ValidosCant], 1
    add [Sumatoria], rax
    jmp read_loop

invalid_number:
    add qword[InvalidosCant], 1
    jmp read_loop

close_file:
    ; Close the file
    mov rdi, [idArchivo]
    sub rsp, 8
    call fclose
    add rsp, 8

    ; Print results
    mov rdi, validMsg
    mov rsi, [ValidosCant]
    mPrintf 

    mov rdi, invalidMsg
    mov rsi, [InvalidosCant]
    mPrintf 

    mov rdi, sumMsg
    mov rsi, [Sumatoria]
    mPrintf 

end:
    ; Exit program
    mov eax, 0
    ret

errorOpen:
    mov rdi, errorOpenMsg
    mPrintf
    ret

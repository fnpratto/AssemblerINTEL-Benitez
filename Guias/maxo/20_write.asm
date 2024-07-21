%macro mFopen 0
    sub rsp, 8
    call fopen
    add rsp, 8 
%endmacro

%macro mFwrite 0
    sub rsp, 8
    call fwrite
    add rsp, 8
%endmacro

%macro mFclose 0
    sub rsp, 8
    call fclose
    add rsp, 8
%endmacro

section .data
    ; file ops
    filename db 'CALEN.DAT', 0
    modo db 'wb', 0

    primero:
        db "LU"
        db 4
        db "Actividad 1         "

    segundo:
        db "MA"
        db 2
        db "Actividad 2         "

    tercero:
        db "SA"
        db 9
        db "Actividad 3         "

    cuarto:
        db "DO"
        db 1
        db "Actividad 4         "

section .bss
    idArchivo resq 1

section .text
extern fopen, fwrite, fclose
global main

main:
    ; Open file
    lea rdi, [filename]
    mov rsi, modo
    mFopen
    mov qword[idArchivo], rax  ; Save file pointer

    ; write
    lea rdi, [primero]
    mov rsi, 23
    mov rdx, 1
    mov rcx, qword[idArchivo]
    mFwrite

    lea rdi, [segundo]
    mov rsi, 23
    mov rdx, 1
    mov rcx, qword[idArchivo]
    mFwrite

    lea rdi, [tercero]
    mov rsi, 23
    mov rdx, 1
    mov rcx, qword[idArchivo]
    mFwrite

    lea rdi, [cuarto]
    mov rsi, 23
    mov rdx, 1
    mov rcx, qword[idArchivo]
    mFwrite

    ; Close file
    mov rdi, qword[idArchivo]
    mFclose
    
    ret

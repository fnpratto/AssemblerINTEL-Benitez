;nasm -f elf64 ej21_write.asm -o main.o
;gcc main.o -o juego.out -no-pie -z noexecstack


global main

extern fopen, fwrite, fclose, printf
section .data
    archivo db 'ENCUESTA.DAT',0
    modo db "wb", 0  ; modo de escritura binaria
    linea1 db "AF1", 10
     linea2 db "MM1", 10
     linea3 db "RL1",10
     linea4 db "SM1",10
     linea5 db "SS1",10
     linea6 db "SM0",10
     linea7 db "SM"
     num_linea12 db 12

    errorMsg db "error",0 


section .bss
    id resq 1

section .text

 main:
    lea rdi, [archivo]
    mov rsi, modo
    sub rsp,8
    call fopen
    add rsp,8
    cmp rax,0
    je error_open
    mov [id], rax

    lea rdi, [linea1]
    mov rsi, 4
    mov rdx, 1
    mov rcx, [id]

    sub rsp,8
    call fwrite
    add rsp,8

    mov rdi, linea2
    mov rsi, 4
    mov rdx, 1
    mov rcx, [id]

    sub rsp,8
    call fwrite
    add rsp,8


    lea rdi, [linea3]
    mov rsi, 4
    mov rdx, 1
    mov rcx, [id]

    sub rsp,8
    call fwrite
    add rsp,8


    lea rdi, [linea4]
    mov rsi, 4
    mov rdx, 1
    mov rcx, [id]

    sub rsp,8
    call fwrite
    add rsp,8

    lea rdi, [linea5]
    mov rsi, 4
    mov rdx, 1
    mov rcx, [id]

    sub rsp,8
    call fwrite
    add rsp,8


    lea rdi, [linea6]
    mov rsi, 4
    mov rdx, 1
    mov rcx, [id]

    sub rsp,8
    call fwrite
    add rsp,8


    lea rdi, [linea7]
    mov rsi, 4
    mov rdx, 1
    mov rcx, [id]

    sub rsp,8
    call fwrite
    add rsp,8

    lea rdi, [num_linea12]
    mov rsi, 1
    mov rdx, 1
    mov rcx, [id]

    sub rsp,8
    call fwrite
    add rsp,8

close_file:
    mov rdi, [id]
    sub rsp,8
    call fclose
    add rsp,8
    ret
error_open:
    mov rdi, errorMsg
    sub rsp, 8
    call printf
    add rsp, 8
    mov eax, 1
    ret

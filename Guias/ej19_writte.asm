extern fopen, fwrite, fclose, printf
global main

section .data
    filename db 'carbina.dat', 0
    modo db "wb", 0  ; modo de escritura binaria
    cadenaBits db "1001100110011001" ; 16 numeros
    x db 12  
    y db 06  

    cadenaBits2 db "0000000000000010" ; 16 numeros
    x2 db 10 
    y2 db 05

    errorMsg db "error",0 

section .bss
    idArchivo resq 1

section .text
main:
    ; Abrir archivo para escritura
    lea rdi, [filename]
    mov rsi, modo
    sub rsp, 8
    call fopen
    add rsp, 8
    test rax, rax
    js error_open
    mov [idArchivo], rax

    lea rdi, [cadenaBits]
	mov rsi, 16
	mov rdx, 1
	mov rcx, [idArchivo]
    
    sub rsp,8
    call fwrite
    add rsp,8


    lea rdi, [x]
    mov rsi, 1  ; Tamaño de los resultados
    mov rdx, 1
	mov rcx, [idArchivo]

    sub rsp, 8
    call fwrite
    add rsp, 8

    lea rdi, [y]
    mov rsi, 1  ; Tamaño de los tantos a favor
    mov rdx, 1
	mov rcx, [idArchivo]

    sub rsp, 8
    call fwrite
    add rsp, 8

    ; Escribir segundo registro
    lea rdi, [cadenaBits2]
    mov rsi, 16  ; Tamaño del nombre
    mov rdx, 1
	mov rcx, [idArchivo]
    sub rsp, 8
    call fwrite
    add rsp, 8

    lea rdi, [x2]
    mov rsi, 1  ; Tamaño de los resultados
    mov rdx, 1
	mov rcx, [idArchivo]
    sub rsp, 8
    call fwrite
    add rsp, 8

    lea rdi, [y2]
    mov rsi, 1  ; Tamaño de los tantos a favor
    mov rdx, 1
	mov rcx, [idArchivo]
    sub rsp, 8
    call fwrite
    add rsp, 8

   
    ; Cerrar archivo
    mov rdi, [idArchivo]
    sub rsp, 8
    call fclose
    add rsp, 8

    ret

error_open:
    ; Manejar error al abrir el archivo
    mov rdi, errorMsg
    sub rsp, 8
    call printf
    add rsp, 8
    mov eax, 1


ret


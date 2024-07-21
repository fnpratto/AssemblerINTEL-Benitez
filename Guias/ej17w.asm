extern fopen, fwrite, fclose, printf
global main

section .data
    filename db 'team.dat', 0
    modo db "wb", 0  ; modo de escritura binaria
    nombre1 db "Equipo1          ", 0  ; 20 caracteres
    resultados1 dw 0b1000101010000000  ; 16 partidos (victorias/derrotas)
    tantosFavor1 dw 12  ; Puntos a favor
    tantosEnContra1 dw 56  ; Puntos en contra

    nombre2 db 'Equipo2          ', 0  ; 20 caracteres
    resultados2 dw 0b0101010101010101  ; 16 partidos (victorias/derrotas)
    tantosFavor2 dw 43  ; Puntos a favor
    tantosEnContra2 dw 87  ; Puntos en contra
    saltoLinea db 0x0A  ; Salto de línea

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

    lea rdi, [nombre1]
	mov rsi, 20
	mov rdx, 1
	mov rcx, [idArchivo]
    
    sub rsp,8
    call fwrite
    add rsp,8


    lea rdi, [resultados1]
    mov rsi, 2  ; Tamaño de los resultados
    mov rdx, 1
	mov rcx, [idArchivo]
    sub rsp, 8
    call fwrite
    add rsp, 8

    lea rdi, [tantosFavor1]
    mov rsi, 2  ; Tamaño de los tantos a favor
    mov rdx, 1
	mov rcx, [idArchivo]
    sub rsp, 8
    call fwrite
    add rsp, 8

    lea rdi, [tantosEnContra1]
    mov rsi, 2  ; Tamaño de los tantos en contra
    mov rdx, 1
	mov rcx, [idArchivo]
    sub rsp, 8
    call fwrite
    add rsp, 8

    ; Escribir salto de línea
    lea rdi, [saltoLinea]
    mov rsi, 1
    mov rdx, 1
    mov rcx, [idArchivo]
    sub rsp, 8
    call fwrite
    add rsp, 8

    ; Escribir segundo registro
    lea rdi, [nombre2]
    mov rsi, 20  ; Tamaño del nombre
    mov rdx, 1
	mov rcx, [idArchivo]
    sub rsp, 8
    call fwrite
    add rsp, 8

    lea rdi, [resultados2]
    mov rsi, 2  ; Tamaño de los resultados
    mov rdx, 1
	mov rcx, [idArchivo]
    sub rsp, 8
    call fwrite
    add rsp, 8

    lea rdi, [tantosFavor2]
    mov rsi, 2  ; Tamaño de los tantos a favor
    mov rdx, 1
	mov rcx, [idArchivo]
    sub rsp, 8
    call fwrite
    add rsp, 8

    lea rdi, [tantosEnContra2]
    mov rsi, 2  ; Tamaño de los tantos en contra
    mov rdx, 1
	mov rcx, [idArchivo]
    sub rsp, 8
    call fwrite
    add rsp, 8

    ; Escribir salto de línea
    lea rdi, [saltoLinea]
    mov rsi, 1
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

    ; Salir
    mov eax, 0
    ret

error_open:
    ; Manejar error al abrir el archivo
    mov rdi, errorMsg
    sub rsp, 8
    call printf
    add rsp, 8
    mov eax, 1


ret


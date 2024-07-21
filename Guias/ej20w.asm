extern fopen
extern fread
extern fwrite
extern fclose


global main
section .data
    path_archivo   db "calen.dat", 0
    modo_escritura db "wb", 0
    modo_lectura   db "rb", 0

    data1 db "LU1holacomova                    ", 0x0A, 0
    data2 db "MA1HOLA                          ",0x0A,0
    data3 db "MI2CHAU                          ",0x0A,0
    data4 db "DO1ADIOS                         ",0x0A,0
    data5 db "HH9ASDJF                         ",0x0A,0

section .bss
    id_archivo resq 1 ; File descriptor to be used in file operations


section .text
main:
escribir_archivo:
    ; Open file for writing (fopen)
    mov rdi, path_archivo
    mov rsi, modo_escritura
    sub rsp,8
    call fopen
    add rsp,8
    test rax, rax
    js error_open
    mov [id_archivo], rax


    mov rdi, data1
	mov rsi, 34
	mov rdx, 1
	mov rcx, [id_archivo]
    
    sub rsp,8
    call fwrite
    add rsp,8


    mov rdi, data2
	mov rsi, 34
	mov rdx, 1
	mov rcx, [id_archivo]
    
    sub rsp,8
    call fwrite
    add rsp,8

    mov rdi, data3
	mov rsi, 34
	mov rdx, 1
	mov rcx, [id_archivo]
    
    sub rsp,8
    call fwrite
    add rsp,8


    mov rdi, data4
	mov rsi, 34
	mov rdx, 1
	mov rcx, [id_archivo]
    
    sub rsp,8
    call fwrite
    add rsp,8


    mov rdi, data5
	mov rsi, 34
	mov rdx, 1
	mov rcx, [id_archivo]
    
    sub rsp,8
    call fwrite
    add rsp,8


    ; Close file (fclose)
    mov rdi, [id_archivo]
    sub rsp,8
    call fclose
    add rsp,8

error_open:
    ret

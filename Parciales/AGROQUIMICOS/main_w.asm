
global main

extern fopen , fclose, printf, scanf , fread, sscanf, fwrite

section .data
    formatoerror db "error archivo",0
    formatovalido db "valido",10,0
    formatoinvalido db "invalido",10,0
    archivo db "AGRO.DAT",0
    modo db "wb",0
    formato_linea db "%hhi%hhi%c%hi",0
    formato_char db "c",0
    tipos_validos db "F","U"
    M times 50 times 50 db 0
    lenght_elemento dd 1
    lenght_fila db 200 ; 50*4

    parcela:
        litros_f dw 1
        litros_u dw 1


    registro1:
        fil db 01
        col db 02
        tip db "F"
        litros dw 30

    registro2:
        fil2 db 01
        col2 db 02
        tip2 db "U"
        litros2 dw 30


section .bss
    id resq 1
    registro:
        fila resb 1
        columna resb 1
        tipo resb 1
        literos resw 1
    
    buffer resb 5

    


section .text
main:

    mov rdi, archivo
    mov rsi, modo

    sub rsp, 8
    call fopen
    add rsp,8


    cmp rax, 0
    je errorOpenFile
    mov [id], rax

    lea rdi, [registro1]
    mov rsi, 5
    mov rdx,1
    mov rcx,[id]
    sub rsp, 8
    call fwrite
    add rsp,8

    cmp rax,0
    je close_file


close_file:
    mov rdi, [id]
    sub rsp,8
    call fclose
    add rsp,8

    ret


errorOpenFile:
    ret
;10.	Realizar una rutina interna que reciba como
;parámetro un campo PACK en formato de Decimal Empaquetado de 2 bytes 
;y devuelva en un campo RESULT en formato carácter de 1 byte, indicando una ‘S’ 
;en caso que sea un empaquetado válido, y en caso contrario una ‘N’.

%macro mPuts 0
    sub     rsp,8
    call    puts
    add     rsp,8
%endmacro

%macro mGets 0
    sub     rsp,8
    call    gets
    add    rsp,8
%endmacro

%macro mPrintf 0
    sub     rsp,8
    call    printf
    add     rsp,8
%endmacro

global main
extern puts
extern gets
extern printf

section .data

    mensajeVal db 'PACK valido', 0
    mensajeNoVal db 'PACK INvalido', 0
    formato db " %c", 10, 0

    pack1 dw 9CDEh
    pack2 dw 12FAh
    pack3 dw 12F9h
    pack4 dw 12F1h

    mascara db 0Fh

section .bss
    RESULT resb 1 

section     .text
main:
    mov ax, [pack4]
    ;1101_1110b
    ;0000_1111b
    ;=
    ;0000_1110b > 9 ?
    and al, [mascara]

    cmp al, 10
    jl noValido
    jmp Valido

noValido:
    mov rdi, mensajeNoVal
    mPuts

    mov byte[RESULT], 'N'
    jmp fin

Valido:
    mov rdi, mensajeVal
    mPuts

    mov byte[RESULT], 'S'
    jmp fin

fin:
    xor rsi,rsi
    mov rdi, formato
    mov sil, [RESULT]
    mPrintf

    ret 
    
    
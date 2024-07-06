;3.	Realizar un programa que resuelva XY  teniendo en cuenta que tanto X e Y pueden ser positivos o negativos.

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

%macro mScanf 0
    sub     rsp,8
    call    scanf
    add     rsp,8
%endmacro

%macro mPrintf 0
    sub     rsp,8
    call    printf
    add     rsp,8
%endmacro

global main
extern puts
extern scanf
extern gets
extern printf

section     .data
    msgPregunta     db  "Ingrese sus datos para multiplicar",0
    msgNombre       db  "Ingrese X:",0
    msgPadron       db  "Ingrese Y:",0
    msgFecha        db  "XY: ",0
    formato_numero db " %d", 0

section     .bss  
    X                      resb 4  
    Y                      resq 4

section     .text
main:
    mov rdi , msgPregunta
    mPuts

    mov rdi, msgNombre
    mPuts

    mov rdi, formato_numero
    mov rsi, X
    mScanf

    mov rdi, msgPadron
    mPuts

    mov rdi, formato_numero
    mov rsi, Y
    mScanf

    mov rdi, msgFecha
    mPuts

    mov rax, [X]
    mov rbx, [Y]
    imul rax, rbx

    mov rdi, formato_numero
    mov rsi, rax    
    mPrintf


    ret

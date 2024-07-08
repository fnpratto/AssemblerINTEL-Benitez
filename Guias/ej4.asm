
;4.	Escribir un programa que lea 15 números ingresados por teclado. Se pide imprimir dichos números en forma decreciente.
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
    msgPregunta     db  "Ingrese cuantos numeros quiere ordenar",0
    msgPreguntaNum  db "Ingrese un numero",0
    msgRespuesta     db  "El vector queda",0
    formato_numero db " %i", 0
    ingresados db 0

section     .bss  
    iteraciones                 resb 4  
    vectorNumero                resd 15
    aux                        resd 15
    cantidadNumeros             resb 4
    espacioReservado            resb 60  ; Allocate additional memory for vectorNumero

section     .text
main:
    mov    rdi, msgPregunta
    mPuts
    mov    rdi, formato_numero
    mov    rsi, iteraciones
    mScanf

    mov rcx,[iteraciones]
    mov [cantidadNumeros], rcx

inicializar_vector:

    mov    rdi, msgPreguntaNum
    mPuts
    mov    r9, [ingresados]
    imul   r9, r9, 4
    lea    r9, [vectorNumero + r9]
    mov    [aux],r9

    sub     rsp,8
    mov    rdi, formato_numero
    lea    rsi, [r9]
    mScanf
    sub     rsp,8


    mov rdx, [ingresados]
    inc rdx
    mov [ingresados], rdx

    mov rcx, [iteraciones]
    dec rcx  
    mov [iteraciones], rcx
    
    cmp rcx, rdx
    jnz inicializar_vector
    

    mov rdi, msgRespuesta
    mPuts
imprimir_vector:
    mov rcx, [cantidadNumeros]   ; Número de elementos ingresados
    mov rbx , 0 
    loop:
        mov [cantidadNumeros], rcx
        mov rdi, formato_numero
        mov rsi, [aux + rbx*4 ]  ; Cargar el elemento del vector
        mPrintf
        dec rbx
        mov rcx, [cantidadNumeros]
        dec rcx  ; Mover al siguiente elemento del vector
        cmp rcx,0
        jnz loop

exit_program:
ret
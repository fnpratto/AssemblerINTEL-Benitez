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
    contadorotro dq 0

section     .bss  
    iteraciones                 resb 4  
    vectorNumero                resd 15
    aux                        resd 15
    cantidadNumeros             resb 4

section     .text
main:
    mov    rdi, msgPregunta
    mPuts
    mov    rdi, formato_numero
    mov    rsi, iteraciones
    mScanf

    mov rcx,[iteraciones]
    mov [cantidadNumeros], rcx

ingreso_loop:
    mov    [iteraciones], rcx

    mov    rdi, msgPreguntaNum
    mPuts

    mov    r9, [contadorotro]
    imul   r9, r9, 4
    lea    r9, [vectorNumero + r9]
    mov    [aux],r9

    mov    rdi, formato_numero
    mov    rsi, aux
    mScanf

    ; Insertar el número ordenadamente en el vector
    mov rax, [aux]  ; Elemento a insertar
    mov rdx, rdx  ; Índice para comparar con los elementos del vector

    ;compare_loop:
    ;    cmp rbx, 0
    ;    jle insert_number  ; Si no hay más elementos o es menor, insertar aquí
    ;
    ;    ; Comparar con el elemento actual del vector
    ;    cmp rax, [aux-4]
    ;    jge insert_number  ; Si es mayor o igual, insertar aquí

        ; Mover el elemento actual hacia la derecha
    ;    mov rdx, [aux-4]
    ;    mov [aux-4], rdx


    ;    dec rbx  ; Mover al siguiente elemento del vector
    ;    jmp compare_loop

    ;insert_number:
    ;    mov [aux], rax  ; Insertar el número en la posición correcta
    ;    inc dword [contadorotro]         ; Incrementar el contador de elementos

    mov rcx, [iteraciones]
    dec rcx  
    cmp rcx, 0
    jnz ingreso_loop  ; Volver a pedir otro número si quedan iteraciones


    ; Imprimir el vector ordenado
    mov rdi, msgRespuesta
    mPuts
    mov rcx, [cantidadNumeros]   ; Número de elementos ingresados
    mov rbx , 0 
    print_vector:
        mov [cantidadNumeros], rcx
        mov rdi, formato_numero
        mov rsi, [aux + rbx*4 ]  ; Cargar el elemento del vector
        mPrintf
        dec rbx
        mov rcx, [cantidadNumeros]
        dec rcx  ; Mover al siguiente elemento del vector
        cmp rcx,0
        jnz print_vector

exit_program:
ret

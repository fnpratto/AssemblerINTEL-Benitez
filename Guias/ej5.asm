;5.Dado un vector de 20 números almacenados en el formato BPF c/s de 16 bits, escriba un programa que calcule el máximo,
; mínimo y el promedio de los números e imprimirlos por pantalla.

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
    vecNum		  dw  2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
    msgMaximo     db  "El maximo es: ",0
    msgMinimo     db  "El minimo es:",0
    msgPromedio   db  "El promedio es: ",0
    cantidad      dq  20
    formatoNumero db " %i", 10,0
    formatoPromedio db "%d",10, 0
    formatoMinMax db "%hd",10, 0
section     .bss  
    maximo                 resb 2  
    minimo                 resb 2
    promedio               resb 4

section     .text
main:
    mov word [maximo] , 0
    mov ax, [vecNum]
    mov [minimo] , ax

    mov rcx, 0
    mov rax, 0 ; suma de todos
    mov rbx, 0 ; iterador
iterar_vector:
    mov ax, [promedio]
    ; Cargar el valor de 16 bits de vecNum en un registro de 32 bits
    mov cx, word [vecNum + rbx*2]
    inc rbx
    add ax, cx
    mov [promedio], ax
actualizar_max:
    cmp cx, [maximo]
    jg actualizar_maximo
actualizar_min:
    cmp cx, [minimo]
    jl actualizar_minimo
fin_loop:
    cmp rbx, 20
    je calcular_promedio
    jmp iterar_vector




actualizar_maximo:
    mov [maximo], cx
    jmp actualizar_min

actualizar_minimo:  
    mov [minimo], cx
    jmp fin_loop

calcular_promedio:
    mov ax, [promedio]
    mov cx, 20
    cqo ; sign-extend rax into rdx:rax : The error "Floating point exception (core dumped)" occurs because you are using the div instruction to divide a 64-bit value by a 32-bit value. To fix this, you need to use the idiv instruction instead, which is used for signed division.
    idiv cx ; signed division
    mov [promedio], ax


imprimir_resultados:

    mov rdi, msgPromedio
    mPuts

    mov rdi , formatoPromedio
    mov rsi, [promedio]
    mPrintf

    mov rdi, msgMaximo
    mPuts

    mov rdi , formatoMinMax 
    mov rsi, [maximo]
    mPrintf

    mov rdi, msgMinimo
    mPuts

    mov rdi , formatoMinMax
    mov rsi, [minimo]
    mPrintf
ret

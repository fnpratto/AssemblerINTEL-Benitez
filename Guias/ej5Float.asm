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
    vecNum		  dw  2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0
    msgMaximo     db  "El maximo es: ",0
    msgMinimo     db  "El minimo es:",0
    msgPromedio   db  "El promedio es: ",0
    cantidad      dq  20
    formatoFloat db " %f", 10,0

section     .bss  
    maximo                 resb 2  
    minimo                 resb 2
    promedio               resb 4

section     .text
main:
    finit ; Inicializa la FPU

    ; Inicializa máximo y mínimo con el primer valor del vector
    fld dword [vecNum]
    fst dword [maximo]
    fst dword [minimo]

    ; Inicializa suma
    fldz

    mov ecx, 20
    mov rbx, 0
iterar_vector:
    ;mov ax, [promedio]
    ; Cargar el valor de 16 bits de vecNum en un registro de 32 bits
    fld dword [vecNum + rbx*4] ;mov cx, word [vecNum + rbx*2]
    ; Compara con máximo
    fld dword [maximo]
    fcomi st0, st1
    ja actualizar_maximo
    fstp st0
    
actualizar_minimo:
    fld dword [minimo] ;cmp cx, [minimo]
    fcomi st0, st1
    jb actualizar_min ;jl actualizar_minimo
    fstp st0 
    
suma:
    fadd dword [vecNum + rbx*4]

fin_loop:
    add rbx, 1 ;cmp rbx, 20
    loop iterar_vector
    jmp calcular_promedio

actualizar_maximo:
    fstp dword [maximo]
    jmp actualizar_minimo

actualizar_max:
    fstp dword [maximo] ;cmp cx, [maximo]
    jmp actualizar_minimo ;jg actualizar_maximo

actualizar_min:
    fstp dword [minimo]
    fstp st0
    jmp suma


calcular_promedio:
    ;mov ax, [promedio]
    ;mov cx, 20
    ;cqo ; sign-extend rax into rdx:rax : The error "Floating point exception (core dumped)" occurs because you are using the div instruction to divide a 64-bit value by a 32-bit value. To fix this, you need to use the idiv instruction instead, which is used for signed division.
    ;idiv cx ; signed division
    ;mov [promedio], ax
        ; Divide la suma por 20
    fld1
    fld1
    fld1
    fld1
    fld1
    fld1
    fld1
    fld1
    fld1
    fld1
    fld1
    fld1
    fld1
    fld1
    fld1
    fld1
    fld1
    fld1
    fld1
    fld1
    fdivr st0, st20
    fstp dword [promedio]


imprimir_resultados:

    mov rdi, msgPromedio
    mPuts

    mov rdi , formatoFloat
    ;mov rsi, [promedio]
    fld dword [promedio]
    fstp qword [rsp-8]
    movq xmm0, [rsp-8]
    mov rax, 1
    mPrintf

    mov rdi, msgMaximo
    mPuts

    mov rdi , formatoFloat 
    ;mov rsi, [maximo]
     mov rdi, formatoFloat
    fld dword [maximo]
    fstp qword [rsp-8]
    movq xmm0, [rsp-8]
    mov rax, 1
    mPrintf

    mov rdi, msgMinimo
    mPuts

    mov rdi , formatoFloat
    ;mov rsi, [minimo]
    mov rdi, formatoFloat
    fld dword [minimo]
    fstp qword [rsp-8]
    movq xmm0, [rsp-8]
    mov rax, 1
    mPrintf
ret



%define ARRIBA 'W'
%define IZQUIERDA 'A'
%define ABAJO 'X'
%define DERECHA 'D'


%macro myfopen 0
    sub rsp, 8
     call fopen
    add rsp,8
%endmacro

%macro myscanf 0
    sub rsp, 8
     call scanf
    add rsp,8
%endmacro

%macro mprintf 0
    sub rsp, 8
     call printf
    add rsp,8
%endmacro



extern fopen, scanf,  printf
global main

section .data
    formato_orientacion db "%c" ,0
    formato_movimiento_zorro db "Ingrese movimiento zorro: %c", 0
    formato_mov_invalido db "Movimiento no valido",0
    formato_preguntar_col db "Cual es la columna de la oca que queres mover: %i"
    formato_preguntar_fil db "Cual es la fila de la oca que queres mover: %i"


section .bss
    ;zorro
    fil                 resq 1
    col                 resq 1
    cant_ocas_comidas   resq 1

    ;ocas
    tope                resq 1
    vector_ocas         resq 12 ; TODO AUMENTAR X2
    movimiento_invalido resb 1

    ;tablero
    orientacion resb 1 

    ;juego
    movimiento          resb 1

    aux_col resq 1
    aux_fil resq 1
    aux_indice resq 1



section .text

main:
inicializar:

    myfopen
    cmp rax, 0
    jne loop_partida

inicializo_zorro:

    mov qword[fil], 5
    mov qword[col], 4
    mov qword[cant_ocas_comidas], 0

inicializo_ocas:
    mov qword[tope], 12
    
    ;pregunto orientacion
pregunto_orientacion:

    xor rax,rax
    mov rsi , formato_orientacion
    mov rdi,  orientacion
    myscanf
    cmp rax, 0 ; valido que tomo un char
    je pregunto_orientacion 

    mov al, byte[orientacion]
    mov byte[movimiento_invalido], al

loop_ocas:
primer_loop:
    mov rcx, 1 ; j = 1
    cmp rbx , 7 ; i = 7
    jg salir_segundo_loop
    segundo_loop:
        cmp rcx, 7 ; j = 7
        jg salir_segundo_loop
        jmp comprobar_condiciones_de_inicializacion
        avanzar_segundo_loop:
            inc     rcx
            jmp     segundo_loop
    cerrar_segundo_loop:
        inc     rbx
        jmp     primer_loop
salir_segundo_loop:
    jmp loop_partida

comprobar_condiciones_de_inicializacion:
        cmp rbx, 3      ; si la oca esta en la fila 3 la agrego
        je agregar_a_vector_de_ocas

        cmp rcx, 2
        jle segunda_condicion_de_inicializacion
        cmp rcx, 6
        jge segunda_condicion_de_inicializacion

        cmp rbx, 1      ; si la oca esta entre la columna 2 y 6 (sin incluir) y en la fila 1 la agrego
        je agregar_a_vector_de_ocas
        cmp rbx, 2      ; si la oca esta entre la columna 2 y 6 (sin incluir) y en la fila 2 la agrego
        je agregar_a_vector_de_ocas

    segunda_condicion_de_inicializacion:
        cmp rcx, 1      ; si la oca esta en la columna 1 compruebo la siguiente condicion
        je tercera_condicion_de_inicializacion
        cmp rcx, 7      ; si la oca esta en la columna 7 compruebo la siguiente condicion
        jne no_cumple_ninguna_condicion

    tercera_condicion_de_inicializacion:
        cmp rbx, 4      ; si la oca esta en la fila 4 la agrego
        je agregar_a_vector_de_ocas
        cmp rbx, 5      ; si la oca esta en la fila 5 la agrego
        je agregar_a_vector_de_ocas

    no_cumple_ninguna_condicion:
        jmp     avanzar_segundo_loop    ; la oca no se puede agregar, entonces avanzo a la siguiente posicion

    agregar_a_vector_de_ocas:
        mov     [rdi], bl       ;le agrego la fila a la oca
        mov     [rdi + 1], cl   ;le agrego la columna a la oca
        ;call    reacomodar_en_base_a_orientacion
        add     rdi, 2          ;avanzo el puntero a la siguiente oca
        add     byte[rdx], 2
        jmp     avanzar_segundo_loop

inicializar_matriz:


loop_partida:

preguntar_zorro:
    ; empieza el zorro
    mov rsi, formato_movimiento_zorro
    mov rdi , movimiento
    myscanf

    cmp rax, 0 ; valido char
    jmp preguntar_zorro

moverZ:
    cmp byte [movimiento], 68 ;D
    je  mover_derecha
    cmp byte [movimiento], 65 ;A
    je  mover_izquierda
    cmp byte [movimiento], 87 ;W
    je mover_arriba
    cmp byte [movimiento], 83 ;S
    je mover_abajo

ingreso_movimiento_invalido:
    mov rsi, formato_mov_invalido
    mprintf
    jmp  preguntar_zorro

mover_derecha:
    mov r8, qword[fil]
    mov r9, qword[col]
    cmp r8 , 2           ; i 
    jle verifico_borde_derecha
    cmp r8,6             ; i
    jge verifico_borde_derecha
    cmp r9, 7            ; j
    jg ingreso_movimiento_invalido
    inc r9
    jmp preguntar_ocas

verifico_borde_derecha:
    cmp r9, 5
    jg movimiento_invalido
    inc r9
    jmp preguntar_ocas

mover_izquierda:
    mov r8, qword[fil]
    mov r9, qword[col]
    cmp r8 , 2           ; i 
    jle verifico_borde_izquierda
    cmp r8,6             ; i
    jge verifico_borde_izquierda
    cmp r9, 1            ; j
    jl ingreso_movimiento_invalido
    dec r9
    jmp preguntar_ocas

verifico_borde_izquierda:
    cmp r9, 3
    jl ingreso_movimiento_invalido
    dec r9
    jmp preguntar_ocas

mover_arriba:
    mov r8, qword[fil]
    mov r9, qword[col]
    cmp r9 , 2           ; i 
    jle verifico_borde_arriba
    cmp r9, 6             ; i
    jge verifico_borde_arriba
    cmp r8, 1            ; j
    jl ingreso_movimiento_invalido
    dec r8
    jmp preguntar_ocas

verifico_borde_arriba:
    cmp r8, 3
    jle ingreso_movimiento_invalido
    dec r8
    jmp preguntar_ocas

mover_abajo:
    mov r8, qword[fil]
    mov r9, qword[col]
    cmp r9 , 2           ; i 
    jle verifico_borde_abajo
    cmp r9, 6             ; i
    jge verifico_borde_abajo
    cmp r8, 7             ; j
    jl ingreso_movimiento_invalido
    inc r8
    jmp preguntar_ocas

verifico_borde_abajo:
    cmp r8, 5
    jle ingreso_movimiento_invalido
    inc r8
    jmp preguntar_ocas


preguntar_ocas:

preguntar_col_indice:
    mov rdi, formato_preguntar_col
    mov rsi, [aux_col]
    mscanf

    cmp rax, 0
    je preguntar_col_indice

preguntar_fil_indice:
    mov rdi, formato_preguntar_fil
    mov rsi , [aux_fil]
    mscanf
    cmp rax, 0
    je preguntar_fil_indice

buscar_ocas:
mov rax, 0
    loop:
        cmp rax, [tope_ocas]
        jge oca_no_encontrada
        mov r9, [vector_ocas+ rax] ; fil
        mov r8, [vector_ocas+ rax+1] ; col
        cmp r9, [aux_fil]
        jne mover_siguiente_oca
        cmp r8, [aux_col]
        je oca_encontrada
mover_siguiente_oca:
        add rax, 2
        jmp loop

oca_no_encontrada:
    mov rdi, formato_oca_no_encontrada
    mprintf

    jmp preguntar_ocas

oca_encontrada:
    mov [aux_indice], rax

mover_oca:
preguntar_mov_oca:
    ; empieza el zorro
    mov rsi, formato_movimiento_oca
    mov rdi , movimiento
    myscanf

    cmp rax, 0 ; valido char
    jmp preguntar_mov_oca

moverO:
    cmp byte [movimiento], 68 ;D
    je  mover_derecha
    cmp byte [movimiento], 65 ;A
    je  mover_izquierda
    cmp byte [movimiento], 87 ;W
    je mover_arriba
    cmp byte [movimiento], 83 ;S
    je mover_abajo

ingreso_movimiento_invalido:
    mov rsi, formato_mov_invalido
    mprintf
    jmp  preguntar_mov_oca

mover_derecha:
    mov r8, qword[fil]
    mov r9, qword[col]
    cmp r8 , 2           ; i 
    jle verifico_borde_derecha
    cmp r8,6             ; i
    jge verifico_borde_derecha
    cmp r9, 7            ; j
    jg ingreso_movimiento_invalido
    inc r9
    jmp verificar_estado_juego

verifico_borde_derecha:
    cmp r9, 5
    jg movimiento_invalido
    inc r9
    jmp verificar_estado_juego

mover_izquierda:
    mov r8, qword[fil]
    mov r9, qword[col]
    cmp r8 , 2           ; i 
    jle verifico_borde_izquierda
    cmp r8,6             ; i
    jge verifico_borde_izquierda
    cmp r9, 1            ; j
    jl ingreso_movimiento_invalido
    dec r9
    jmp verificar_estado_juego

verifico_borde_izquierda:
    cmp r9, 3
    jl ingreso_movimiento_invalido
    dec r9
    jmp verificar_estado_juego

mover_arriba:
    mov r8, qword[fil]
    mov r9, qword[col]
    cmp r9 , 2           ; i 
    jle verifico_borde_arriba
    cmp r9, 6             ; i
    jge verifico_borde_arriba
    cmp r8, 1            ; j
    jl ingreso_movimiento_invalido
    dec r8
    jmp verificar_estado_juego

verifico_borde_arriba:
    cmp r8, 3
    jle ingreso_movimiento_invalido
    dec r8
    jmp verificar_estado_juego

mover_abajo:
    mov r8, qword[fil]
    mov r9, qword[col]
    cmp r9 , 2           ; i 
    jle verifico_borde_abajo
    cmp r9, 6             ; i
    jge verifico_borde_abajo
    cmp r8, 7             ; j
    jl ingreso_movimiento_invalido
    inc r8
    jmp verificar_estado_juego

verifico_borde_abajo:
    cmp r8, 5
    jle ingreso_movimiento_invalido
    inc r8
    jmp verificar_estado_juego

    ret








    
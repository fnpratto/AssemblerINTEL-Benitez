

%define ARRIBA 'W'
%define IZQUIERDA 'A'
%define ABAJO 'X'
%define DERECHA 'D'


%macro myfopen 0
    sub rsp, 8
     call fopen
    add rsp,8
%endmacro

%macro mScanf 0
    sub     rsp,8
    call    scanf
    add     rsp,8
%endmacro

%macro myprintf 0
    sub rsp, 8
     call printf
    add rsp,8
%endmacro

%macro myputs 0
    sub rsp, 8
     call puts
    add rsp,8
%endmacro


%macro mygetchar 0
    sub     rsp,8
    call    getchar
    add     rsp,8
%endmacro



extern fopen, scanf,  printf,puts , getchar
global main

section .data
    formato_pregunta db "Ingrese un char para la orientacion para el tablero, si no es valido se dejara el default: ",0
    formato_orientacion db " %c", 0
    formato_caracter db " %c", 0
    formato_movimiento_zorro db "Ingrese movimiento zorro: ", 0
    formato_mov_invalido db "Movimiento no valido",10, 0
    formato_preguntar_col db "Cual es la columna de la oca que queres mover: ",0
    formato_int db " %d",0
    formato_preguntar_fil db "Cual es la fila de la oca que queres mover: ",0
    formato_oca_no_encontrada db "Oca no fue encontrada, ingresar devuelta otras coordenadas: ",0
    formato_movimiento_oca db "Ingrese movimiento de la oca:  %c",0
    dummy               db " %c", 0
    mensaje_error db "No se ingreso un numero int ", 10, 0
    archivo db "ocasyzorro.txt"
    iterador_matriz dq 0
    long_fila dd 7


section .bss
    ;zorro
    fil                 resq 1
    col                 resq 1
    cant_ocas_comidas   resq 1

    ;ocas
    tope_ocas                resq 1
    vector_ocas         times 12 resq 1 ; 4 bytes para la fil y otro para la col 
    movimiento_invalido resb 1

    ;tablero
    orientacion resb 1 
    matriz times 49 resb 1
    casillero       resb 1

    ;juego
    movimiento          resb 1

    aux_col resq 1
    aux_fil resq 1
    aux_indice resq 1
    iterador_matriz resq 1



section .text

main:
inicializar_con_archivo:
    ;myfopen TODO
    ;cmp rax, 0
    ;jne loop_partida

inicializo_zorro:

    mov qword[fil], 5
    mov qword[col], 4
    mov qword[cant_ocas_comidas], 0

inicializo_ocas:
    mov qword[tope_ocas], 12
    
pregunto_orientacion:

    lea rdi, [formato_pregunta]
    myprintf

    mov rdi , formato_orientacion
    mov rsi,  orientacion
    mScanf

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
    mov rdi, formato_movimiento_zorro
    myprintf

    ; empieza el zorro
    mov rdi, formato_caracter
    mov rsi , movimiento
    mScanf

    cmp rax, 0 ; valido char
    je preguntar_zorro

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
    mov rdi, formato_mov_invalido
    myprintf
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
    myprintf

    xor rsi,rsi
    mov rdi, formato_int
    mov rsi, aux_col
    mScanf
    cmp rax, 0
    je validar_entero
preguntar_fil_indice:
    mov rdi, formato_preguntar_fil
    myprintf
    mov rdi, formato_int
    mov rsi , aux_fil
    mScanf
    cmp rax, 0
    je validar_entero
    jmp buscar_ocas

validar_entero:
    lea rdi, [rel mensaje_error]
    myprintf
    mov rdi, dummy
    mScanf
    jmp preguntar_col_indice

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
        myprintf

        jmp preguntar_ocas

    oca_encontrada:
        mov [aux_indice], rax

mover_oca:
    preguntar_mov_oca:
        ; empieza el zorro
        mov rsi, formato_movimiento_oca
        mov rdi , movimiento
        mScanf

        cmp rax, 0 ; valido char
        jmp preguntar_mov_oca

    moverO:
        cmp byte [movimiento], 68 ;D
        je  mover_derecha_oca
        cmp byte [movimiento], 65 ;A
        je  mover_izquierda_oca
        cmp byte [movimiento], 87 ;W
        je mover_arriba_oca
        cmp byte [movimiento], 83 ;S
        je mover_abajo_oca

    ingreso_movimiento_invalido_oca:
    mov rsi, formato_mov_invalido
    myprintf
    jmp  preguntar_mov_oca

mover_derecha_oca:
    mov r8, qword[fil]
    mov r9, qword[col]
    cmp r8 , 2           ; i 
    jle verifico_borde_derecha_oca
    cmp r8,6             ; i
    jge verifico_borde_derecha_oca
    cmp r9, 7            ; j
    jg ingreso_movimiento_invalido_oca
    inc r9
    jmp verificar_estado_juego

verifico_borde_derecha_oca:
    cmp r9, 5
    jg movimiento_invalido
    inc r9
    jmp verificar_estado_juego

mover_izquierda_oca:
    mov r8, qword[fil]
    mov r9, qword[col]
    cmp r8 , 2           ; i 
    jle verifico_borde_izquierda_oca
    cmp r8,6             ; i
    jge verifico_borde_izquierda_oca
    cmp r9, 1            ; j
    jl ingreso_movimiento_invalido_oca
    dec r9
    jmp verificar_estado_juego

verifico_borde_izquierda_oca:
    cmp r9, 3
    jl ingreso_movimiento_invalido_oca
    dec r9
    jmp verificar_estado_juego

mover_arriba_oca:
    mov r8, qword[fil]
    mov r9, qword[col]
    cmp r9 , 2           ; i 
    jle verifico_borde_arriba_oca
    cmp r9, 6             ; i
    jge verifico_borde_arriba_oca
    cmp r8, 1            ; j
    jl ingreso_movimiento_invalido_oca
    dec r8
    jmp verificar_estado_juego

verifico_borde_arriba_oca:
    cmp r8, 3
    jle ingreso_movimiento_invalido_oca
    dec r8
    jmp verificar_estado_juego

mover_abajo_oca:
    mov r8, qword[fil]
    mov r9, qword[col]
    cmp r9 , 2           ; i 
    jle verifico_borde_abajo_oca
    cmp r9, 6             ; i
    jge verifico_borde_abajo_oca
    cmp r8, 7             ; j
    jl ingreso_movimiento_invalido_oca
    inc r8
    jmp verificar_estado_juego

verifico_borde_abajo_oca:
    cmp r8, 5
    jle ingreso_movimiento_invalido_oca
    inc r8
    jmp verificar_estado_juego


verificar_estado_juego:
    ret


imprimir_tablero:
    llenar_matriz:
        xor rcx, rcx
        mov rcx, 49
        mov qword [aux_fil], 0
        mov qword [aux_col], 0
        mov qword [iterador_matriz], 0

        buscar_si_hay_algo_ahi:
            mov word [casillero], 0
        ;BUSCO ZORRO
            xor r9,r9
            mov r9, qword [fil]
            cmp qword [aux_col], r9
            jne buscar_siguiente_elemento0:
            mov r9, qword[col]
            cmp qword [aux_fil], r9
            je rellenar_con_zorro

        buscar_siguiente_elemento0:
            xor rax,rax
            loop_ocas_matriz:
                cmp rax, [tope_ocas]
                jge oca_no_en_casillero
                mov r9, [vector_ocas+ rax] ; fil
                mov r8, [vector_ocas+ rax+1] ; col
                cmp r9, [aux_fil]
                jne mover_siguiente_oca
                cmp r8, [aux_col]
                je oca_en_casillero
                mover_siguiente_oca:
                        add rax, 2
                        jmp loop_ocas_matriz

            oca_no_en_casillero:
               jmp rellenar_vacio

            oca_en_casillero:

            rellenar_oca:
                mov byte [casillero], 111; o
                jmp ubicar_en_matriz
            rellenar_zorro:
                mov byte [casillero], 90 ; z
                jmp ubicar_en_matriz
            rellenar_vacio:
                ;si esta dentro del tablero imprimo vacio
                ;sino espacio
                esta_dentro_tablero:
                    mov rax, 0
                    cmp dword [aux_fil], 1
                    jl fuera_de_rango
                    cmp dword [aux_fil], 7
                    jg fuera_de_rango
                    cmp dword [aux_col], 1
                    jl fuera_de_rango
                    cmp dword [aux_col], 7
                    jg fuera_de_rango
                    cmp dword [aux_col], 3
                    jl chequear_esquinas
                    cmp dword [aux_col], 5
                    jg chequear_esquinas
                    ret
                chequear_esquinas:
                    cmp dword [aux_fil], 3
                    jl fuera_de_rango
                    cmp dword [aux_fil], 5
                    jg fuera_de_rango
                    ret
                fuera_de_rango:
                    rellenar_fuera_de_tablero:
                        mov byte [casillero], 32; espacio
                        jmp ubicar_en_matriz
   
            rellenar_casillero_vacio:
                mov byte [casillero], 45 ; -
                jmp ubicar_en_matriz

        
        ubicar_en_matriz:
            xor rbx,rbx
            mov rbx, matriz
            xor rdx,rdx
            add qword [iterador_matriz], 1
            
            ;me muevo en la matriz
            mov rdx, [aux_fil]
            dec rdx
            imul rdx, [long_fila]
            mov rax, 0
            add rax, rdx
            mov rdx, [aux_col]
            dec rdx
            imul rdx, 1
            add rax, rdx
            add rbx, rax

        escribir_en_matriz:
            mov al, [casillero]
            mov byte [rbx], al
        
        
            








    
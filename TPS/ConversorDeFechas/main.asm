; **************************************************************************************************
; Desarrollar un programa en assembler Intel 80x86 que permita convertir fechas válidas con el 
; formato DD/MM/AAAA a formato romano y/o juliano (DDD/AA); también debe permitir su inversa.
; Ejemplo:
;  - Formato Fecha (DD/MM/AAAA): 14/10/2020
;  - Formato Romano: XIV / X / MMXX
;  - Formato Juliano (DDD/AA): 288/20
; ****************************************************************************************************

; faltan 15 minutos-> falta que cuando se tenga mas de 3 IIII se convierta a IV
;                  -> Juliano (que solo imprima los ultimos dos numeros)


global main
extern scanf, printf, getchar, scanf, puts, sscanf

section .data
    formato_fechas db"%d/%d/%d", 0
    formato_juliano db "%d/%d",0
    formato_fechas_jacobiano db"%d/%d/%d", 0

    ejemplo dd "16/10/2020",0
    ejemplo_romano db "XIV / X / MMXX",0
    long_romano dq 14
    formato_char db "%c",0
    formato_pregunta db "Normal:n, Romano: r, Juliano: j :",0
    error_valido db "no valido",10,0
    formatos_validos db "r","j","n"
    vector_romanos db "I","V","X","M"
    formato_dia db "%s",0
    formato_int db "%d",0
    formato_parte_fecha db "%li /",0
    formato_romano db "eligio cambiar a formato romano",10,0
    formato_normal db "eligio cambiar a formato normal",10,0
    formato_jacobiano db "eligio cambiar a formato jacobiano",10,0

    auxDia db "********",0
    auxMes db "********",0
    auxYear db "********",0
    total dq 0

    anterior dq 1001

section .bss
    modo resb 1
    dia resd 1
    mes resd 1
    year resd 1

    dias_totales resd 1

    cantidad_dia resq 1

    contador resd 1

section .text


;primero hacemos normal a romano
; romano a normal
main:
; pregunto
    mov rdi, formato_pregunta
    sub rsp, 8
    call printf
    add rsp,8


    ; Wait for user input using getchar
    lea rdi, [formato_char]
    lea rsi, [modo]
    sub rsp,8
    call scanf
    add rsp,8

    xor rax,rax

valido_input:
    mov dil, byte[modo]

    cmp dil, byte[formatos_validos+rax]
    je continuar
    inc rax
    cmp rax,3
    je no_valido
    jmp valido_input

continuar:
    cmp rax,0
    jle continuar_romano
    cmp rax, 1
    je continuar_jacobiano
    cmp rax, 2
    je continuar_normal
    jmp valido_input

continuar_romano:

    mov rdi, formato_romano
    sub rsp, 8
    call printf
    add rsp,8


    lea rdi, [ejemplo]
    lea rsi, [formato_fechas]
    lea rdx, [dia]
    lea rcx, [mes]
    lea r8, [year]

    sub rsp, 8
    call sscanf
    add rsp,8

    xor rax,rax
    mov rax,[dia]

    mov [contador], rax
    mov qword[cantidad_dia],0


calculadora:
    cmp dword[contador], 10
    jge rellenar_con_10
    cmp dword[contador], 5
    jge rellenar_con_5
    cmp dword[contador], 1
    jge rellenar_con_1

    jmp siguiente_celda

rellenar_con_10:
    xor rax,rax
    lea rax, [contador]
    lea r9, [auxDia]
    mov r8, qword[cantidad_dia]

    mov byte[r9+r8], "X"


    add qword[cantidad_dia],1
    sub dword[contador],10

    jmp calculadora

rellenar_con_5:
    mov eax, [contador]
    lea r9, [auxDia]
    mov r8, qword[cantidad_dia]

    mov byte[r9+r8], "V"

    sub dword[contador],5
    add qword[cantidad_dia],1
    jmp calculadora

rellenar_con_1:
    mov eax, [contador]
    lea r9, [auxDia]
    mov r8, qword[cantidad_dia]

    mov byte[r9+r8], "I"

    sub dword[contador],1
    add qword[cantidad_dia],1
    jmp calculadora

siguiente_celda:
    ;printeamos
    mov rdi, formato_dia
    mov rsi, auxDia
    sub rsp, 8
    call printf
    add rsp,8

    mov rax, [mes]
    mov [contador], rax
    mov qword[cantidad_dia],0

        calculadora_mes:
            cmp dword[contador], 10
            jge rellenar_con_10_mes
            cmp dword[contador], 5
            jge rellenar_con_5_mes
            cmp dword[contador], 1
            jge rellenar_con_1_mes

            jmp siguiente_celda_year

        rellenar_con_10_mes:
            xor rax,rax
            lea rax, [contador]
            lea r9, [auxMes]
            mov r8, qword[cantidad_dia]

            mov byte[r9+r8], "X"


            add qword[cantidad_dia],1
            sub dword[contador],10

            jmp calculadora_mes

        rellenar_con_5_mes:
            mov eax, [contador]
            lea r9, [auxMes]
            mov r8, qword[cantidad_dia]

            mov byte[r9+r8], "V"

            sub dword[contador],5
            add qword[cantidad_dia],1
            jmp calculadora_mes

        rellenar_con_1_mes:
            mov eax, [contador]
            lea r9, [auxMes]
            mov r8, qword[cantidad_dia]

            mov byte[r9+r8], "I"

            sub dword[contador],1
            add qword[cantidad_dia],1
            jmp calculadora_mes

siguiente_celda_year:
    ;printeamos
    mov rdi, formato_dia
    mov rsi, auxMes
    sub rsp, 8
    call printf
    add rsp,8

        mov rax, [year]
        mov [contador], rax
        mov qword[cantidad_dia],0

        calculadora_year:
            cmp dword[contador], 1000
            jge rellenar_con_1000_year
            cmp dword[contador], 10
            jge rellenar_con_10_year
            cmp dword[contador], 5
            jge rellenar_con_5_year
            cmp dword[contador], 1
            jge rellenar_con_1_year

            jmp fin

        rellenar_con_1000_year:
            xor rax,rax
            lea rax, [contador]
            lea r9, [auxYear]
            mov r8, qword[cantidad_dia]

            mov byte[r9+r8], "M"


            add qword[cantidad_dia],1
            sub dword[contador],1000

            jmp calculadora_year

        rellenar_con_10_year:
            xor rax,rax
            lea rax, [contador]
            lea r9, [auxYear]
            mov r8, qword[cantidad_dia]

            mov byte[r9+r8], "X"


            add qword[cantidad_dia],1
            sub dword[contador],10

            jmp calculadora_year

        rellenar_con_5_year:
            mov eax, [contador]
            lea r9, [auxYear]
            mov r8, qword[cantidad_dia]

            mov byte[r9+r8], "V"

            sub dword[contador],5
            add qword[cantidad_dia],1
            jmp calculadora_year

        rellenar_con_1_year:
            mov eax, [contador]
            lea r9, [auxYear]
            mov r8, qword[cantidad_dia]

            mov byte[r9+r8], "I"

            sub dword[contador],1
            add qword[cantidad_dia],1
            jmp calculadora_year

fin:
    ;printeamos
    mov rdi, formato_dia
    mov rsi, auxYear
    sub rsp, 8
    call printf
    add rsp,8


ret


;------------------------------------------------------------------------------------------

continuar_normal:

    mov rdi, formato_normal
    sub rsp, 8
    call printf
    add rsp,8

    xor r10,r10
    mov [contador],r10
    mov qword[total],0


    loop_por_caracter:

        inc qword[contador]
        mov r8,[contador]
        cmp r8,[long_romano]

        jge salir

        mov rax,0; iterador caracteres validos romanos
        mov r9b, byte[ejemplo_romano+r8]

        loop:
            cmp r9b, [vector_romanos+rax]
            je encontrado
            cmp r9b , "/"
            je  cambiar_total
            inc rax
            cmp rax,4; ITERADOR
            jge loop_por_caracter ; avanzo_no encontrado puede ser espacio
            jmp loop

    encontrado:


        cmp rax,0
        je sumar_1 

        cmp rax,1
        je sumar_5 

        cmp rax,2
        je sumar_10

        cmp rax,3
        je sumar_1000 

        jmp loop_por_caracter

        sumar_10:
            cmp qword[anterior],10
            jl restar_anterior_10
            add qword[total], 10
            mov qword[anterior],10
            jmp loop_por_caracter

            restar_anterior_10:
                add qword[total], 10
                mov r10, [anterior]
                imul r10,2
                sub qword[total], r10
                jmp loop_por_caracter
        
        sumar_5:
            cmp qword[anterior],5
            jl restar_anterior_5
            add qword[total], 5
            mov qword[anterior],5
            jmp loop_por_caracter

            restar_anterior_5:
                add qword[total], 5
                mov r10, [anterior]
                imul r10,2
                sub qword[total], r10
                jmp loop_por_caracter

        sumar_1:
            cmp qword[anterior],1
            jl restar_anterior_1
            add qword[total], 1
            mov qword[anterior],1
            jmp loop_por_caracter

            restar_anterior_1:
                add qword[total], 1
                mov r10, [anterior]
                imul r10,2
                sub qword[total], r10
                jmp loop_por_caracter

        sumar_1000:
            cmp qword[anterior],1000
            jl restar_anterior_1000
            add qword[total], 1000
            mov qword[anterior],1000
            jmp loop_por_caracter

            restar_anterior_1000:
                add qword[total], 1000
                mov r10, [anterior]
                imul r10,2
                sub qword[total], r10
                jmp loop_por_caracter
        
    cambiar_total:
        ;printero numerio
        ;reseteo total
        mov rdi, formato_parte_fecha
        mov rsi, [total]
        sub rsp, 8
        call printf
        add rsp,8

        xor r10,r10
        mov [total],r10
        mov qword[anterior],1001

        jmp loop_por_caracter

;--------------------------------------------------------

continuar_jacobiano:

    mov rdi, formato_jacobiano
    sub rsp, 8
    call printf
    add rsp,8 


    lea rdi, [ejemplo]
    lea rsi, [formato_fechas_jacobiano]
    lea rdx, [dia]
    lea rcx, [mes]
    lea r8, [year]

    sub rsp, 8
    call sscanf
    add rsp,8

    xor rax,rax
    xor rdi, rdi
    mov eax, [dia]
    mov edi, [mes]

    imul eax,edi
    mov dword[dias_totales],eax


    mov rdi, formato_juliano
    mov rsi, [dias_totales]
    mov rdx, [year]
    sub rsp, 8
    call printf
    add rsp,8 
    ret



salir:
    mov rdi, formato_parte_fecha
    mov rsi, [total]
    sub rsp, 8
    call printf
    add rsp,8 
    ret

no_valido:
    mov rdi, error_valido
    sub rsp, 8
    call printf
    add rsp,8

    ret

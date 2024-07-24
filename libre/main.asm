; Enunciado

; ABACO.DAT

; CONTENIDO INICIAL AC
; CONTENIDO INICIAP RPIS
; DIRECCION DE LA CELDA DE INCCIIO DE UN RANGO DE CLEDAS DE MEMORIA
; CONTENIDO DEL RANGO DE CELDAS DE MEMORIA DE LA MAQUINA ABACUS (100 CELDAS CONFIGUAS)

; COMPONENTES DE MEMORIA 16 BITS (AC Y CELDAS) RPI 
; DIRECCION DE  CELDAS DE 12 BITS
;RPI 16 BUITS (4 0 AL PRINCIOP)

; INSTRUCCIONES 1: CARGA _ ac
; 2:ALMACENAR _ 
; 3:SUMAR_ suma el ac
; 4:NOT (AC) _ mascara
; 5:BIF SI AC = 0 _
; 6 BIF SI AC >0
; 7 BIF SI AC <0
; F FIN DE PROGRAMA_ cerrar_archivo

; CARGAR ABACO.DAT

; AC , RPI, CELDA DE MEMORIA EJECUTADA Y CELDA DE MEMORIA INVOLUCRADA EN LA INSTRUCCION EN LA INSTRUCCION SI LA HUBIERE

; FIN DE EJECUCION , ERROR POR CODIGO DE OPERACION INVALIDO O CELDA FUERA DE RANGO
;  (VALIDACION): VALOP

; 2 BYTES BINARIO CONTENIDO DE LA CELDA A EJECUTAR
; 2 BYTES BINARIO CON LA DIRECCION DE LA CELDA DE INICIO DEL RANGO 
; 2 BYTES EN BINARIO CON LA CANTIDAD DE CELDAS DE MEMORIA DEL RANGO LEIDO  EN EL ARCHIVPO
; 1 BYTE EN CARACTER CON LA RESPUESTA DE LA RUTINA S-OK / I - ERROR / M REFERENCIA DE ERROR



global main
extern fclose, fopen, fwrite ,fread, printf, atoi


section .data
    archivo db "ABACO.DAT",0
    modo db "rb",0
    instrucciones_validas db "1234567F"
    formato_cerrar_archivo db "cerrando archivo",10,0
    formato_error db "error archivo",10,0
    formato_valido db "valido registro",10,0
    formato_instruccion_invalido db " I ERROR registro invalido_instruccion",10,0
    formato_instruccion_valido db "registro valido_instruccion",10,0
    formato_referencia_invalido db " M referencia invalido",10,0
    formato_referencia_valido db "M referencia valido",10,0
    flag_error db 0 ;i
    flag_referencia db 0 ; m
    flag_rutina_todo_bien db 0

    aux_direccion db "***",0

    aux_direccion_segunda db "***",0
    formato_operacion_1 db "1",10,0
    formato_operacion_2 db "12",10,0
    formato_operacion_3 db "13",10,0
    formato_operacion_4 db "14",10,0
    formato_operacion_5 db "15",10,0
    formato_operacion_6 db "6",10,0
    formato_operacion_7 db "7",10,0
    formato_operacion_8 db "f",10,0

section .bss

    id resb 1
    registro:
        AC resw 1
        RPI resw 1
        CELDA_INICIO resd 1
        CONTENIDO times 1 resd 1
        barra_n  resb 1

    contenido:
        instruccion resb 1 
        direccion_celda resb 3 ; validar que no se pase del rango de 100 celdas
    BUFFER resb 1
    aux_byte resb 00


section .text
main:   

    mov rdi, archivo
    mov rsi, modo
    sub rsp,8
    call fopen
    add rsp,8

    cmp rax,0
    je error_archivo
    mov [id], rax

leer_registro:

    mov rdi, registro
    mov rsi, 13
    mov rdx, 1
    mov rcx, [id]

    sub rsp,8
    call fread
    add rsp,8

    cmp rax,0
    je cerrar

VALOP:
    xor r10,r10; iterador va ir aumentando de a 2 ; ACORDARSE DE AL FINAL DE TODO SUMAR 4
    leer_contenido: 
            mov al , byte[CONTENIDO+r10] ; instruccion
            xor r9,r9
        validar_instruccion:
            cmp al , [instrucciones_validas+r9]
            je valido_instruccion
            cmp r9, 7
            jge novalido_ERROR
            inc r9
            jmp validar_instruccion

        valido_instruccion: ; segun r9 ejecutamos 
            mov rdi, formato_instruccion_valido
            sub rsp,8
            call printf
            add rsp,8

            xor rdx, rdx
            mov dx, [CONTENIDO+r10]
            shl dx,1
            mov [direccion_celda], dx

            mov rcx,3
            mov rdi, CELDA_INICIO
            mov rsi, aux_direccion
            rep movsb

            mov rcx,3
            mov rdi, direccion_celda
            mov rsi, aux_direccion_segunda
            rep movsb

            mov rdi, aux_direccion_segunda
            sub rsp,  8
            call atoi
            add rsp,8

            mov [direccion_celda], rax

            xor rax,rax
            mov rdi, aux_direccion
            sub rsp,  8
            call atoi
            add rsp,8

            mov [CELDA_INICIO], rax


        validar_direccion:
            cmp [direccion_celda], rax
            jl novalido_REFERENCIA
            add rax, 100
            cmp [direccion_celda], rax
            jg novalido_REFERENCIA

        valido_direccion: ; segun r9 ejecutamos 
            mov rdi, formato_referencia_valido
            sub rsp,8
            call printf
            add rsp,8

            mov byte[flag_rutina_todo_bien],1
          
ejecutar_instruccion:
    cmp r9, 0
    je carga
    cmp r9,1
    je almacenar
    cmp r9,2
    je sumar
    cmp r9, 3
    je negativo
    cmp r9,4
    je igual_ac
    cmp r9,5
    je menor_ac
    cmp r9,6
    je mayor_ac
    cmp r9,7
    je cerrar

    carga:
        mov rdi, formato_operacion_1
        sub rsp,8
        call printf
        add rsp,8
        jmp leer_registro

    almacenar:
        mov rdi, formato_operacion_2
        sub rsp,8
        call printf
        add rsp,8
        jmp leer_registro

    sumar:
        mov rdi, formato_operacion_3
        sub rsp,8
        call printf
        add rsp,8
        jmp leer_registro

    negativo:
        mov rdi, formato_operacion_4
        sub rsp,8
        call printf
        add rsp,8
        jmp leer_registro

    igual_ac:
        mov rdi, formato_operacion_5
        sub rsp,8
        call printf
        add rsp,8
        jmp leer_registro

    menor_ac:
        mov rdi, formato_operacion_6
        sub rsp,8
        call printf
        add rsp,8
        jmp leer_registro

    mayor_ac:
        mov rdi, formato_operacion_7
        sub rsp,8
        call printf
        add rsp,8
        jmp leer_registro


cerrar:
    mov rdi, formato_cerrar_archivo
    sub rsp, 8
    call printf
    add rsp,8

    mov rdi, [id]
     sub rsp,8
     call fclose
     add rsp,8
    ret

novalido_ERROR:
    mov byte[flag_error], 1
    mov rdi, formato_instruccion_invalido
    sub rsp,8
    call printf
    add rsp,8

    ret

novalido_REFERENCIA:
    mov byte[flag_referencia], 1
    mov rdi, formato_referencia_invalido
    sub rsp,8
    call printf
    add rsp,8

    ret



error_archivo:
    mov rdi, formato_error

    sub rsp, 8
    call printf
    add rsp,8

    ret


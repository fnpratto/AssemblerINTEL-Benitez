; Enunciado
; CONTENIDO INICIAL AC
; CONTENIDO INICIAP RPIS
; DIRECCION DE LA CELDA DE INCCIIO DE UN RANGO DE CLEDAS DE MEMORIA
; CONTENIDO DEL RANGO DE CELDAS DE MEMORIA DE LA MAQUINA ABACUS (100 CELDAS CONFIGUAS)

; COMPONENTES DE MEMORIA 16 BITS (AC Y CELDAS) RPI 
; DIRECCION DE  CELDAS DE 12 BITS
;RPI 16 BUITS (4 0 AL PRINCIOP)

; INSTRUCCIONES 1: CARGA
; 2:ALMACENAR
; 3:SUMAR
; 4:NOT (AC)
; 5:BIF SI AC = 0
; 6 BIF SI AC >0
; 7 BIF SI AC <0
; F FIN DE PROGRAMA

; CARGAR ABACO.DAT

; AC , RPI, CELDA DE MEMORIA EJECUTADA Y CELDA DE MEMORIA INVOLUCRADA EN LA INSTRUCCION EN LA INSTRUCCION SI LA HUBIERE

; FIN DE EJECUCION , ERROR POR CODIGO DE OPERACION INVALIDO O CELDA FUERA DE RANGO
;  (VALIDACION): VALOP

; 2 BYTES BINARIO CONTENIDO DE LA CELDA A EJECUTAR
; 2 BYTES BINARIO CON LA DIRECCION DE LA CELDA DE INICIO DEL RANGO 
; 2 BYTES EN BINARIO CON LA CANTIDAD DE CELDAS DE MEMORIA DEL RANGO LEIDO  EN EL ARCHIVPO
; 1 BYTE EN CARACTER CON LA RESPUESTA DE LA RUTINA S-OK / I - ERROR / M REFERENCIA DE ERROR




global main
extern fclose, fopen, fwrite


section .data
    archivo db "ABACO.DAT",0
    modo db "wb",0

    linea1:
        AC dw 0000
        RPI dw 1111
        CELDA_INICIO dd "0300"
        CONTENIDO dd "2301" ; instrucciones son 2 bytes
        barra_n  db 0X0A

    
section .bss
    id resb 1

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

    mov rdi, linea1
    mov rsi, 13
    mov rdx, 1
    mov rcx, [id]

    sub rsp,8
    call fwrite
    add rsp,8

    mov rdi, [id]
    sub rsp,8
    call fclose
    add rsp,8


error_archivo:

ret

; # OperacionesLogicas
; Se dispone de un archivo que contiene registros con el siguiente contenido:
; - Operando: secuencia de caracteres que simbolizan bits (caracteres 0 o 1) (16 bytes)
; - Operación: carácter que simboliza una operación a efectuar entre dos operandos, y puede ser O
; (Or), X (Xor) y N (And) (1 byte)

; *Nota*: Tenga en cuenta que los registros son secuencias de bytes contiguos en la memoria, sin saltos de línea.

; Por ejemplo, el contenido de un archivo con tres registros podría ser:

; 1111111111111111X0000111100001111N0000000000001111O

; Por otro lado se lee desde teclado un valor de Operando inicial con el mismo formato que el del campo
; de los registros del archivo (caracteres 0 ó 1) (16 bytes).
; Se pide realizar un programa en assembler Intel 80x86 que vaya informando por pantalla el resultado de aplicar a los operandos la secuencia de
; operaciones informadas en los registros del archivo de entrada. La aplicación de las operaciones se hará de la siguiente manera:

; Op. Ini Operac. Reg.1 Op. Reg 1 -> Res. Parcial Operac. Reg. 2 Op. Reg 2 -> Res. Parcial ...

; Ejemplo:

; Operando Inicial = 0000000000000101

; Operando Registro 1 = 1111111111111111

; Operación Registro 1 = X (Xor)

; - Resultado Parcial = 1111111111111010
; Operando Registro 2 = 0000111100001111

; Operación Registro 2 = N (And)

; - Resultado Parcial = 0000111100001010


global main
extern fopen, fclose, fread, printf,scanf, gets, sscanf, atoi


section .data  
    operacionesValidas db "XNO",0
    archivo db  "file_tp1.txt",0
    modo db "r",0
    
    formatoError db "error archivo ",10,0
    formatoValido db 10,"registro valido ",10,0
    formatoINvalido db "registro invalido",10,0
    formato_termino db "termino operacion",0
    formato_resultado_parcial db "Resultado Parcial =  ",0

    formato_operando_num db "numero: %d",0

    formatoIngrese db "Ingrese operando (16 bytes 0 o 1)",0
    formatoIngrese2 db "ingrese operacion",0
    formato_operando db "%lli",0 ; o 16%hhi   %li son 8 bytes
    validez db "N"
    operando_sin_efectuar  db 0
    contador dq 0

section .bss
    registro:
        operando resb 16
        operacion resb 1

    operando_actual resb 16
    operacion_actual resb 1
    buffer resb 16

    aux_operando_actual resd 4
    aux_operando resd 4

    id resb 1
    
section .text

main:

    lea rdi, [archivo]
    lea rsi, [modo]
    sub rsp,8
    call fopen
    add rsp,8

    cmp rax, 0
    je error

    mov [id],rax

leer_registro:

    mov rdi, registro
    mov rsi, 17
    mov rdx, 1
    mov rcx, [id]
    sub rsp,8
    call fread
    add rsp,8

    cmp rax,0
    je close_file

    call VAL
    cmp byte[validez], "S"
    jne leer_registro


    mov rdi, formatoValido
    sub rsp,8
    call printf
    add rsp,8


    inc byte[operando_sin_efectuar]
    cmp byte[operando_sin_efectuar],2
    je efectuar

    cmp byte[operando_sin_efectuar],3
    jge actualizar_operador

actualizar_operando:
    mov rdi, [operando]
    mov [operando_actual], rdi

actualizar_operador:
    mov rdi, [operacion]
    mov [operacion_actual], rdi
    

efectuar:
    mov rdi, formato_resultado_parcial
    sub rsp,8
    call printf
    add rsp,8

convertir_operandos:
    cmp byte[operacion_actual], "X"
    je XOR_Operacion
    cmp byte[operacion_actual], "0"
    je OR_Operacion
    cmp byte[operacion_actual], "N"
    je AND_Operacion

XOR_Operacion: ; Son iguales va 0 sino 1
 
    itero_operando_XOR:
        
    jmp End_operancion


OR_Operacion: ; son diferentes va 0 sino va 1 NI IDEA USAMOS OR Y LISTO
    mov rcx, 0
    or_operacion_loop:
       
    jmp End_operancion


AND_Operacion:
    mov rcx, 0
    and_operacion_loop:
       
    jmp End_operancion

End_operancion:
    jmp leer_registro

close_file:
    mov rdi,[id]
    sub rsp, 8
    call fclose
    add rsp,8

ret


error:
    mov rdi, formatoError
    sub rsp, 8
    call printf
    add rsp,8
ret


;*****************************************************INTERNAS
VAL:
    mov rax,0
    mov r9,0
    validar_operacion:
        mov dil, byte[operacionesValidas+rax]
        cmp byte[operacion], dil
        je valido_operando
        add rax, 1
        cmp rax, 3
        jge no_valido

    valido_operando:  
        mov dil, byte[operando+r9]
        cmp dil, "0"
        je avanzo
        cmp dil, "1"
        je avanzo
        jmp no_valido

        avanzo:
            inc r9
            cmp r9,15
            jl valido_operando

    mov byte[validez], "S"

    ret

    no_valido:
        mov rdi, formatoINvalido
        sub rsp,8
        call printf
        add rsp,8
    ret












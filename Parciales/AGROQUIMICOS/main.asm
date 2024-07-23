;*************************************************************************************************
; AGROQUIMICOS
; Se dispone de una matriz (M) de 50x50 elementos que almacena información sobre agroquímicos a aplicar en un campo. Cada 
; elemento de M ocupa 4 bytes y representa una parcela del campo. El primer entero de 2 bytes corresponde a la cantidad de 
; litros de compuesto fungicida a aplicar en esa parcela y el segundo, la cantidad de litros de compuesto fertilizante.
;
; Además, se cuenta con un archivo AGRO.DAT que contiene una recomendación del proveedor sobre las cantidades de agroquímicos 
; a aplicar en cada parcela, con registros de ancho fijo de acuerdo al siguiente formato:
;
;   - 1 byte en BPF c/s indicando el nro. de fila de la parcela (1 a 50)
;   - 1 byte en BPF c/s indicando el nro. de columna de la parcela (1 a 50)
;   - 1 byte en ASCII con los siguientes valores posibles: 'U' para fungicida | 'F' para fertilizante
;   - 2 bytes en BPF sin signo indicando la cantidad de litros de compuesto a aplicar.
;
; Se pide codificar un programa en Assembler de Intel 80x86 que permita:
; 1) Recorrer el archivo de recomendaciones y actualizar la matriz sumando al valor preexistente el valor recomendado en cada
; registro
; 2) Chequear que los registros del archivo contienen valores válidos para el dominio del problema. 
;    Esta validación deberá realizarse en una rutina aparte con rótulo VALIDA. Los registros no válidos deberán ser descartados.
; 



global main

extern fopen , fclose, printf, scanf , fread, sscanf

section .data
    formatoerror db "error archivo",0
    formato_resultados db "se necesita fungicida en %hhi parcelas, y cantidad de fertilizante %hhi",0
    formato_elemento db "%d",0
    formatovalido db "valido",10,0
    formatoinvalido db "invalido",10,0
    archivo db "AGRO.DAT",0
    modo db "rb",0
    formato_linea db "%hhi,%hhi,%c,%hi",10,0
    formato_char db "c",0
    tipos_validos db "F","U"
    M times 2500 dd 0
    lenght_elemento db 4
    lenght_fila db 200 ; 50*4
    filaInforme db 1
    contador db 0
    cant_fungicida db 0
    suma_total_fertilizante db 0

    parcela:
        litros_f dw 1
        litros_u dw 1


section .bss
    id resq 1
    registro:
        fila resb 1
        columna resb 1
        tipo resb 1
        litros resw 1
    
    buffer resb 5

    


section .text
main:
    mov rdi, archivo
    mov rsi, modo

    sub rsp, 8
    call fopen
    add rsp,8


    cmp rax, 0
    je errorOpenFile
    mov [id], rax
leer_registro:

    lea rdi, [registro]
    mov rsi, 5
    mov rdx,1
    mov rcx,[id]
    sub rsp, 8
    call fread
    add rsp,8

    cmp rax,0
    je close_file


    xor rdi,rdi
    xor rdx, rdx
    xor rcx, rcx
    xor r9,r9

    lea rdi ,[formato_linea]
    mov rsi, [fila]
    mov rdx, [columna]
    mov rcx,[tipo]
    mov r9, [litros]

    sub rsp,8
    call printf
    add rsp,8

VAL:
    xor rax,rax
valido_fila:
    cmp byte[fila],1
    jl noValido
    cmp byte[fila],50
    jg noValido


valido_columna:

    cmp byte[columna],1
    jl noValido
    cmp byte[columna],50
    jg noValido


valido_tipo:
    xor rax,rax
    xor rdi, rdi

    cmp byte[tipo],"F"
    je valido_litros
    cmp byte[tipo],"U"
    je valido_litros
    jmp noValido

valido_litros:

    mov rdi, formatovalido
    sub rsp, 8
    call printf
    add rsp,8
    ;;;;;

actualizar_matriz:
    xor rax,rax
    ;mov i-1 *long fila j-1 long elemento
    mov al, [fila]
    dec al
    imul rax, [lenght_fila]

    mov dil, [columna]
    sub dil,1
    imul rdx, [lenght_elemento]

    add al, dil

    cmp byte[tipo],"F"
    je agrego_f
    cmp byte[tipo],"U"
    je agrego_u

agrego_f:
    xor rbx,rbx
    lea bx, word[M+rax]
    add bx, [litros]
    mov word[M+rax], bx
    jmp leer_registro

agrego_u: 
    xor rbx,rbx
    add rax,2
    lea bx, word[M+rax+2]
    add bx, [litros]
    mov word[M+rax+2], bx
    jmp leer_registro 


noValido:
    mov rdi,formatoinvalido
    sub rsp,8
    call printf
    add rsp,8

    jmp leer_registro

close_file:
    mov rdi, [id]
    sub rsp,8
    call fclose
    add rsp,8


;3) Dado un número de fila que se asume ya cargado en un campo llamado filaInforme, mostrar por pantalla la cantidad total de 
;    parcelas que no necesitan fungicida de dicha fila y la cantidad total de litros de fertilizante recomendada para todas 
;    las parcelas también de dicha fila
;*************************************************************************************************
    cmp     byte[filaInforme], 1
    jl      noValido
    cmp     byte[filaInforme], 50
    jg      noValido
loop_matriz:
    xor rax,rax
    ;mov i-1 *long fila j-1 long elemento
    mov al, [filaInforme]
    dec al
    imul rax, [lenght_fila]

    mov dil, [contador]
    sub dil,1
    imul rdx, [lenght_elemento]

    add al, dil

    mov rdi , formato_elemento
    mov rsi ,[M+rax]

    sub rsp,8
    call printf
    add rsp,8

    sumar_total_fertilizante:
        xor rbx,rbx
        mov bx, word[M+rax]
        add word[suma_total_fertilizante], bx

    chequear_necesita_fungicida:
        add rax,2
        xor rbx,rbx
        mov bx, word[M+rax]
        cmp rbx, 0
        jle siguiente
        inc byte[cant_fungicida]

    siguiente:
    inc byte[contador]
    cmp byte[contador], 50
    jl loop_matriz

imprimir_resultados:
    ;imprimir resultados
    mov rdi , formato_resultados
    mov rsi ,[cant_fungicida]
    mov rdx, [suma_total_fertilizante]

    sub rsp,8
    call printf
    add rsp,8
ret

errorOpenFile:
    mov rdi, formatoerror
    sub rsp,8
    call printf
    add rsp,8

ret
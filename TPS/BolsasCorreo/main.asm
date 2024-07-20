;Bolsas de Correo (III)

;Se tienen n objetos de pesos P1, P2, ..., Pn (con n <= 20) que deben ser enviados por correo a una
;misma dirección. La forma más simple sería ponerlos todos en un mismo paquete; sin embargo, el
;correo no acepta que los paquetes tengan más de 17 Kg. y la suma de los pesos podría ser mayor
;que eso. Afortunadamente, cada uno de los objetos no pesa más de 17 Kg.

;Se trata entonces de pensar un algoritmo que de un método para armar los paquetes, tratando de
;optimizar su cantidad. Debe escribir un programa en assembler Intel 80x86 que:
;   ● Permita la entrada de un entero positivo n.
;   ● La entrada de los n pesos, verificando que 0<Pi<=17 donde i<=n.
;   ● Los Pi pueden ser valores enteros.
;   ● Exhiba en pantalla la forma en que los objetos deben ser dispuestos en los paquetes.

;A su vez existen tres destinos posibles: Mar del Plata, Mendoza y Salta. El correo por normas internas
;de funcionamiento no puede poner en el mismo paquete objetos que vayan a distinto destino.
;Desarrollar un algoritmo que proporcione una forma de acomodar los paquetes de forma que no haya
;objetos de distinto destino en un mismo paquete y cumpliendo las restricciones de peso. Se sugiere
;tener una salida como la siguiente:
;   • Destinoi – Objeto1 (P1) + Objeto2 (P2)+ ..... + Objeton (Pn)
;   • Destinoi – Objeto1 (P1) + Objeto2 (P2)+ ..... + Objeton (Pn)
;   • Destinoi – Objeto1 (P1) + Objeto2 (P2)+ ..... + Objeton (Pn)

;paquetes: 

global main
extern fopen, printf, atoi, fread, fclose, sscanf, strcmp

%define MardelPlata 'P'
%define Mendoza 'M' 
%define Salta 'S' 

%macro mFopen 0
    sub rsp, 8
    call fopen
    add rsp,8
%endmacro 

%macro mPrintf 0
    sub rsp, 8
    call printf
    add rsp,8
%endmacro 

%macro mSscanf 0
    sub     rsp,8
    call    sscanf
    add     rsp,8
%endmacro

%macro mFread 0
    sub rsp, 8
    call fread
    add rsp,8
%endmacro 

%macro mFclose 0
    sub rsp, 8
    call fclose
    add rsp,8
%endmacro  


section .data
    archivo db "paquetes.txt",0
    modo db "r",0
    error_abrir db "Error de archivo",0
    nombreAux db "*******",0
    lugarAux db "*",0
    formatInt db "%i",10,0
    formatChar db "%c",10,0
    formatString db "%s",10,0
    linea_format db "%c,%s,%d",0
    sumaTotal  dq 0
    buffer times 200 db 0

    headerMardelPlata db "Destino: Mar del Plata\n", 0
    headerMendoza db "Destino: Mendoza\n", 0
    headerSalta db "Destino: Salta\n", 0

    objetoP db "Objeto: %s (Peso: %d)\n", 0
    nuevoPaquete db "Nuevo paquete:\n", 0

    formatoagregarmardel db "Se agrega paquete yendo a mardel ",0


section .bss
    idArchivo resq 0
    lugar resb 1
    nombre times 7 resb 1
    peso resd 1
    ;paquete:
    destino    resb 1
    objeto     times 4 resb 7 ;7nombre + peso
    pesos      times 4 resb 1

    paqueteP times 5 resb 200
    paqueteM times 5 resb 200
    paqueteS times 5 resb 200
    sumaTotalP resd 1
    sumaTotalM resd 1
    sumaTotalS resd 1

section .text

main:
    mov rdi, archivo
    mov rsi, modo
    mFopen

    cmp rax, 0
    jle errorApertura

    mov qword [idArchivo], rax

leer_registro:
    mov rdi, buffer
    mov rsi, 13
    mov rdx, 1
    mov rcx, [idArchivo]
    mFread
           
    cmp     rax, 0
    jle     close_file

    ;guardamos los datos
    xor rdx, rdx
    lea rdi, [buffer]
    lea rsi, [linea_format]
    lea dil, [lugar]
    mov rcx, nombre
    lea r8, [peso]
    mSscanf
validar_campos:
    
    valido_con_lugares:
        xor rax, rax
        mov rdi, formatChar
        lea rsi, byte[lugar]
        mPrintf
        jmp validar_objeto


    validar_objeto:
        mov     rcx, 7
        mov     rsi, nombre
        mov     rdi, nombreAux
        rep movsb
    
        mov rdi, formatString
        mov rsi, nombreAux
        mPrintf 

    validar_peso:
        lea rdi, [peso]
        sub rsp,8
        call atoi
        add rsp,8

        mov [peso], rax

        mov rdi, formatInt
        mov rsi, [peso]
        mPrintf 

distribuir:

    movzx rdi, byte [lugar]
    cmp rdi, MardelPlata
    je distribuir_mardel

    cmp rdi, Mendoza
    je distribuir_mendoza

    cmp rdi, Salta
    je distribuir_salta

    jmp leer_registro


distribuir_mardel:
    lea rdi, [formatoagregarmardel]
    mPrintf

    mov eax, [sumaTotalP]
    add eax, [peso]
    cmp eax, 17
    jle agregar_mardel
    jmp nuevo_paquete_mardel

agregar_mardel:
    mov [sumaTotalP], eax
    mov rdi, paqueteP
    add rdi, [sumaTotalP]
    mov rsi, nombre
    movsb
    mov rsi, [peso]
    mov [rdi], rsi
    jmp leer_registro

distribuir_mendoza:
    mov rdi, formatoagregarmardel
    mPrintf
    mov eax, [sumaTotalM]
    add eax, [peso]
    cmp eax, 17
    jle agregar_mendoza
    jmp nuevo_paquete_mendoza

agregar_mendoza:
    mov [sumaTotalM], eax
    mov rdi, paqueteM
    add rdi, [sumaTotalM]
    mov rsi, nombre
    movsb
    mov rsi, [peso]
    mov [rdi], rsi
    jmp leer_registro

distribuir_salta:
    mov rdi, formatoagregarmardel
    mPrintf
    mov eax, [sumaTotalS]
    add eax, [peso]
    cmp eax, 17
    jle agregar_salta

    jmp nuevo_paquete_salta
    mov eax, [peso]

agregar_salta:
    mov [sumaTotalS], eax
    mov rdi, paqueteS
    add rdi, [sumaTotalS]
    mov rsi, nombre
    movsb
    mov rsi, [peso]
    mov [rdi], rsi
    jmp leer_registro

nuevo_paquete_mardel:
    mov rdi, nuevoPaquete
    mPrintf
    mov dword[sumaTotalP], 0
    jmp leer_registro

nuevo_paquete_mendoza:
    mov rdi, nuevoPaquete
    mPrintf
    mov dword[sumaTotalM], 0
    jmp leer_registro

nuevo_paquete_salta:
    mov rdi, nuevoPaquete
    mPrintf
    mov dword[sumaTotalS], 0
    jmp leer_registro

datos_invalidos:
    jmp leer_registro

close_file:
    ; Close the file
    mov rdi, [idArchivo]
    mFclose

end:
    ; Exit program
    mov eax, 0
    ret

errorApertura:
    mov rdi, error_abrir
    mPrintf
    ret


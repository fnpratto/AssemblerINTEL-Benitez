;19.Se cuenta con una matriz (M) de 20x20 cuyos elementos son BPFC/S de 16 bits y un archivo 
;(carbina.dat) cuyos registros están conformados por los siguientes campos:
;	• Cadena de 16 bytes de caracteres ASCII que representa un BPFc/s de 16 bits
;	• BPF s/s de 8 bits que indica el número de fila de M
;	• BPF s/s de 8 bits que indica el número de columna de M
;Se pide codificar un programa que lea los registros del archivo y complete la matriz con dicha información.  
;Como el contenido de los registros puede ser inválido deberá hacer uso de una rutina interna (VALREG) 
;para validarlos (los registros inválidos serán descartados y se procederá a leer el siguiente).  
;Luego realizar la sumatoria de la diagonal secundaria e imprimir el resultado por pantalla.
;Nota: Se deberá inicializar M con ceros por si no se lograra completar todos los elementos con la información provista en el archivo.

section .data
    filename db 'carbina.dat', 0
    formatResult db 'Sum of secondary diagonal: %d', 10, 0
    modo db "rb",0
    M times 20 times 20 resd 0 ; Matrix of 20x20 BPFC/S 16-bit integers, initialized to zero
    idArchivo db 0
    longFila dq 400
    longElemento dq  1 
    formatoLinea db "Auxilidar num binario: %hi , pos x: %hhi , pos y : %hhi",10, 0
    msgvalido db "es valido el registro",10,0
    msgNovalido db "no valido el registro",10,0
    formatoCoordenada db "X: %hhi, y: %hhi"
    aux_num_binario dw 0
    formatoDX db "dx: %hi",10,0
    

section .bss
    registro:
        num_binario resb 16
        x  resb 1
        y  resb 1
    sum resd 1  ; Sum of the secondary diagonal

    isValid resb 0


section .text
extern fopen, fread, fclose, printf
global main

%macro mPrintf 0
    sub rsp, 8
    call printf
    add rsp, 8
%endmacro

%macro mFopen 0
    sub rsp, 8
    call fopen
    add rsp, 8
%endmacro



main:
    ; Open file
    lea rdi, [filename]
    mov rsi, modo  ; "rb" for reading
    mFopen
    cmp rax,0
    jle end  ; If fopen failed, exit
    mov qword[idArchivo], rax  ; Save file pointer


LeerRegistro:
    mov     rdi, registro   ;Param 1: direccion de area de memoria donde se copiaran los datos
    mov     rsi, 18         ;Param 2: longitud del registro completo
    mov     rdx, 1               ;Param 3: cant de registros
    mov     rcx, [idArchivo]    ;Param 4: el handle del archivo a leer para completar el registro
    sub     rsp, 8
    call    fread
    add     rsp, 8

    cmp     rax, 0
    jle     close_file

    ; Validate the record
    sub rsp,8
    call VALREG
    add rsp, 8


    cmp    byte[isValid],'N'
    je     LeerRegistro

actualizarMatriz:
    ; Calculate the position in the matrix
    xor rax,rax
    mov al, byte[x]
    dec al
    mov dl, byte[longFila]
    mul dl
    mov [x],al
    mov al, [y]
    dec al
    mov dl, byte[longElemento]
    mul dl

    mov dil, [x]
    add al, dil
    
    ; Copy the activity to the matrix
    mov rdi, [M + rax]
    mov [aux_num_binario],rdi ; chequear

    jmp LeerRegistro

close_file:
    ; Close the file
    mov rdi, [idArchivo]
    sub rsp, 8
    call fclose
    add rsp,8

end:
    ; Exit program
    ret


VALREG:
    mov rdi,[x]
    mov rax, 0

    validarX: 

        mov dl, [x]
        cmp dl, 0
        jle salir
        cmp dl,20
        jg salir

    validarY:

        mov dl, [y]
        cmp dl, 0
        jle salir
        cmp dl,20
        jg salir

    validarBinario:
        xor rsi, rsi ; registro num
        xor rax,rax; iteradir
        xor rdi,rdi; shift
        xor rcx,rcx
        mov [aux_num_binario],rcx

        loop:
            mov sil, byte[num_binario+rax]  
            cmp sil, "1"
            je continuar
            cmp sil ,"0"
            je fin_loop
            jmp salir

        continuar:         
            mov dx, 1
            mov cl, 15
            sub cl,al
            shl dx,cl ; shl inmediato / cl

            ;muevo a registro 
            add [aux_num_binario],dx

        fin_loop:
            inc rax
            cmp rax, 15

            jge validoRegistro
            jmp loop

    validoRegistro:
        mov rdi, formatoLinea
        mov rsi, [aux_num_binario]
        mov rdx, [x]
        mov rcx, [y]
        mPrintf


        mov rdi, msgvalido
        mPrintf
        mov byte [isValid], 'S'
        ret

    salir:
        mov rdi, msgNovalido
        mPrintf
        mov byte [isValid], 'N'
        ret




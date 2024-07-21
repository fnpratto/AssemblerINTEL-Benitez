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
    M times 20 times 20 resd 0 ; Matrix of 20x20 BPFC/S 16-bit integers, initialized to zero
    

section .bss
    buffer resb 18  ; Buffer to read a record from the file
    sum resd 1  ; Sum of the secondary diagonal

section .text
extern fopen, fread, fclose, printf
global main

%macro mPrintf 0
    sub rsp, 8
    call printf
    add rsp, 8
%endmacro

main:
    ; Open file
    lea rdi, [filename]
    mov rsi, modo  ; "r" for reading
    mFopen
    cmp rax,0
    jle errorOpen  ; If fopen failed, exit
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
    call VALCAL
    add rsp, 8

    mov rcx, 20
    mov rsi, actividad
    mov rdi , auxactividad
    rep movsb

    mov rcx, 2
    mov rsi, dia
    mov rdi , auxdia
    rep movsb

    mov rdi, formatoActividad
    mov rsi, auxdia
    mov rdx, [semana]
    mov rcx, auxactividad
    mPrintf


    cmp    byte[isValid],'N'
    je     LeerRegistro

actualizarMatriz:
    ; Calculate the position in the matrix
    mov rax, [numDia]
    mov rdx, 140
    mul rdx
    mov [numDia],rax
    mov rax, [auxSemana]
    dec rax
    mov rdx, 20
    mul rdx


    mov rdi, [numDia]
    add rax, rdi
    
    ; Copy the activity to the matrix
    mov rdi, [C + rax]
    mov [actividad],rdi

    mov rcx, 20
    mov rsi, actividad
    mov rdi , auxactividad
    rep movsb

    mov rcx, 2
    mov rsi, dia
    mov rdi , auxdia
    rep movsb

    mov rdi, formatoActividad
    mov rsi, auxdia
    mov rdx, [auxSemana]
    mov rcx, auxactividad
    mPrintf

    jmp LeerRegistro

close_file:
    ; Close the file
    mov rdi, rbx
    call fclose

    ; Calculate the sum of the secondary diagonal
    xor ecx, ecx  ; Clear sum
    mov edx, 19  ; Start with the last column of the first row

end:
    ; Exit program
    mov eax, 0
    ret


VALREG:
       lea rdi,[dia]
    mov rax, 0

validarDia: ; recorro vector de dias
    lea rcx, [diasValidos + rax*2]
    mov cx, word[rcx]
    cmp di, cx
    je  validarSemana
    inc rax
    cmp rax, 7
    jne validarDia
    jmp salir

validarSemana:

    mov rdi, msgvalido
    mPrintf

    mov [numDia], rax
    mov rax, [semana]
    sub rsp,8
    call atoi
    add rsp,8

    mov [auxSemana],rdi
    cmp rdi, 0
    jle salir
    cmp rdi,6
    jg salir

validoRegistro:
    mov rdi, msgvalido
    mPrintf
    mov byte [isValid], 'S'
    ret

salir:
    mov rdi, msgNovalido
    mPrintf
    mov byte [isValid], 'N'
    ret




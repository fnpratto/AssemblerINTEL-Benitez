;19.	Se cuenta con una matriz (M) de 20x20 cuyos elementos son BPFC/S de 16 bits y un archivo (carbina.dat) cuyos registros están conformados por los siguientes campos:
;	• Cadena de 16 bytes de caracteres ASCII que representa un BPFc/s de 16 bits
;	• BPF s/s de 8 bits que indica el número de fila de M
;	• BPF s/s de 8 bits que indica el número de columna de M
;Se pide codificar un programa que lea los registros del archivo y complete la matriz con dicha información.  Como el contenido de los registros puede ser inválido deberá hacer uso de una rutina interna (VALREG) para validarlos (los registros inválidos serán descartados y se procederá a leer el siguiente).  Luego realizar la sumatoria de la diagonal secundaria e imprimir el resultado por pantalla.
;Nota: Se deberá inicializar M con ceros por si no se lograra completar todos los elementos con la información provista en el archivo.

section .data
    filename db 'carbina.dat', 0
    formatResult db 'Sum of secondary diagonal: %d', 10, 0

section .bss
    M resw 20*20  ; Matrix of 20x20 BPFC/S 16-bit integers, initialized to zero
    buffer resb 18  ; Buffer to read a record from the file
    sum resd 1  ; Sum of the secondary diagonal

section .text
extern fopen, fread, fclose, printf
global main

%macro mPrintf 1
    sub rsp, 8
    mov rdi, %1
    mov rax, 0
    call printf
    add rsp, 8
%endmacro

VALREG:
    ; Validate the record in the buffer
    ; Assume buffer structure: [16-byte string][8-bit row][8-bit col]
    ; Return ZF=0 if valid, ZF=1 if invalid
    movzx eax, byte [buffer + 16]  ; Load row number
    cmp eax, 20
    ja .invalid
    movzx eax, byte [buffer + 17]  ; Load column number
    cmp eax, 20
    ja .invalid
    xor eax, eax
    ret
.invalid:
    mov eax, 1
    ret

main:
    ; Open file
    lea rdi, [filename]
    mov rsi, 0  ; "r" for reading
    call fopen
    test rax, rax
    jz end  ; If fopen failed, exit
    mov rbx, rax  ; Save file pointer

read_loop:
    ; Read a record from the file
    lea rdi, [buffer]
    mov rsi, 1
    mov rdx, 18
    call fread
    test rax, rax
    jz close_file  ; If fread failed or EOF, exit loop

    ; Validate the record
    call VALREG
    test eax, eax
    jnz read_loop  ; If invalid, read next record

    ; Get row and column
    movzx eax, byte [buffer + 16]
    movzx ebx, byte [buffer + 17]
    ; Convert 16-byte ASCII string to BPFC/S 16-bit integer
    lea rdi, [buffer]
    call atoi
    ; Store the value in the matrix
    mov [M + 2*(eax*20 + ebx)], ax

    jmp read_loop

close_file:
    ; Close the file
    mov rdi, rbx
    call fclose

    ; Calculate the sum of the secondary diagonal
    xor ecx, ecx  ; Clear sum
    mov edx, 19  ; Start with the last column of the first row
calc_sum:
    add cx, [M + 2*(ecx*20 + edx)]
    dec edx
    inc ecx
    cmp ecx, 20
    jne calc_sum

    ; Store the result
    mov [sum], ecx

    ; Print the result
    lea rdi, [formatResult]
    mov esi, [sum]
    mPrintf rdi

end:
    ; Exit program
    mov eax, 0
    ret

atoi:
    ; Converts the ASCII string at [rdi] to a BPFC/S 16-bit integer in AX
    xor eax, eax
    xor ecx, ecx
.convert_loop:
    lodsb
    test al, al
    jz .done
    sub al, '0'
    imul ax, cx, 10
    add cx, ax
    jmp .convert_loop
.done:
    mov ax, cx
    ret

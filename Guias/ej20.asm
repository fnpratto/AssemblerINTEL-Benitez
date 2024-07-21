;20. Se dispone de una matriz C que representa un calendario de actividades de una persona. 
;La matriz C está formada por 7 columnas (que corresponden a los días de la semana) 
;y por 6 filas (que corresponden a las semanas que puede tener como máximo un mes en un calendario). 
;Cada elemento de la matriz tiene una longitud de 200 caracteres que a las actividades a realizar ese día 
;(como mucho se podrán poner 10 actividades). 
;Además se dispone de un archivo de entrada llamado CALEN.DAT 
;para cargar el contenido de los vectores de la matriz C con la siguiente información:
;•	Día de la semana: Carácter de 2 bytes (DO, LU, MA, MI, JU, VI, SA)
;•	Semana: Binario de 1 byte (0..5)
;•	Actividad: Caracteres de longitud 20 con la descripción.
;Como la información leída del archivo puede ser errónea, se dispone de una rutina interna llamada VALCAL 
;para su validación. La rutina recibirá como parámetros el registro de entrada y un 1 byte en donde devolverá una ‘S’ 
;si el registro es válido, o en caso contrario una ‘N’. Se deberá validar el Día de la semana y la Semana.
;Se pide realizar un programa assembler Intel x86 que cargue la matriz C con la información del archivo
; de entrada previamente validada. Luego se solicita listar todas las actividades de todas las semanas 
;del día almacenado en DiaIng	DD	XX.

%macro mFopen 0
    sub rsp, 8
    call fopen
    add rsp, 8 
%endmacro

%macro mFread 0
    sub rsp, 8
    call fread
    add rsp, 8
%endmacro

%macro mFclose 0
    sub rsp, 8
    call fclose
    add rsp, 8
%endmacro

%macro mPrintf 0
    sub rsp, 8
    call printf
    add rsp, 8
%endmacro


section .data
    ; file ops
    filename db 'CALEN.DAT', 0
    modo db 'rb', 0
    formatActivity db '%s', 10, 0
    formatoActividad db 'Dia: %s, Semana: %hhi, Actividad: %s', 10, 0
    diasValidos dw "LU", "MA", "MI", "JU", "VI", "SA", "DO"

    ; error messages
    errorOpenMsg db 'Error al abrir el archivo', 10, 0
    msgCloseFile db 'Cerrando archivo', 10, 0
    msgNovalido db 'Registro no valido', 10, 0
    msgvalido db 'Registro valido', 10, 0

    auxactividad db  "********************",0
    auxdia db "**",0

    longElemento db 20
    longFila db 140

section .bss
    C resb 7*6*20  ; Matrix of activities (7 days, 6 weeks, 200 chars each)
    registro:
        dia resb 2
        semana resb 1
        actividad resb 20
        nuevaLinea resb 1

    idArchivo resq 1
    isValid resb 1
    auxSemana resd 1
    numDia resb 1

section .text
extern fopen, fread, fclose, printf, atoi , puts
global main

main:
    ; Open file
    lea rdi, [filename]
    mov rsi, modo  ; "r" for reading
    mFopen
    cmp rax,0
    jle errorOpen  ; If fopen failed, exit
    mov qword[idArchivo], rax  ; Save file pointer

LeerRegistro:
    lea     rdi, [registro]   ;Param 1: direccion de area de memoria donde se copiaran los datos
    mov     rsi, 24          ;Param 2: longitud del registro completo
    mov     rdx, 1               ;Param 3: cant de registros
    mov     rcx, [idArchivo]    ;Param 4: el handle del archivo a leer para completar el registro
    mFread

    cmp     rax, 0
    jle     close_file

  
    ; Validate the record
    sub rsp,8
    call VALCAL
    add rsp, 8

    mov rcx, 20
    lea rsi, [actividad]
    lea rdi , [auxactividad]
    rep movsb

    mov rcx, 2
    lea rsi, [dia]
    lea rdi , [auxdia]
    rep movsb

    lea rdi, [formatoActividad]
    lea rsi, [auxdia]
    xor rdx,rdx
    mov dl, byte[semana]
    lea rcx, [auxactividad]
    mPrintf


    cmp    byte[isValid],'N'
    je     LeerRegistro

actualizarMatriz:
    ; Calculate the position in the matrix
    xor rax,rax
    mov al, byte[numDia]
    dec al
    mov dl, byte[longFila]
    mul dl
    mov [numDia],al
    mov al, [semana]
    dec al
    mov dl, byte[longElemento]
    mul dl

    mov dil, [numDia]
    add al, dil
    ; al tiene posicion 
    
    ; Copy the activity to the matrix
    mov rdi, [C + rax]
    mov [actividad],rdi

    jmp LeerRegistro

close_file:
    mov rdi, msgCloseFile
    mPrintf
    mov     rdi, [idArchivo]
    mFclose

    ret

VALCAL:
    mov di,word[dia]
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

    mov [numDia], rax

    mov dl, [semana]
    cmp dl, 0
    jle salir
    cmp dl,6
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


; Errors

errorOpen:
    lea rdi, [errorOpenMsg]
    mPrintf
    ret

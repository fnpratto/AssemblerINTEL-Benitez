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

    formatoActividad db 'Dia: %s, Semana: %hhi, Actividad: %s', 10, 0
    diasValidos dw "LU", "MA", "MI", "JU", "VI", "SA", "DO"

    ; error messages
    errorOpenMsg db 'Error al abrir el archivo', 10, 0
    msgCloseFile db 'Cerrando archivo', 10, 0
    msgNovalido db 'Registro no valido', 10, 0
    msgvalido db 'Registro valido', 10, 0

    auxactividad db  "********************",0
    auxdia db "**",0

section .bss
    C resb 7*6*20  ; Matrix of activities (7 days, 6 weeks, 200 chars each)
    idArchivo resq 1

    registro:
        dia resb 2
        semana resb 1
        actividad resb 20

section .text
extern fopen, fread, fwrite, fclose, printf, atoi , puts
global main

main:
    ; Open file
    lea rdi, [filename]
    mov rsi, modo  ; "rb" for reading binary
    mFopen
    mov qword[idArchivo], rax  ; Save file pointer

loop:
    ; Read file
    lea rdi, [registro]
    mov rsi, 23
    mov rdx, 1
    mov rcx, [idArchivo]
    mFread

    cmp rax, 0
    je end

    ; If week is not valid jump to loop
    mov dl, [semana]
    cmp dl, 6
    jg loop

    ; make null terminated day str
    mov rcx, 2
    lea rsi, [dia]
    lea rdi, [auxdia]
    rep movsb

    ; make null terminated activity str
    mov rcx, 20
    lea rsi, [actividad]
    lea rdi, [auxactividad]
    rep movsb

    ; print activity
    lea rdi, [formatoActividad]
    lea rsi, [auxdia]
    xor rdx, rdx
    mov dl, byte [semana]
    lea rcx, [auxactividad]
    mPrintf

    jmp loop

end:    
    ; Close file
    mov rdi, [idArchivo]
    mFclose
    ret

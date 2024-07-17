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

section .data
    filename db 'CALEN.DAT', 0
    formatActivity db '%s', 10, 0
    formatNoActivities db 'No activities for %s', 10, 0
    days db 'DO', 'LU', 'MA', 'MI', 'JU', 'VI', 'SA'
    DiaIng db 'LU', 0  ; Example input day for listing activities

section .bss
    C resb 7*6*200  ; Matrix of activities (7 days, 6 weeks, 200 chars each)
    buffer resb 23  ; Buffer to read a record from the file
    isValid resb 1  ; Validation result (S or N)

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

VALCAL:
    ; Validate the record in the buffer
    ; Assume buffer structure: [2-byte day][1-byte week][20-byte activity]
    ; Return 'S' in [isValid] if valid, 'N' if invalid
    ; Validate day of the week
    movzx eax, word [buffer]
    lea rdi, [days]
    mov ecx, 7
.valid_day_loop:
    cmp eax, word [rdi]
    je .valid_day
    add rdi, 2
    loop .valid_day_loop
    mov byte [isValid], 'N'
    ret
.valid_day:
    ; Validate week (1-6)
    movzx eax, byte [buffer + 2]
    cmp eax, 1
    jl .invalid_week
    cmp eax, 6
    jg .invalid_week
    mov byte [isValid], 'S'
    ret
.invalid_week:
    mov byte [isValid], 'N'
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
    mov rdx, 23
    call fread
    test rax, rax
    jz close_file  ; If fread failed or EOF, exit loop

    ; Validate the record
    call VALCAL
    cmp byte [isValid], 'N'
    je read_loop  ; If invalid, read next record

    ; Get day index
    movzx eax, word [buffer]
    lea rdi, [days]
    mov ecx, 7
.day_index_loop:
    cmp eax, word [rdi]
    je .found_day_index
    add rdi, 2
    loop .day_index_loop
    jmp read_loop
.found_day_index:
    sub rdi, days
    shr rdi, 1  ; rdi now contains the index of the day (0-6)

    ; Get week index
    movzx eax, byte [buffer + 2]
    dec eax  ; Convert to 0-based index

    ; Copy activity to matrix
    lea rsi, [buffer + 3]
    lea rdi, [C + rdi*6*200 + eax*200]
    mov rcx, 20
    rep movsb

    jmp read_loop

close_file:
    ; Close the file
    mov rdi, rbx
    call fclose

    ; List all activities for the specified day (DiaIng)
    lea rdi, [DiaIng]
    movzx eax, word [rdi]
    lea rdi, [days]
    mov ecx, 7
.list_day_index_loop:
    cmp eax, word [rdi]
    je .found_list_day_index
    add rdi, 2
    loop .list_day_index_loop
    jmp end  ; If day not found, exit
.found_list_day_index:
    sub rdi, days
    shr rdi, 1  ; rdi now contains the index of the day (0-6)

    ; Print activities
    mov ecx, 6
    mov rsi, rdi
.print_activities_loop:
    lea rdi, [C + rsi*6*200 + ecx*200]
    cmp byte [rdi], 0
    je .no_activities
    mPrintf formatActivity
    loop .print_activities_loop
    jmp end
.no_activities:
    lea rdi, [formatNoActivities]
    lea rsi, [DiaIng]
    mPrintf rdi

end:
    ; Exit program
    mov eax, 0
    ret

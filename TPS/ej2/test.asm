global main
extern puts
extern printf
extern scanf
extern sscanf


%macro mPuts 1
    mov rdi, %1
    sub rsp, 8
    call puts
    add rsp, 8
%endmacro

%macro mScanf 2
    mov rdi, %1
    mov rsi, %2
    sub rsp, 8
    call scanf
    add rsp, 8
%endmacro

%macro mPrintf 1
    mov rdi, %1
    sub rsp, 8
    call printf
    add rsp, 8
%endmacro

section .data
    ; Mensajes
    msgNombre           db  "Ingrese su nombre: ", 0
    msgApellido         db  "Ingrese su apellido: ", 0
    msgPadron           db  "Ingrese su numero de padron: ", 0
    msgFechaNac         db  "Ingrese su año de nacimiento (dd/mm/yyyy): ", 0
    msgOutput           db  "El alumno %s %s de Padrón N° %s tiene %d años", 10, 0
    
    ;formatos
    formatoFecha        db  "%d/%d/%d", 0
    formatoString       db  "%s", 0

    ;mensajes de error
    msgErrorFormato     db  ""
    msgErrorDia         db ""
    msgErrorMes         db""
    msgErrorAnio        db ""



section .bss
    ;input
    nombre              resb 100
    apellido            resb 100
    padron              resb 20

    ;fechas
    fechaNac            resb 20
    dia                 resd 1
    mes                 resd 1
    anio                resd 1

    ;endgoal
    edad                resd 1

section .text

main:
    ; Ingreso del nombre
    mPuts msgNombre
    mScanf formatoString, nombre

    ; Ingreso del apellido
    mPuts msgApellido
    mScanf formatoString, apellido

    ; Ingreso del numero de padron
    mPuts msgPadron
    mScanf formatoString, padron

    ; Ingreso de la fecha de nacimiento
input_fecha:
    mPuts msgFechaNac
    mScanf formatoString, fechaNac 
    

    ; Parsear la fecha de nacimiento
    mov rdi, formatoFecha
    mov rsi, fechaNac
    mov rdx, dia
    mov rcx, mes
    mov r8, anio
    sub rsp, 8             ; Alinear la pila
    call sscanf
    add rsp, 8             ; Restaurar la pila


    ; Validar el formato de la fecha ingresada
    cmp dword [anio], 0
    je error_formato
    cmp dword [mes], 0
    je error_formato
    cmp dword [dia], 0
    je error_formato

    ; Verificar que el día esté en el rango válido (1-31)
    cmp dword [dia], 1
    jl error_dia
    cmp dword [dia], 31
    jg error_dia

    ; Verificar que el mes esté en el rango válido (1-12)
    cmp dword [mes], 1
    jl error_mes
    cmp dword [mes], 12
    jg error_mes

    ; Verificar que el año sea mayor que 0 (no permitir años negativos)
    cmp dword [anio], 0
    jle error_anio




    ; Calcular la edad (2024 - año de nacimiento)
    mov eax, 2024                           ; Obtener el año actual (2024)
    sub eax, dword [anio]                   ; Restar el año de nacimiento al año actual
    mov [edad], eax                         ; Guardar el resultado en la variable edad


    

    ; Imprimir el mensaje final
    mov rdi, msgOutput
    mov rsi, nombre
    mov rdx, apellido
    mov rcx, padron
    mov r8d, [edad]
    sub rsp, 8             ; Alinear la pila
    call printf
    add rsp, 8             ; Restaurar la pila

    ; Salir del programa
    mov eax, 60            ; syscall: exit
    xor edi, edi           ; status: 0
    syscall

error_formato:
    mPuts msgErrorFormato
    jmp input_fecha

error_dia:
    mPuts msgErrorDia
    jmp input_fecha

error_mes:
    mPuts msgErrorMes
    jmp input_fecha

error_anio:
    mPuts msgErrorAnio
    jmp input_fecha

global main
extern printf
extern fgets
extern puts
extern sscanf

section .data
    msgNombre           db  "Ingrese su nombre: ", 0
    msgApellido         db  "Ingrese su apellido: ", 0
    msgPadron           db  "Ingrese su numero de padron: ", 0
    msgFechaNac         db  "Ingrese su fecha de nacimiento (dd/mm/yyyy): ", 0
    msgOutput           db  "El alumno %s %s de Padrón N° %s tiene %d años", 10, 0
    formatoFecha        db  "%d/%d/%d", 0
    fmtString           db  "%s", 0

section .bss
    nombre              resb 100
    apellido            resb 100
    padron              resb 20
    fechaNac            resb 20
    dia                 resd 1
    mes                 resd 1
    anio                resd 1
    edad                resd 1

section .text

main:
    ; Alineamos el stack al llamar a las funciones externas
    sub rsp, 8

    ; Ingreso del nombre
    mov rdi, msgNombre
    call puts
    mov rdi, nombre
    mov rsi, 100
    call my_fgets

    ; Ingreso del apellido
    mov rdi, msgApellido
    call puts
    mov rdi, apellido
    mov rsi, 100
    call my_fgets

    ; Ingreso del numero de padron
    mov rdi, msgPadron
    call puts
    mov rdi, padron
    mov rsi, 20
    call my_fgets

    ; Ingreso de la fecha de nacimiento
    mov rdi, msgFechaNac
    call puts
    mov rdi, fechaNac
    mov rsi, 20
    call my_fgets

    ; Parsear la fecha de nacimiento
    mov rdi, formatoFecha
    mov rsi, fechaNac
    mov rdx, dia
    mov rcx, mes
    mov r8, anio
    call sscanf

    ; Calcular la edad (asumimos año actual 2024, sin considerar el mes y día exactos para simplicidad)
    mov eax, 2024
    sub eax, dword [anio]
    mov [edad], eax

    ; Imprimir el mensaje final
    mov rdi, msgOutput
    mov rsi, nombre
    mov rdx, apellido
    mov rcx, padron
    mov r8d, [edad]
    call printf

    ; Restaurar el stack y salir del programa
    add rsp, 8
    mov eax, 60         ; syscall: exit
    xor edi, edi        ; status: 0
    syscall

my_fgets:
    ; Guardar registros no volátiles
    push rbx
    push rbp

    ; Preparar los parámetros para fgets
    mov rbx, rdi        ; Guardar el primer parámetro (buffer) en rbx
    mov rdi, rsi        ; Mover el tamaño del buffer al primer parámetro de fgets
    mov rsi, rbx        ; Mover el buffer al segundo parámetro de fgets
    mov rdx, 0          ; Usar 0 para la entrada estándar

    ; Llamar a fgets
    call fgets

    ; Restaurar registros no volátiles y volver
    pop rbp
    pop rbx
    ret

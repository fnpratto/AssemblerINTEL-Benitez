global main
extern printf
extern fgets
extern puts
extern sscanf
extern stdin

%macro my_fgets 2
    sub rsp, 8               ; Alinear la pila
    mov rdi, %1              ; Primer parámetro: buffer
    mov rsi, %2              ; Segundo parámetro: tamaño del buffer
    mov rdx, stdin           ; Tercer parámetro: entrada estándar (stdin)
    call fgets               ; Llamar a fgets
    add rsp, 8               ; Restaurar la pila
%endmacro

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
    ; Ingreso del nombre
    mov rdi, msgNombre
    call puts
    my_fgets nombre, 100

    ; Ingreso del apellido
    mov rdi, msgApellido
    call puts
    my_fgets apellido, 100

    ; Ingreso del numero de padron
    mov rdi, msgPadron
    call puts
    my_fgets padron, 20

    ; Ingreso de la fecha de nacimiento
    mov rdi, msgFechaNac
    call puts
    my_fgets fechaNac, 20

    ; Parsear la fecha de nacimiento
    sub rsp, 8            ; Alinear la pila para sscanf
    mov rdi, formatoFecha
    mov rsi, fechaNac
    mov rdx, dia
    mov rcx, mes
    mov r8, anio
    call sscanf
    add rsp, 8            ; Restaurar la pila

    ; Calcular la edad (asumimos año actual 2024, sin considerar el mes y día exactos para simplicidad)
    mov eax, 2024
    sub eax, dword [anio]
    mov [edad], eax

    ; Imprimir el mensaje final
    sub rsp, 8            ; Alinear la pila para printf
    mov rdi, msgOutput
    mov rsi, nombre
    mov rdx, apellido
    mov rcx, padron
    mov r8d, [edad]
    call printf
    add rsp, 8            ; Restaurar la pila

    ; Salir del programa
    mov eax, 60           ; syscall: exit
    xor edi, edi          ; status: 0
    syscall

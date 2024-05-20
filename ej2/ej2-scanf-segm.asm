
global main
extern puts
extern printf
extern scanf

%macro mPuts 0
    sub     rsp,8
    call    puts
    add     rsp,8
%endmacro

%macro mScanf 0
    sub     rsp,8
    call    scanf
    add    rsp,8
%endmacro

%macro mPrintf 0
    sub     rsp,8
    call    printf
    add     rsp,8
%endmacro


section .data
    msgNombre           db  "Ingrese su nombre: ", 0
    msgApellido         db  "Ingrese su apellido: ", 0
    msgPadron           db  "Ingrese su numero de padron: ", 0
    msgFechaNac         db  "Ingrese su fecha de nacimiento (dd/mm/yyyy): ", 0
    msgOutput           db  "El alumno %s %s de Padrón N° %s tiene %d años", 10, 0
    formatoFecha        db  "%d/%d/%d", 0

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
    mPuts
    mov rdi, nombre
    mov rsi, nombre
    mov rdx, 100
    mScanf
    

    ; Ingreso del apellido
    mov rdi, msgApellido
    mPuts
    mov rdi, apellido
    mov rsi, apellido
    mov rdx, 100
    mScanf
    

    ; Ingreso del numero de padron
    mov rdi, msgPadron
    mPuts
    mov rdi, padron
    mov rsi, padron
    mov rdx, 20
    mScanf
    

    ; Ingreso de la fecha de nacimiento
    mov rdi, msgFechaNac
    mPuts
    mov rdi, fechaNac
    mov rsi, fechaNac
    mov rdx, 20
    mScanf
    

    ; Parsear la fecha de nacimiento
    mov rdi, formatoFecha
    mov rsi, fechaNac
    mov rdx, dia
    mov rcx, mes
    mov r8, anio
    mScanf
    

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
    mPrintf

    ; Salir del programa
    mov eax, 60         ; syscall: exit
    xor edi, edi        ; status: 0
    syscall

; 1 .	Escribir un programa que imprima por pantalla “Organización del Computador”.
;
; 2.	Realizar un programa en assembler Intel x86 que imprima por pantalla la siguiente frase: “El alumno [Nombre] [Apellido] de Padrón N° [Padrón] tiene [Edad] años para esto se debe solicitar previamente el ingreso por teclado de: 
;•	Nombre y Apellido
;•	N° de Padrón
;•	Fecha de nacimiento#

%define ACTUALYEAR 2024

%macro mPuts 0
    sub     rsp,8
    call    puts
    add     rsp,8
%endmacro

%macro mGets 0
    sub     rsp,8
    call    gets
    add    rsp,8
%endmacro

%macro mScanf 0
    sub     rsp,8
    call    scanf
    add     rsp,8
%endmacro

%macro mPrintf 0
    sub     rsp,8
    call    printf
    add     rsp,8
%endmacro

global main
extern puts
extern scanf
extern gets
extern printf

section     .data
    msgInText       db  "Organización del Computador",0
    msgPregunta     db  "Ingrese sus datos",0
    msgNombre       db  "Ingrese su nombre y apellido: ",0
    msgPadron       db  "Ingrese su número de padrón: ",0
    msgFecha        db  "Ingrese su fecha de nacimiento: ",0
    msgResultado    db  "El alumno %s de Padrón N° %s tiene %i ,%d, %i",10,0
    year_actual     dd  2024
    formato_year db " %d", 0

section     .bss
    nombre_apellido           resb 500
    num_padron                resb 500   
    nacimiento                resb 4  
    edad                      resq 4

section     .text
main:
    mov     rdi,msgInText
    mPuts

    mov     rdi,msgPregunta
    mPuts

    mov     rdi,msgNombre
    mPuts

    mov     rdi,nombre_apellido
    mGets

    mov     rdi,msgPadron
    mPuts

    mov     rdi,num_padron
    mGets

    mov     rdi,msgFecha
    mPuts

    mov     rdi,formato_year
    mov     rsi,nacimiento
    mScanf

    mov     rax,[year_actual]
    sub     rax,[nacimiento]
    mov     [edad],rax

    mov     rdi,msgResultado
    mov     rsi,nombre_apellido
    mov     rdx,num_padron
    mov     rcx,[edad]
    mov     r8, [nacimiento]
    mov     r9, [year_actual]
    mPrintf

    ret

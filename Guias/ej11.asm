;11. Realizar una rutina interna que reciba como parámetro un campo DIA 
;en formato de caracteres de 2 bytes y devuelva en un campo resultado RESULT 
;en formato carácter de 1 byte, indicando una ‘S’ en caso que el día sea válido, 
;y en caso contrario una ‘N’.
;Los valores válidos son LU, MA, MI, JU, VI, SA, DO.

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

%macro mPrintf 0
    sub     rsp,8
    call    printf
    add     rsp,8
%endmacro

global main
extern puts
extern gets
extern printf

section .data

    mensajeVal db '', 0
    mensajeNoVal db '', 0
    diasValidos db "LU", "MA", "MI", "JU", "VI", "SA", "DO" 
    lenghDiasValidos dq 7  
    validMessage db "Dia valido", 0
    invalidMessage db "Dia no valido", 0
    DIA1 db "LU"
    DIA2 db "MA"
    DIA3 db "MI"
    DIA4 db "MO"

section .bss
    RESULT resb 1 

section     .text
main:



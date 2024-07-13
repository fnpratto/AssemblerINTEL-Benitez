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
    DIA resb 2

section     .text
main:
     ; Leer el día desde el usuario
    lea rdi, [DIA]
    mGets

    ; Quitar el salto de línea si lo hay
    mov rax, [DIA]
    and rax, 0xFFFF ;Como resultado, esta operación preserva solo los primeros 16 bits del registro rax y establece los bits restantes en 0.
    ;cmp rax, 0x0A0A;La comparación determina si los primeros 2 bytes de DIA son 0x0A0A, lo que significaría que DIA contiene dos caracteres de nueva línea consecutivos.
    je invalidDay

    lea rdi, [DIA]
    lea rsi, [RESULT]
    call validarDia


    movzx rdi, byte [RESULT]
    cmp rdi, 'S'
    je printValid
    jmp printInvalid

printValid:
    lea rdi, [validMessage]
    mPuts
    jmp end

printInvalid:
    lea rdi, [invalidMessage]
    mPuts

end:
    mov eax, 0
    ret

validarDia:
    mov rcx, 7
    lea rdx, [diasValidos]

loop:
    cmp rcx, 0
    je notFound

    ; Comparar los primeros dos bytes
    movzx rax, word [rdi] ; movzx rax, word [rdi]: This instruction loads a 16-bit word from the memory address 
    ;pointed to by rdi into the rax register, zero-extending it to 64 bits. This means the upper bits of rax will be cleared.
    cmp ax, word [rdx]
    je found

    ; avanzar 
    add rdx, 2
    dec rcx
    jmp loop

found:
    mov byte [RESULT], 'S'
    mov rsi, 'S'
    mPuts
    jmp printValid

notFound:
    mov byte [RESULT], 'N'
    mov rsi, 'N'
    mPuts
    jmp printInvalid

invalidDay:
    mov byte [RESULT], 'N'
    jmp printInvalid



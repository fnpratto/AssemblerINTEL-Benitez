;13.	Se tiene una fecha en formato carácter DD/MM/AAAA 
;se pide realizar una rutina interna que realice la validación 
;dejando en el campo RESULT de 1 byte una 'S' si es válida o una 'N' 
;en caso contrario.



%macro mPuts 0
    sub     rsp,8
    call    puts
    add     rsp,8
%endmacro

%macro mScanf 0
    sub     rsp,8
    call    scanf
    add     rsp,8
%endmacro

%macro mSscanf 0
    sub     rsp,8
    call    sscanf
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
extern sscanf

section .data
    valid_date db 'S'
    invalid_date db 'N'
    validMessage db "Fecha valida", 0
    invalidMessage db "Fecha no valida", 0
    formatoPrint db "%d%d", 0
    date_format db "%d/%d/%d", 0
    DATE dd "04/04/2004",0

section .bss
    RESULT resb 1
    dia resb 2
    mes resb 2
    year resb 2

section .text
main:
    ; Parse the date
    lea rdi, [DATE]
    lea rsi, [date_format]
    lea rdx, [dia]
    lea rcx, [mes]
    lea r8, word[year]
    call mSscanf
    ; sscanf(DATE, date_format, &day, &month, &year);

validarFecha:
    xor rax, rax
    mov ax, [dia]
    cmp ax, 1
    jl printInvalid
    cmp ax, 31
    jg printInvalid

    mov ax, [mes]
    cmp ax, 1
    jl printInvalid
    cmp ax, 12
    jg printInvalid

    ; For the year, you can add specific range checks if necessary
    mov ax,[year]
    cmp eax, 0    ; example range start
    jl printInvalid
    ; cmp eax, 9999    ; example range end
    ; jg printInvalid

printValid:
    lea rdi, [validMessage]
    mPuts
    mov byte [RESULT], 'S'
    jmp end

printInvalid:
    lea rdi, [invalidMessage]
    mPuts
    mov byte [RESULT], 'N'

end:
    mov eax, 0
    ret
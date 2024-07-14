;12.	Realizar una rutina interna que reciba como parámetro un campo MES 
;       en formato BPF c/s 
;       de 8 bits y devuelva en un campo resultado RESULT en formato 
;       carácter de 1 byte, indicando una ‘S’ en
; caso que el valor del mes sea válido, y en caso contrario una ‘N’.


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
extern scanf

section .data

    valid_month db 'S'
    invalid_month db 'N'
    validMessage db "Mes valido", 0
    invalidMessage db "Mes no valido", 0
    formatoPrint db "%hhi"
    msgSuma     db "Es %hhi",10,0 

section .bss
    RESULT resb 1
    MES resb 1

section     .text
main:
    xor rsi,rsi
    mov rdi , formatoPrint
    lea rsi , [MES]
    mScanf

    xor rsi,rsi
    mov rdi, msgSuma
    mov sil , [MES]
    mPrintf

    xor rax, rax  
validarMes:
    mov al, [MES]
    cmp al, 1
    jl printInvalid       
    cmp al, 12
    jg printInvalid        

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

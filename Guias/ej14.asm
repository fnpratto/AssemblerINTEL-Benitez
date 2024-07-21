;14.	Realizar una rutina interna que reciba como parámetros las direcciones 
;(DIR1 y DIR2) de dos campos hexadecimales de 2 bytes de longitud cada uno y 
;realice la suma de ambos (en BPF s/signo de 16 bits) dejando 
;el resultado en el campo resultado RESULT en formato BPF c/s 16 bits.

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
    DIR1 dw 1234    
    DIR2 dw 5678     
    resultMsg db "Resultado: %hi", 0

section .bss
    RESULT resw 1  ; 2 bytes for the result

section .text
main:
    movzx rax, word[DIR1]
    movzx rbx, word[DIR2]

    add rax, rbx
    
    mov [RESULT], ax

    xor rsi,rsi
    mov rdi, resultMsg
    mov rsi, [RESULT]
    mPrintf

    mov eax, 0
    ret
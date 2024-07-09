;6.	Dado un vector de 30 números decimales (positivos/negativos) se pide escribir 
;un programa que invierta el vector, es decir, el último elemento queda en el primer lugar, el anteúltimo en el segundo, etc.



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

section     .data
    vectorDecimales dd  1,2,3,4,5,6,2,2,8,2,2,2,9,2,2,1,2,1,2,1
    lengthVector    dq  19
    counterNum      dq   0
    msgReversedVector     db "Vector invertido : ",10,0  ; 10 es \n (+aestetic)
    formatoReversedVector db " %d"

section     .bss
    reversedVector  resd 200

section     .text
main:
    mov rsi , [lengthVector]
    mov rdi,0                    ;para q apunte al primer caracter de resersedText

charCopy:                   ;chequeando condicion de fin
    mov     eax,dword[vectorDecimales+rsi*4] 
    mov     dword[reversedVector+rdi*4],eax  
    
    cmp     rsi, 0                     
    je      endCopy 

    inc     rdi
    dec     rsi
    jmp     charCopy

endCopy:
;imprimo vector invertido
    mov rdi, msgReversedVector
    mPuts

    mov qword[counterNum] , 0
imprimirVector:
    mov r9, [counterNum]  
    mov rdi , formatoReversedVector
    mov rsi, [reversedVector+r9*4]
    mPrintf

    mov r9, [counterNum]                     ; veo si el caracter corriente es igual al ingresado por teclado
    add qword[counterNum],1 
    mov r8 , [lengthVector]
    cmp r9 ,r8
    jne imprimirVector

salir:
    ret
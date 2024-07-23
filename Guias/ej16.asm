;16. Se tiene el campo NUM que corresponde a un número almacenado 
;como BPF c/s16 bits en memoria. Se pide realizar un programa necesario 
;para rebatir los bits que componen al número e imprimir el número en configuración 
;binaria por pantalla. (Rebatir significa poner el 1er. bit del número en el lugar 
;del último, el 2do. en el anteúltimo y así sucesivamente)

section .data
    NUM db 1,0,0,1,0,0,1,1,0,0,1,1,0,1,0,1  ; Número de ejemplo de 16 bits
    lenght dq  16
    counterNum  dq   0
    format db "Reversed bits:", 0  ; Cadena de formato para printf
    formatoReversedVector db "%hhi"

section .bss
    reversedVector resb 16

section .text
global main
extern printf, puts

%macro mPrintf 0
    sub rsp, 8
    call printf
    add rsp, 8
%endmacro

%macro mPuts 0
    sub rsp, 8
    call puts
    add rsp, 8
%endmacro


main:

    mov rsi , [lenght]
    mov rdi,0                    

numCopy:                  
    mov     al,byte[NUM+rsi] 
    mov     byte[reversedVector+rdi],al  
    
    cmp     rsi, 0                     
    je      endCopy 

    inc     rdi
    dec     rsi
    jmp     numCopy

endCopy:
;imprimo vector invertido
    mov rdi, format
    mPuts

    mov qword[counterNum] , 1
imprimirVector:
    mov r9, [counterNum]  
    mov rdi , formatoReversedVector
    mov rsi, [reversedVector+r9]
    mPrintf

    mov r9, [counterNum]                     
    add qword[counterNum],1 
    mov r8 , [lenght]
    cmp r9 ,r8
    jne imprimirVector

salir:
    ret
;***********************************************************************************
; Ingresar por teclado un texto y luego un caracter e imprimir por pantalla:
;    - El texto de forma invertida
;    - La cantidad de apariciones del caracter en el texto
;    - El porcentaje de esas apariciones respecto de la longitud total del texto
;*******************************************************************************

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
    msgInText       db  "Ingrese un texto por teclado (max 99 caracters)",0
    msgInChar       db  "Ingrese un caracter",0
    textLenght      dq   0
    counterChar     dq   0
    msgReversedText     db "Texto invertido: %s",10,0  ; 10 es \n (+aestetic)

section     .bss
    text            resb 500
    char            resb 50
    reversedText    resb 500

section     .text
main:
; muestro texto 
    mov     rdi,msgInText
    mPuts

; ingreso texto
    mov     rdi,text
    mGets

; muestro texto 
    mov     rdi,msgInChar
    mPuts

; ingreso caracter
    mov     rdi,char
    mGets

    mov     rsi,0

nextCharFindLast:
    cmp     byte[text+rsi],0        ; Fin de string?
    je      endString
    inc     rsi
    jmp     nextCharFindLast

endString:
    mov    rdi,0                    ;para q apunte al primer caracter de resersedText
    mov    [textLenght],rsi

charCopy:
    cmp     rsi, 0                  ;ver si termino el recorrido de atras para adelante
    je      endCopy                 ;chequeando condicion de fin
    mov     al,[text+rsi-1]         ; copia el char corriente al registro pivote al
    mov     [reversedText+rdi],al   ; copia del char corriente en la siguiente posicion de reserserdText

    cmp     al,[char]               ; veo si el caracter corriente es igual al ingresado por teclado
    jne     movePointers
    add     qword[counterChar],1    ;Sumo uno al contador del caracter-idem inc 

movePointers:
    inc     rdi
    dec     rsi
    jmp     charCopy

endCopy:
    mov     byte[reversedText+rdi],0 ;rdi es el que estoy incrementando

;imprimo texto invertido
    mov     rdi,msgReversedText
    mov     rsi,reversedText
    mPrintf

    ret
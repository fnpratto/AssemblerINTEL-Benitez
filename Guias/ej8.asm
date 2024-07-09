;8.	Dada una matriz de 4x4 de números almacenados en BPF c/s de 16 bits, 
;calcule la diagonal inversa e imprimirla por pantalla.



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
    matriz dw 01,02,03,01 ; long es 48 bits 6 bytes
		   dw 06,11,01,06
		   dw 11,01,21,08
           dw 01,12,21,08

    sumaTotal    dw  0
    longFila     dw 8
    longElemento dw 2
    msgSuma     db "La suma da : %hi",10,0 

section     .bss
    posx    resw 1
    posy    resw 1

section     .text
main:
    mov word[posx],3
    mov word[posy],0

    xor rax, rax    
    xor rcx, rcx 

sumar_diagonal:             
    mov ax, word[posx]
    imul word[longFila]
    mov cx,ax

    mov ax, word[posy]
    imul word[longElemento]

    add ax, cx

    mov r9w, word[matriz+rax]
    mov r8w, [sumaTotal]
    add r9w,r8w
    mov [sumaTotal], r9w
    
    dec word[posx]
    inc word[posy]

    mov ax, [posx]
    cmp ax, -1 
    je fin
    jmp sumar_diagonal

fin:
    xor rsi,rsi
    mov rdi , msgSuma
    mov si, [sumaTotal]
    mPrintf
    ret


    
    


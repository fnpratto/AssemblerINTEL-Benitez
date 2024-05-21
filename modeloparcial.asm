global main
extern puts

section .data
    t       db "ABCDEFGH", "IJKLMNOP" , "QSRTUVWX" , 0
    code    db 40
    desplaz db 0

section .bss
section .text

main:
    mov        rax,3
    mov        rbx,2

    dec         rax   ; 3-1
    imul        rax,8 ; 2*8


    sub        rbx,1 ; 2- x = 1
    imul       rbx,4 ; 1*4    

    add         rbx,rax ; 16+4= 20
    lea         r8,[t]  ; carga pointer a t
    add         r8,rbx  ; pointer le sumo 20 --> queda en T


    mov         rdi,r8 ; puts rdi
    sub         rsp,8
    call        puts
    add         rsp,8


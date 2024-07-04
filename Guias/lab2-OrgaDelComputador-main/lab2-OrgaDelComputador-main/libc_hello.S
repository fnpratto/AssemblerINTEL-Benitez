.globl main

main:
        // Call convention: arguments on the stack (reverse order).
        push $msg
        call strlen

        movl %eax, %esi

        push %esi
        push $msg
        push $1

        push $.posicion_retorno
        jmp write

.posicion_retorno:
        push $7
        call _exit


.data
msg:
        .asciz "Hello, world!\n"
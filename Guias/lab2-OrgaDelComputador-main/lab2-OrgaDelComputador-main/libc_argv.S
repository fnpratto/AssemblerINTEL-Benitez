.globl main
main:
	push %ebp
        movl %esp, %ebp

        movl 12(%ebp), %edi
        movl $1, %esi
        movl (%edi, %esi, 4), %edi

        push %edi
        call strlen
        movl %eax, %esi

	push %esi
        push %edi
        push $1
        call write

        push $1
        push $newline
        push $1
        call write

        movl %ebp, %esp
        popl %ebp

        push %esi
        call _exit

.data
newline:
        .ascii "\n"
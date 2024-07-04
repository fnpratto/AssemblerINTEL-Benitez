.globl main
main:
		push %ebp
		movl %esp, %ebp

		movl 8(%ebp), %esi
		movl 12(%ebp), %edi
		cmpl $1, %esi
		je .exit

		xor %ebx, %ebx
		movl $1, %ebx
.loop:
		push (%edi, %ebx, 4)
		call puts
		add $1, %ebx
		cmpl %esi, %ebx
		jne .loop

.exit:
		add $-1, %esi
        mov %esi, %eax
        movl %ebp, %esp
		popl %ebp
        ret
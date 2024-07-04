#include <sys/syscall.h>

.globl _start
_start:
	movl 8(%esp), %edi

	push %edi
	call strlen
	movl %eax, %esi

	movl $('\n'), (%edi, %esi, 1)

	add $1, %esi

	mov $SYS_write, %eax
        movl $1, %ebx
        movl %edi, %ecx
        movl %esi, %edx
        int $0x80

        add $-1, %esi

        mov $SYS_exit, %eax
        movl %esi, %ebx
        int $0x80
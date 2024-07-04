.globl main
main:
		push %ebp
		movl %esp, %ebp

		push $msg
		call puts

        mov $7, %eax
        movl %ebp, %esp
		popl %ebp
        ret

.data
msg:
        .ascii "Hello, world!\n"
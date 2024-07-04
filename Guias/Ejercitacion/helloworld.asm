global main
extern puts

section .data
	mensaje db "Hello World",0

section .bss

section.text

main:
	
	mov rdi, mensaje
	call puts

	ret
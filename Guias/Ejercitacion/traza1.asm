global main
extern printf


section .data

	matriz dw 01,11,01
		   dw 00,03,00
		   dw 00,00,01


	dimensionMatriz dq 3
	traza dq 0

	fila dq 1
	columna dq 1

	mensajePrintf dw "La traza es: %hi",10,0



section .text

main:

	call calcularTraza
	sub rsp, 8
	mov rax, 0
	mov rdi, mensajePrintf
	mov rsi, [traza]
	call printf
	add rsp, 8

	ret


calcularTraza:

	mov rax, [fila]
	dec rax
	imul rax, 6
	mov rbx, rax

	mov rax, [columna]
	dec rax
	imul rax, 2

	add rbx, rax

	mov ax, [matriz + rbx]
	cwde
	cdqe

	add qword[traza], rax

	inc qword[fila]
	inc qword[columna]

	cmp qword[fila], 4
	jl calcularTraza

	ret
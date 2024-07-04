global main
extern printf



section .data

	matriz dw 01,02,03,04,05
		   dw 06,07,08,09,10
		   dw 11,12,13,14,15
		   dw 16,17,18,19,20
		   dw 21,22,23,24,25

	fila dq 0
	columna dq 0
	elemento dq 0

	formatoPrintf dw "El elemento es el: %hi",10,0



section .text

main:

	mov qword[fila], 1
	mov qword[columna], 5

	call getElemento

	mov rdi, formatoPrintf
	mov rsi, [elemento]
	sub rsp, 8
	mov rax, 0
	call printf
	add rsp, 8


	ret

getElemento:

	mov rax, [fila]
	dec rax
	imul rax, 10

	mov rbx, rax

	mov rax, [columna]
	dec rax
	imul rax, 2

	add rbx, rax

	mov ax, [matriz + rbx]
	cwde
	cdqe



	mov qword[elemento], rax



	ret


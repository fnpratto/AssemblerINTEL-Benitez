global main
extern puts


section .data

	mensajeValido dw "El dia es valido", 0
	mensajeInvalido dw "El dia es invalido", 0

	diasSemana dw "LUMAMIJUVISADO"
	dia dw "DO"

	numeroDia dq 1
	diaValido dw "N"


section .text

main:
	sub rsp, 8
	call validarDia


	cmp qword[diaValido], "S"
	je imprimirCorrecto

	mov rdi, mensajeInvalido
	call puts

endProg:

	add rsp, 8
	ret

imprimirCorrecto:

	mov rdi, mensajeValido
	call puts

	jmp endProg


validarDia:

	mov rax, [numeroDia]
	dec rax
	imul rax, 2

	add rax, diasSemana

	mov rcx, 2
	mov rdi, rax
	mov rsi, dia
	repe cmpsb

	je diaCorrecto

	inc qword[numeroDia]

	cmp qword[numeroDia], 8
	jl validarDia

	mov qword[diaValido], "N"
	jmp endValidar

diaCorrecto:

	mov qword[diaValido], "S"

endValidar:

	ret





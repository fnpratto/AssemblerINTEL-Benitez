global main
extern puts
extern scanf
extern printf

section .data

	ingresoNumero db "Ingrese un numero: ", 0
	formatoScanf db "%i", 0
	textoResultado db "El resultado es %i", 0
	mensajeDebug db "Llegue"


section .bss

	base     resb 4
	potencia resb 4
	resultadoParcial resb 4


section .text:

main:
	
	sub rsp, 8

	mov rdi, ingresoNumero
	call puts

	mov rdi, formatoScanf
	mov rsi, base
	call scanf

	mov rdi, ingresoNumero
	call puts

	mov rdi, formatoScanf
	mov rsi, potencia
	call scanf


	cmp byte[potencia], 0
	je potenciaCero
	jg potenciaPositiva



end:

	add rsp, 8

	ret


potenciaCero:

	
	mov rdi, textoResultado
	mov rsi, 0
	call printf

	jmp end


potenciaPositiva:

	mov rdi, [base]
    cmp byte[potencia], 1
    je finPot 

    mov rcx, [potencia]
    sub rcx, 1

rotulo:

    imul rdi, qword[base]
   	loop rotulo

finPot:

	mov rsi, rdi
	mov rdi, textoResultado
	
	call printf
	jmp end



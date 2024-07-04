;###################################################################
; Dada una matriz de 5x5, calcular si es triangular superior       #
;###################################################################

global main
extern puts
extern printf


section .data

	matriz   dw 11,00,00,00,00
	         dw 12,13,00,00,00
	         dw 14,11,01,00,00
	         dw 11,12,13,14,01
	         dw 11,12,13,14,15


	msjTriangularSuperior dw "La matriz es triangular superior", 0
	msjNoEsTriangular     dw "La matriz no es triangular", 0

	iteracionesColumna dq 1
	iteracionesFila dq 5

	fila        dq 1
	columna     dq 2
	columnaActual dq 2
	filaActual dq 1


section .text

main:

	sub rsp, 8

esTriangularSuperior:
	
	mov rax, 5
	sub rax, qword[filaActual]
	mov qword[iteracionesColumna], rax

moverColumna:
	
	mov		rax,[fila]			
	dec		rax						
	imul	rax,2	
	imul	rax,5	

	mov		rbx,rax				
	mov		rax,[columna]			
	dec		rax						
	imul	rax,2	
	add		rbx,rax				

	mov 	ax, word[matriz + rbx]
	cwde
	cdqe

	cmp 	rax, 0
	jne 	noEsTriangular

	dec 	qword[iteracionesColumna]
	add 	qword[columna], 1
	
	cmp 	qword[iteracionesColumna], 0
	jg 		moverColumna 


	mov 	rax, qword[columnaActual]
	inc 	rax
	mov 	qword[columna], rax

	inc 	qword[filaActual]
	inc 	qword[fila]
	dec 	qword[iteracionesFila]
	
	cmp 	qword[iteracionesFila], 0
	jg 		esTriangularSuperior

	jmp 	endProg

noEsTriangular:

	mov 	rdi, msjNoEsTriangular
	call 	puts

endProg:

	add 	rsp, 8
	ret






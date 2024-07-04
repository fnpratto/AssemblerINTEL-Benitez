;*******************************************************************************
; Dado un vector vecNum, se invierte sus contenidos dentro de vecInvert		   *
;*******************************************************************************


global 	main
extern 	printf

section	.data
	msgSal			db	'Elementos guardados en posicion %i: %i',10,13,0

	vecNum			dw	1,2,3,4,5,6,7,8,9
	vecInvert       dw  0,0,0,0,0,0,0,0,0
	
	posicion		dq	8
	posicionEnInvertido dq 1
	cantLoop        dq  9

section	.text
main:

	sub  rsp,8

rotulo:

	mov		rcx,[posicion]								;rcx = posicion
	dec		rcx							                ;(posicion-1)
	imul	ebx,ecx,2				                    ;(posicion-1)*longElem

	mov		ax,[vecNum+ebx]	                            ;ax = elemento (2 bytes / word)

	mov		rcx,[posicionEnInvertido]	                ;rcx = posicion
	dec		rcx							                ;(posicion-1)
	imul	ebx,ecx,2				                    ;(posicion-1)*longElem	
	mov     [vecInvert + ebx], ax


	
	
	dec qword[posicion]
	dec qword[cantLoop]
	inc qword[posicionEnInvertido]
	cmp qword[cantLoop], 0
	jg rotulo



	mov qword[cantLoop], 9
	mov qword[posicion], 0

loopImpresion:

	mov rcx, [posicion]
	dec rcx
	imul ebx,ecx,2

	mov ax, [vecInvert + ebx]
	cwde
	cdqe

	mov rdi, msgSal
	mov rsi, [posicion]
	mov rdx, rax
	call printf

	dec qword[cantLoop]
	inc qword[posicion]

	cmp qword[cantLoop], 0
	jg loopImpresion



fin:
	add  rsp,8
	ret

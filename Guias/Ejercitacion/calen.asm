global 	main
extern 	printf
extern	gets
extern 	sscanf
extern	fopen
extern	fread
extern	fclose


section .data

	matriz times 42 dw 0

	finLeerArch  dw "Fin de lectura del archivo", 0

	dias					dw	"DOLUMAMIJUVISA"

	fileName db "CALEN.dat", 0
	mode db "rb", 0
	msjErrorAbrir dw "Error al abrir el archivo", 0

	registro times 0 db ""
		dia times 2 db ""
		semana  db 0
		desc times 20 db ""

	msgSemana				db	'Ingrese la semana [1..6]: ',10,13,0
	msgEnc					db	'Dia      - Cant.Act',10,13,0

	diasImp					db	"Domingo       ",0
							db	"Lunes         ",0
							db  "Martes        ",0
							db  "Miercoles     ",0
							db  "Jueves        ",0
							db  "Viernes       ",0
							db  "Sabado        ",0

	msgCant					db	'%d',10,13,0

	numFormat				db	'%i'	;%i 32 bits / %lli 64 bits

section  .bss
	fileHandle	resq	1
	esValid		resb	1
	contador	resq	1
	diabin		resb	1
	nroIng		resd	1
	; deplazamiento de una matriz
	; (col - 1) * L + (fil - 1) * L * cant. cols

	buffer		resb	10


section .text

main:

	call abrirArch
	cmp qword[fileHandle], 0
	jle errorAbrirArch

	call leerArch
	call listar

endProg:

	ret  

errorAbrirArch:

	mov rdi, msjErrorAbrir
	mov rax, 0
	sub rsp, 8
	call printf
	add rsp, 8

	jmp endProg


abrirArch:

	mov rdi, fileName
	mov rsi, mode
	call fopen
	mov qword[fileHandle], rax

	ret

leerArch:

	mov rdi, registro
	mov rsi, 23
	mov rdx, 1
	mov rcx, [fileHandle]
	sub rsp, 8
	call fread
	add rsp, 8

	cmp rax, 0
	jle eof

	call VALCAL
	cmp byte[esValid], "N"
	jmp leerArch

	call sumarAct



eof:

	mov rdi, finLeerArch
	sub rsp, 8
	mov rax, 0
	call printf
	add rsp, 8

	mov rdi, [fileHandle]
	sub rsp, 8
	call fclose
	add rsp, 8

	ret


VALCAL:


	mov byte[contador], 1

validarDia:

	mov rax, [contador]
	dec rax
	imul rax, 2

	add rax, dias

	mov rcx, 2
	mov rdi, dias
	mov rsi, dia
	repe cmpsb
	je validarSemana

	inc byte[contador]
	cmp byte[contador], 8
	jl validarDia

	jmp datoInvalido

validarSemana:
	
	mov al, [contador]
	mov byte[diabin], al

	cmp byte[semana], 1
	jl datoInvalido
	cmp byte[semana], 7
	jg datoInvalido

	mov byte[esValid], "S"

endVALCAL:

	ret

datoInvalido:

	mov byte[esValid], "N"
	jmp endVALCAL

sumarAct:

	mov rax, 0
	mov rbx, 0

	sub byte[diabin], 1

	mov al, [diabin]
	mov bl, 2
	mul bl

	mov rdx, rax

	sub byte[semana], 1
	mov al, [semana]
	mov bl, 14
	mul bl

	add rdx, rax

	mov bx, word[matriz + rdx]
	inc bx
	mov word[matriz + rdx], bx

	ret

listar:

ingresoSemana:

	mov rdi, msgSemana
	sub rsp, 8
	mov rax, 0
	call printf
	add rsp, 8

	mov rdi, buffer
	sub rsp, 8
	call gets
	add rsp, 8

	mov rdi, buffer
	mov rsi, numFormat
	mov rdx, nroIng
	sub rsp, 8
	call sscanf
	add rsp, 8

	cmp rax, 1
	jl ingresoSemana

	cmp dword[nroIng], 1
	jl ingresoSemana
	cmp dword[nroIng], 6
	jg ingresoSemana

	mov rax, 0
	mov rdi, msgEnc
	sub rsp, 8
	call printf
	add rsp, 8

	mov rax, 0
	sub dword[nroIng], 1

	mov eax, [nroIng]

	mov bl, 14
	mul bl

	mov r9, rax

	mov		rcx,7
	mov		r8,0			;Utilizo r8 para desplazar dentro del vector diasImp
	mov		rbx,0			;Utilizo rbx como auxiliar para levantar cant. total actividades
mostrar:
	mov		qword[contador],rcx

	lea		rdi,[diasImp + r8]
	sub		rsp,8
	call	printf
	add		rsp,8

	mov		bx,word[matriz + r9]		; recupero la cantidad total de actividades en el dia de la matriz

	mov		rdi,msgCant			;Parametro 1: direccion de memoria de la cadena texto a imprimir
	mov		rsi,rbx				;Parametro 2: campo que se encuentra en el formato indicado q se imprime por pantalla
	sub		rsp,8
	call	printf
	add		rsp,8

	add		rdi,2			;Avanzo al próximo elemento de la fila (cada elem. es una WORD de 2 bytes)
	add		rsi,15			;Avanzo 14 + 1 bytes (1 byte de caract. especial 0 al final de cada dia)

	mov		rcx,qword[contador]
	loop	mostrar

	ret
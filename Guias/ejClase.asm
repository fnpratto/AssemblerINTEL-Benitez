; Dado un archivo en formato texto que contiene informacion sobre autos llamado listado.txt
; donde cada linea del archivo representa un registro de informacion de un auto con los campos: 
;   marca:						10 caracteres
;   modelo: 						15 caracteres
;   año de fabricacion:					4 caracteres
;   patente:						7 caracteres
;   precio:						7 caracteres
; Se pide codificar un programa en assembler intel que lea cada registro del archivo listado y guarde
; en un nuevo archivo en formato binario llamado seleccionados.dat las patentes de aquellos autos
; cuyo año de fabricación esté entre 2010 y 2019 inclusive
; Como los datos del archivo pueden ser incorrectos, se deberan validar mediante una rutina interna.
; Solamente se deberá validar Marca (que sea Fiat, Ford, Chevrolet o Peugeot) y año (que sea un valor
; numérico)



global main
extern print
extern puts
extern sscanf

extern fopen
extern fclose

extern fgets
extern fwrite



section .data
	
	datoInvalido    db "Hubo un dato invalido", 0
	mensajeErrorLis db "Hubo un error abriendo el archivo", 0
	
	
	fileListado   db "listado.txt", 0
	modeListado   db "r", 0
	handleListado dq 0

	fileSeleccion db "seleccion.dat", 0
	modeSeleccion db "a+b", 0
	handleSel     dq 0

	regListado times 0 db ""
		marca   times 10 db " "
		modelo  times 15 db " "
		anio    times 4  db " "
		patente times 7  db " "
		precio  times 7  db " "
		EOL     times 2  db " "

	vecMarcas  db "Peugot    Fiat      Ford    Chevrolet " 
	anioStr    db "****", 0
	anioFormat db "%hi", 0
	anioNum    dw 0

	patenteS times 7 db " "

section .bss
	
	plusRsp        resq 1
	datoValido     resb 1
	registroValido resb 1
	
	

section .text

main:
	

	mov rdi, fileListado
	mov rsi, modeListado
	call fopen			; abro archivo de listados
	cmp rax, 0
	jle errorOpenLis
	mov [handleListado], rax

	mov rdi, fileSeleccion
	mov rsi, modeSeleccion
	call fopen			; abro archivo de seleccion
	cmp rax, 0
	jle errorOpenSel
	mov [handleSel], rax

readListado:

	mov rdi, regListado
	mov rsi, 45
	mov rdx, 
	call fgets

	cmp rax, 0
	jle closeFiles
	
	call validarRegistro
	cmp byte[registroValido], 'N'
	je 


	mov rcx, 4
	mov rsi, anio
	mov rdi, anioStr
	rep movsb

	mov rdi, anioStr
	mov rsi, anioFormat
	rdx, anioNum
	call checkAlign
	sub rsp, [plusRsp]
	call sscanf
	add rsp, [plusRsp]

	cmp word[anioNum], 2010
	jl readListado
	cmp word[anioNum], 2019
	jg readListado

	mov rcx, 7
	mov rsi, patente
	mov rdi, patenteS
	rep movsb

	mov rdi, regSeleccion
	mov rsi, 7
	mov rdx, 1
	mov rcx, [handleSel]
	call fwrite
	
	jmp readListado


endProg:
	ret


errorOpenLis:

	mov rdi, mensajeErrorLis
	call puts
	jmp endProg

errorOpenSel:

	mov rdi, mensajeErrorLis
	call puts
	mov rdi, handleListado
	call fclose
	jmp endProg

closeFiles:

	mov rdi, handleListado
	call fclose

	mov rdi, handleSel
	call fclose

	jmp endProg

validarRegistro:
	
	mov [datoValido], 'N'

	call validarMarca
	cmp byte[datoValido], 'N'
	je finValidarRegistro 
	
	call validarAnio
	cmp [datoValido], 'N' 
	je finValidarRegistro	

	mov byte[registroValido], 'S'

	ret

validarMarca:
	
	mov byte[datoValido], 'S'
	
	mov rcx, 4       		; longitud del vector de marcas para loopear
	mov rbx, 0       		; desplazamiento dentro del vector
	
	push rcx                        ; guardo el valor de rcx del loop

	mov rcx, 10      		; cantidad de bytes a comparar
	mov rsi, marca
	lea rdi, [vecMarcas + rbx]   
	repe cmpsb

	pop rcx
	
	je marcaOk 
	add rbx, 10
	loop nextMarca

	mov byte[datoValido], 'N'
	                    	
MarcaOk:
	ret

validarAnio:

	mov byte[datoValido], 'S'

	mov rcx, 4
	mov rbx, 0

NextDigito: 	
	cmp byte[anio + rbx], '0'
	jl anioError
	cmp byte[anio + rbx], '9'
	jg anioError
	inc rbx
        loop nextDigito
	jmp anioOk

anioError:
	
	mov byte[datoValido], 'N'
	
anioOk:

	ret

finValidarRegistro:

	mov rdi, datoInvalido
	call fputs
	jmp endProg
	
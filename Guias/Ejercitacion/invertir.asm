global main
extern gets
extern puts
extern printf

section .data
	mensajeIngreso db "Ingrese un string",0
	msjLong db "La longitud es %li",10,0

section .bss

	texto resb 100
	longTexto resq 1
	textoInvertido resb 100

section .text

main:

	sub rsp, 8
	mov rdi, mensajeIngreso
	call puts

	mov rdi, texto
	call gets

	mov rsi, 0   ; uso el rsi como contador
	
verFin:
	cmp byte[texto + rsi], 0
	je finString
	inc rsi
	jmp verFin


finString:

	mov [longTexto], rsi
	mov rdi, msjLong
	call printf

	mov rdi, 0   ; uso el rdi como contador
	mov rsi, [longTexto]

verFinCopia: 

	cmp rsi, 0
	je finCopia
	mov al, [texto + rsi - 1]
	mov [textoInvertido + rdi], al
	dec rsi
	inc rdi
	jmp verFinCopia

finCopia: 

	mov byte[textoInvertido + rdi],10 ; agrego fin de linea
	mov byte[textoInvertido + rdi],0  ; agrego fin de string

	mov rdi, textoInvertido
	call puts

	add rsp, 8
	ret

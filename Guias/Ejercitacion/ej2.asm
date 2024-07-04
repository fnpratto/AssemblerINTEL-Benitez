global main
extern printf
extern puts
extern gets


section .data

	formatoPrint  db "El alumno %s de padron %s tiene %s años", 0
	ingresoNombre db "Ingrese el nombre del alumno", 0
	ingresoPadron db "Ingrese el padron", 0
	ingresoEdad   db "Ingrese la edad", 0


section .bss
	
	nombreAlumno resb 20
	padronAlumno resb 20
	edadAlumno   resb 20


section .text

main:

	sub rsp, 8
	mov rdi, ingresoNombre
	call puts

	mov rdi, nombreAlumno
	call gets

	mov rdi, ingresoPadron
	call puts

	mov rdi, padronAlumno
	call gets

	mov rdi, ingresoEdad
	call puts

	mov rdi, edadAlumno
	call gets

	mov rdi, formatoPrint
	mov rsi, nombreAlumno
	mov rdx, padronAlumno
	mov rcx, edadAlumno
	call printf

	add rsp, 8

	ret

	
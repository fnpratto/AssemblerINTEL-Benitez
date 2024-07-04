;Este es un macro que a partir del dato ingresado en el parametro 
;PrAnio define si dicho año es bisiesto, el resultado se guarda en el parametro Bisiesto
;ATENCION: El parametro PrAnio deber ser del tipo DW
global	main

extern	printf
extern	sscanf
extern	gets

section .data
    loEs       db    "es bisiesto",10,0
    noLoEs       db    "NO es bisiesto",10,0
    debug       db    "debug",10,0
    PrAnio     dw     2000

section .bss

    Bisiesto    resw    0



section .text
main:
    Mov AX, word[PrAnio]						        	;Mueve el parametro anio al registro AX	
	;Mov DX, 0000h								;Limpia DX para una division
	sub DX, DX,							;Limpia DX para una division
    ;Mov BX, 0190h								;Mueve a BX 400d
    Mov BX, 400								;Mueve a BX 400d
	DIV BX									;Realiza la operacion ANIO/400d
	;CMP DX, 0000h								;Compara el residuo de la operacion con 0

    CMP DX, 0								;Compara el residuo de la operacion con 0
	JE EsBisiesto								;Si es igual entonces el año es bisiesto, sino hace otra comparacion
	JNE Evaluar								;Salta si la division anterior no dio un resultado positivo a la siguiente condicional
	Evaluar:
		Mov AX, word[PrAnio]							;Mueve a AX el año ingresado por el usuario
		Mov DX, 0000h							;Reinicializa el registro DX
        ;sub dx,dx							;Reinicializa el registro DX
		Mov BX, 0004h							;Mueve a BX 00004h
        ;Mov BX, 4							;Mueve a BX 00004h
		Div BX							        ;Hace la division AX/0004h
		;CMP DX, 0000h							;Compara el residuo de la division con 0h
        CMP DX, 0							;Compara el residuo de la division con 0h
		JE Evaluar2							;Salta a la segunda comparacion si el residuo de la division es 0
		JNE NoBisiesto						        ;Si el residuo de la division es diferente de cero define que no es año bisiesto
	Evaluar2:
		;Mov DX, 0000h	                          ;Reinicializa el registro DX
        sub DX,dx	                          ;Reinicializa el registro DX
		Mov AX, word[PrAnio]							;Mueve el año ingresado por el usuario a AX
		;Mov BX, 0064h							;Mueve a BX 100d
        Mov BX,100							;Mueve a BX 100d
		Div BX								;Anio / 100d
		CMP DX, 0000h							;Compara el residuo de la division con 0h
        ;CMP DX, 0							;Compara el residuo de la division con 0h
		JNE EsBisiesto						        ;Si el residuo no es cero, entonces se define que es año bisiesto
		JE NoBisiesto						        ;Si el residuo es cero el año es un año normal
	EsBisiesto:
	    ;mov word[Bisiesto], 01h				    ;Define el año como un año bisiesto poniendo 1 en el resultado
        mov word[Bisiesto], 1				    ;Define el año como un año bisiesto poniendo 1 en el resultado
		
        mov		rcx,loEs
	    sub		rsp,32
	    call	printf
	    add		rsp,32
        
        JMP Salir							;Salta al final del macro
	NoBisiesto:
		;Mov word[Bisiesto],00h						;Define el año como un año normal poniendo 0 en el resultado
        Mov word[Bisiesto],0						;Define el año como un año normal poniendo 0 en el resultado
        
        mov		rcx,noLoEs
	    sub		rsp,32
	    call	printf
	    add		rsp,32
		
        JMP Salir							;Salta al final del macro
	Salir:
    ret
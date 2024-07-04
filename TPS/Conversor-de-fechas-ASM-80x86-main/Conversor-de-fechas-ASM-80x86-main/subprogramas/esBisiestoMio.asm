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
    PrAnio     dw     2024

section .bss

    Bisiesto    resw    0

;Un año es bisiesto si es:
    ;Divisible entre 4.
    ;No divisible entre 100.
    ;Divisible entre 400. 
    ;(2000 y 2400 son bisiestos pues aún siendo divisibles 
    ;entre 100 lo son también entre 400. Pero los años 1900, 2100, 2200 y 2300 
    ;no lo son porque solo son divisibles entre 100).

section .text
main:
    mov 	ax,word[PrAnio]	;AX = ANIO      	
	sub 	dx,dx				;Limpio DX para dejar el resto
    mov 	BX, 400		;BX = 400
	div		BX	;Realiza la operacion AX/BX = ANIO/400 DX = resto
    cmp 	dx, 0
	je 		esBisiesto								
	;si es divisible por 400 esBisiesto
	;sino sigo mirando
	NodivisiblePorCuatrocientosMiroPorCuatro:
		Mov 	ax, word[PrAnio]	;AX = ANIO				
        sub 	dx,dx						;Reinicializa el registro DX
        mov 	bx, 4 ;BX = 4
		div 	bx	; AX/BX = ANIO/ 4 DX = RESTO						        ;Hace la division AX/0004h
        cmp 	dx, 0
		jne 	noEsBisiesto						        
		;(no es divisible ni por 400 ni por 4 noEsBisiesto)
		;(no es divisible por 400, pero si por 4, Sigo mirando) 	
	NoDivisiblePorCuatrocientosSiPorCuatroMiroPorCien:
		;Mov DX, 0000h	                          ;Reinicializa el registro DX
        sub 	dx,dx
		mov 	AX, word[PrAnio]
        mov 	bx,100	;BX = 100
		Div 	BX ; AX/BX = ANIO/100 DX = RESTO
        cmp 	dx, 0 
		je 		noEsBisiesto						       
		;(no es divisible por 400, pero si por 4 y 100 entonces no es bisiesto)
		;(no es divisible por 400, no es divisible por 400 pero si es divisible por 4)
	esBisiesto:
	    ;mov word[Bisiesto], 01h				    ;Define el año como un año bisiesto poniendo 1 en el resultado
        mov word[Bisiesto], 1				    ;Define el año como un año bisiesto poniendo 1 en el resultado
		
        mov		rcx,loEs
	    sub		rsp,32
	    call	printf
	    add		rsp,32
        
        JMP Salir							
	noEsBisiesto:
		;Mov word[Bisiesto],00h						
        Mov word[Bisiesto],0					
        
        mov		rcx,noLoEs
	    sub		rsp,32
	    call	printf
	    add		rsp,32
		
        JMP Salir							
	Salir:
    ret
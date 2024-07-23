;*****************************************************************************
; conversionW.asm     |   TP 11 Cifrado Playfair => FUNCIONA CORRECTAMENTE
; La protección de información consiste en convertir un mensaje original en otro de forma tal que éste
; sólo pueda ser recuperado por un grupo de personas a partir del mensaje codificado.
; El sistema para llevar a cabo la protección deberá basarse en el álgebra lineal, con las siguientes pautas:
;       - Alfabeto a utilizar 25 caracteres (A .. Z, omitiendo la J).
;       - Las letras son distribuidas en una matriz de 5x5.
;       - El mensaje a codificar deberá ser dividido en bloques de a dos caracteres (validando que ninguno de
;         los bloques contenga dos ocurrencias de la misma letra y la ‘J’).
;
;La conversión se llevará a cabo por bloques, es decir tomando dos caracteres del mensaje por vez.
;       ● Si los caracteres se encuentran en distinta fila y columna de la matriz, considerar un rectángulo
;         formado con los caracteres como vértices y tomar de la misma fila la esquina opuesta.
;       ● Si los caracteres se encuentran en la misma fila, de cada caracter el situado a la derecha.
;       ● Si los caracteres se encuentran en la misma columna, tomar el caracter situado debajo.
;
; Se pide desarrollar un programa en assembler Intel 80x86 que permita proteger información de la
; manera antes descripta. El mismo va a recibir como entrada:
;       ● El mensaje a codificar o codificado.
;       ● La matriz de 5x5.
; Y el mismo va a dejar como salida:
;       ● El mensaje codificado u original.
;*****************************************************************************
;_____________________________________________________________________________________________________________________________________
;PREGUNTAS:
;    1. QUE PASA SI RECIBO UN STRING DE LONGITUD IMPAR. ¿PONGO UNA X AL FINAL? [PARECE Q SI]
;    2. COMO ARMAR LOS BLOQUES DE LA MATRIZ. ¿CONTADORES DE POSICION? | ¿MUCHAS VARIABLES DE FILA Y COLS? ¿COMO LO HARIA? [CONTADOR DE POS Y LOS SIG CHEQUOS ]
;    3. COMO SERIA EL COPIADO DEL MENSAJE CODIFICADO. ¿COPIO CUANDO ME MUEVO? [SI, DE OTRA FORMA NO HAY]
;    4. PARA VER SI ESTAN EN MISMA FILA, CHEQUEO POR FUERZA BRUTA? VERIFICO POSICIONES POR RANGOS: 1 =< a,b =< 5 | 6 =< a,b =< 10
;                                                                              11 =< a,b =< 15 | 16 =< a,b =< 20 | 21 =< a,b =< 25 [PERFECTO]
;    5. Y PARA VER SI ESTAN EN LA MISMA COLUMNA? COMO SERIA EL CHEQUEO? [DIVIDO POR 5 Y TRABAJO CON LOS RESTOS, PEDAZO DE TIP DE DIEGO]
;        [PARA MODULARIZAR, PUEDO CREAR UNA RUTINA INTERNA "CALCULAR FILA Y COL" LA CUAL HARA ESTAS VERIFICACIONES POR POSICION DEL CARACTER]
; [HECHOS EL 1, 2, 4 Y 5 --> 04/11]
; [HECHO EL 3 ---> 10/11] UTILICE UNA FUNCION CALCDESPLAZ DENTRO DE CADA ITERACION DE LA MATRIZ PARA HACER TODO RECORRIENDOLA SOLO 2 VECES POR ITERACION (DOS: UNA PARA CADA LETRA)
;_____________________________________________________________________________________________________________________________________

;IR de a poco ESTRUCTURALMENTE HABLANDO, PRIMERO COMENTO TODO Y CHEQUEO QUE AVANCE BIEN DE A BLOQUES. POR EJ Q IMPRIMA SOLO, NO CONVIERTA. 
;LUEGO Q CONVIERTA BIEN UNA LETRA DE LAS 2. 

global	main
extern	printf
extern	gets
extern	sscanf
extern	puts

section	.data

    arrayMat        db  "abcdefghiklmnopqrstuvwxyz",0
;    matriz  db  'a','b','c','d','e'
;			db  'f','g','h','i','k'
;			db  'l','m','n','o','p'
;			db  'q','r','s','t','u'
;			db  'v','w','x','y','z'
    
    msjInputCodif	db	"Ingrese (todo en minuscula) un mensaje a codificar que NO contenga la letra 'J' o dos letras iguales seguidas",0
    msjErrorInput   db  "El mensaje ingresado es invalido. Intente nuevamente.",0
    msjDebug        db  "El mensaje ingresado es valido. Espere por favor, procesando...",0
    msjInputAsk 	db	"Ahora, indique si quiere Codificar (C) o Decodificar (D) el mensaje escrito",0
    msjErrorAsk     db  "La letra ingresada NO es una opcion correcta. Intente nuevamente.",0

    msgConversion   db  "Llegue aca, joyaaa",0
	longTexto       dw 0

    msgFinal        db  "El mensaje transformado es: ",0
    textoTransf     db  "                                                  ",0


section	.bss
	texto       	resb	50

    desplaz			resw	1
    inputValido     resb    1   ; S: valido | N: invalido
    fieldIsValid    resb    1   ; S: valido | N: invalido
    DecodOrCodif    resb    1   ; C: codificar texto | D: decodificar texto
   	
    filaA			resw	1
	columnaA		resw	1
    
    contadorPos     resw    1

    filaB			resw	1
	columnaB		resw	1 	 	

section	.text
main:
	mov		rcx,msjInputCodif
	call	printMsg

    mov		rcx,texto
	sub		rsp,32	
    call    gets    
	add		rsp,32	    

    call    validateText
    cmp     byte[inputValido],'S'
    je      continuarProgram

    mov     rcx,msjErrorInput
    call    printMsg

    jmp     main

continuarProgram:
    mov     rcx, msjDebug
    call    printMsg

continuarProg1:
	mov		rcx,msjInputAsk
	call	printMsg

    mov		rcx,DecodOrCodif
	sub		rsp,32	
    call    gets    
	add		rsp,32	 

;Valido, que la letra ingresada sea una opcion correcta: Codificar (C) o Decodificar (D)
    cmp     byte[DecodOrCodif],'C'
    je      continuarProg2

    cmp     byte[DecodOrCodif],'c'
    je      continuarProg2

    cmp     byte[DecodOrCodif],'D'
    je      continuarProg2

    cmp     byte[DecodOrCodif],'d'
    je      continuarProg2

    mov     rcx,msjErrorAsk
    call    printMsg

    jmp     continuarProg1

continuarProg2:
;Una vez validado, tanto el mensaje ingresado como la opcion C o D. Llamamos a la funcion madre de programa, la que hara las conversiones     
    call    ConversionLetras

    mov		rcx, msgFinal
	call	printMsg

    mov		rcx, textoTransf
	call	printMsg

EndProg:
ret ;FIN DE PROGRAMA

;*********************************
; RUTINAS INTERNAS
;*********************************
validateText:
    mov     byte[inputValido],'N'

    call    validateJ
    cmp     byte[fieldIsValid],'N'
    je      endValidate

    call    validateEqualLetter
    cmp     byte[fieldIsValid],'N'
    je      endValidate

;Si llegue aca, es porque el texto pasó ambas validaciones.

;Pero ahora, si la longTexto es par, es divisible por 2 (resto 0), esta todo ok. Sin embargo, si es impar tomaré una decision:
;Le insertare al texto (msg a codificar) una 'x' al final para hacerlo par. Detrás de esa 'x', le inserto el 0 para marcar el final.
    mov     rax, 0
    mov     rbx, 0
    mov     ax, word[longTexto] ;Almaceno en AX la longTexto
    mov     bl, 2
    idiv    bl                  ;Y divido el AX por bl (por 2), que como es de 8 bits los registros => Cociente: AL | Resto: AH
    
    cmp     ah, 0
    je      validateOk      ;Osea, si el resto (que queda en ah) es = 0. Es par 

;En su defecto, si resto NO ES = 0, es impar. Debo hacer una rutina interna donde coloco la 'x'
    call    LongImparInsertX

validateOk:
    mov     byte[inputValido],'S'
endValidate:
ret

;*********************************
;VALIDAR que no haya ninguna J
validateJ:
    mov     byte[fieldIsValid], 'N'

    mov     rbx, 0
sigLetra:
    cmp     byte[texto + rbx], 0
    je      Final

    cmp     byte[texto + rbx], 'J'
    je      HayJ
    cmp     byte[texto + rbx], 'j'
    je      HayJ

; [YA QUE RECORRO EL STRING ENTERO, ACA PUEDO HACER LA CORRECION DE REEMPLAZAR UN ESPACIO ' ' POR UNA 'x']
    cmp     byte[texto + rbx], ' '
    jne     noEspacioSigo

    mov     byte[texto + rbx], 'x'  ;Si es = a un espacio ' ', entonces reemplazo por una 'x'

noEspacioSigo:
    inc     rbx
    jmp     sigLetra

;Si entre a Final es porque no encontre ninguna J
Final:
    mov     word[longTexto], bx
    mov     byte[fieldIsValid],'S'
HayJ:
ret

;*********************************
;VALIDAR que no hayan dos letras iguales consecutivas
validateEqualLetter:
    mov     byte[fieldIsValid], 'N'

    mov     rbx, 0
    mov     dl, byte[texto + rbx]
nextLetra:
    cmp     byte[texto + rbx], 0
    je      FinalText
    
    inc     rbx

    cmp     dl, byte[texto + rbx]
    je      EqualLetter

    mov     dl, byte[texto + rbx]
    jmp     nextLetra

;Si entre aca es porque no encontre dos letras iguales consecutivas
FinalText:
    mov     byte[fieldIsValid],'S'
EqualLetter:
ret

;*********************************
;Funcion que si, el texto tiene longitud impar, insertará una 'x' en el final para hacerla par
LongImparInsertX:

    mov     rbx, 0
    mov     bx, word[longTexto]
   
    mov     byte[texto + rbx], 'x'       ;Inserto una 'x' en la posicion final del texto (donde estaria el 0) y luego:
    inc     rbx
    mov     byte[texto + rbx], 0     ;Inserto un 0 en la posicion final + 1 para marcar el nuevo fin de texto

    mov     word[longTexto], bx

ret

;*********************************
;COMIENZA LAS CONVERSION: RECORRO LA MATRIZ PARA ARMAR LOS BLOQUES E IR TRANSFORMANDO LOS CARACTERES. LUEGO, COPIARLOS AL OTRO STRING
ConversionLetras:
    
    mov     rbx, 0

; Vamos a ver donde esta la letra A (la 1ra letra del bloque del texto)
    mov     r10, 0
    mov     rax, 0
IteracionPorBloquesA:
   
    cmp     byte[texto + rbx], 0    ;Antes que nada, comparo si el caracter del texto es un cero (fin del texto)
    je      ConversionEnd           ;Si lo es, termino de iterar.

    inc     rax

    mov     r9b, byte[arrayMat + r10]
    inc     r10

    cmp     r9b, byte[texto + rbx]
    jne     IteracionPorBloquesA       ;Si el caracter de la matriz NO ES IGUAL al 1ero del texto, avanzo en matriz (sig iteracion)


;Si llegue aca, es porque coinciden los caracteres mencionados (las letras)
    mov     word[contadorPos], ax       ;Paso un numero como contador (de posiciones), en binario, a una variable (contadorPos)
    call    calcularFilaA               ;Con ese contador, calculare cual es la fila y columna de la 1era letra del bloque del texto
    call    calcularColumnaA


;Ahora, iré a ver donde esta la letra B (la 2da letra del bloque del texto)
    mov     r10, 0
    mov     rax, 0

IteracionPorBloquesB:
    inc     rax

    mov     r9b, byte[arrayMat + r10]  
    inc     r10
;Ahora quiero comparar, el sig caracter del bloque del texto
    cmp     r9b, byte[texto + rbx + 1]

    jne     IteracionPorBloquesB      ;Si el caracter de la matriz NO ES IGUAL al siguiente del texto, avanzo en matriz (sig iteracion)

;Si llegue aca, es porque coinciden los caracteres mencionados (las letras)
    mov     word[contadorPos], ax       ;Paso un numero como contador (de posiciones), en binario, a una variable (contadorPos)
    call    calcularFilaB               ;Con ese contador, calculare cual es la fila y columna de la 2da letra del bloque del texto
    call    calcularColumnaB


;YA teniendo las fils y cols de ambas letras, debo armar los bloques, transformar esas letras a codificar segun las reglas
; y luego, ir copiandolas a textoTransf que sera mi string nuevo (el msg ya codificado)
;SIN EMBARGO, debo ver si el usuario quiere Codificar o DECodificar el texto ingresado, asique deberé armarme un IF

    cmp     byte[DecodOrCodif],'C'
    je      Cifrado
    cmp     byte[DecodOrCodif],'c'
    je      Cifrado
;De todas formas, si comparo y NO ES C, por descarte será D por como lo he programado con verificaciones
    cmp     byte[DecodOrCodif],'D'
    je      Descifrado
    cmp     byte[DecodOrCodif],'d'
    je      Descifrado

Cifrado:
    call	cifrarMensaje                                                      ;-> en esta, el caso de misma fil o misma col, será + 1
    jmp     ContinuoConversion                       
;AMBAS FUNCIONES SON LA MISMA BASE. Ambas convertiran los valores de Filas y Cols para el copiado de letras "transformadas"
Descifrado:
    call	descifrarMensaje                                                   ;-> en esta, el caso de misma fil o misma col, será - 1

ContinuoConversion:
;Aqui, utilizare una funcion para calcular los desplazamientos con los nuevos valores de Filas y Cols
;Luego, ire copiando las letras "nuevas", byte a byte hacia el nuevo texto => textoTransf 

    mov     word[desplaz], 0                    ;Inicializo el desplaz en 0 (cero)
    call    calcDesplazA
    mov     r15, 0
    mov     r15w, word[desplaz]
    mov     r8b, byte[arrayMat + r15]              ;Copio la 1era "nueva letra o transformada" del bloque a un registro como pivote
    mov     byte[textoTransf + rbx], r8b         ;Para luego, ya copiarla en el textoTransf 

;Ahora, hare exactamente el mismo procedimiento pero con la 2da letra del bloque 
    mov     word[desplaz], 0                    ;Inicializo el desplaz en 0 (cero)
    call    calcDesplazB
    mov     r15, 0
    mov     r15w, word[desplaz]                   
    mov     r8b, byte[arrayMat + r15]              ;Copio la 2da "nueva letra o transformada" del bloque a un registro como pivote
    mov     byte[textoTransf + rbx + 1], r8b     ;Para luego, ya copiarla en la siguiente posicion del textoTransf


;Una vez hecho el copiado, simplemente avanzo en el texto para agarrar el siguiente bloque de 2 letras. Y, reinicio los valores de rax y r10
    add     rbx, 2
    mov     rax, 0
    mov     r10, 0
    jmp     IteracionPorBloquesA

ConversionEnd:
;Para marcar el fin del texto "nuevo", le inserto un 0 (cero) al final    
    mov     byte[textoTransf + rbx + 1], 0
ret

;*********************************
calcDesplazA:
    mov     rcx, 0
;  [(fila-1)*longFila]  + [(columna-1)*longElemento]
;  longFila = longElemento * cantidad columnas
    mov     cx, word[filaA]
    dec     cx
    imul    cx,cx,5    ; 5 porque la longFila = longElemento (1 bytes) * cantCols (5 cols)
;en cx tengo el desplazamiento a la fila
    mov     word[desplaz],cx

    mov     cx, word[columnaA]
    dec     cx
;   imul    cx, cx, 1       => Como la longElemento es 1 byte, puedo obviar la multiplicacion

    add     word[desplaz],cx    ;en desplaz tengo el desplazamiento total
ret

;*********************************
calcDesplazB:
    mov     rcx, 0
;  [(fila-1)*longFila]  + [(columna-1)*longElemento]
;  longFila = longElemento * cantidad columnas
    mov     cx, word[filaB]
    dec     cx
    imul    cx,cx,5    ; 5 porque la longFila = longElemento (1 bytes) * cantCols (5 cols)
;en cx tengo el desplazamiento a la fila
    mov     word[desplaz],cx

    mov     cx, word[columnaB]
    dec     cx
;   imul    cx, cx, 1       => Como la longElemento es 1 byte, puedo obviar la multiplicacion

    add     word[desplaz],cx    ;en desplaz tengo el desplazamiento total
ret

;*********************************
;FUNCION LA CUAL CODIFICARA EL TEXTO INGRESADO
; => SOLAMENTE, CAMBIARA LOS VALORES DE FILAS Y COLS PARA LUEGO REALIZAR EL COPIADO DE BYTES O LETRAS
cifrarMensaje:

Caso1:              ;Cuando la FilaA = FilaB 

    mov     r11, 0                  ;Los comparo utilizando al r11w como pivote, pero antes lo inicializo en 0 (cero)
    mov     r11w, word[filaA]
    cmp     r11w, word[filaB]
    jne     Caso2

; Osea, si llegue aca las Filas son iguales y hare lo siguiente: ColA + 1, ColB + 1. 
    add     word[columnaA], 1
    add     word[columnaB], 1       ;Incremento ambas Cols en 1

;Y luego, chequeo que NO sean > 5 o que NO sean = 6. Por como esta definido el programa, a efectos practicos es indistinto
    cmp     word[columnaA], 5
    jle     sigoCaso1
    mov     word[columnaA], 1       ;Osea, si ColA > 5. Lo trato como circular y lo seteo en 1

sigoCaso1:
    cmp     word[columnaB], 5
    jle     TerminoCaso1
    mov     word[columnaB], 1       ;Osea, si ColB > 5. Lo trato como circular y lo seteo en 1

;Una vez terminado este caso, salto al final, a la ret
TerminoCaso1:
    jmp     endCifrado

;----------------------------------------------------------------- (Separador de Casos)
Caso2:              ;Cuando la ColA = ColB

    mov     r12, 0               ;Los comparo utilizando al r12w como pivote, pero antes lo inicializo en 0 (cero)
    mov     r12w, word[columnaA]
    cmp     r12w, word[columnaB]
    jne     Caso3

; Osea, si llegue aca las Cols son iguales y hare lo siguiente: FilaA + 1, FilaB + 1. 

    add     word[filaA], 1
    add     word[filaB], 1       ;Incremento ambas Filas en 1

;Y luego, chequeo que NO sean > 5 o que NO sean = 6. Por como esta definido el programa, a efectos practicos es indistinto
    cmp     word[filaA], 5
    jle     sigoCaso2
    mov     word[filaA], 1       ;Osea, si FilA > 5. Lo trato como circular y lo seteo en 1

sigoCaso2:
    cmp     word[filaB], 5
    jle     TerminoCaso2
    mov     word[filaB], 1       ;Osea, si FilB > 5. Lo trato como circular y lo seteo en 1

TerminoCaso2:
;Una vez terminado este caso, salto al final, a la ret
    jmp     endCifrado

;----------------------------------------------------------------- (Separador de Casos)
Caso3:              ;Cuando Filas y Cols son distintas, solo tengo que hacer un swap de las Columnas

    mov     r13, 0               ;Los swapeo utilizando al r13w y al r14w como pivotes, pero antes los inicializo en 0 (cero)
    mov     r14, 0
    
    mov     r13w, word[columnaA]
    mov     r14w, word[columnaB]

    mov     word[columnaA], r14w
    mov     word[columnaB], r13w

endCifrado:
ret

;*********************************
;FUNCION LA CUAL DECODIFICARA EL TEXTO INGRESADO, es decir, EL CAMINO INVERSO (aunq la base de la funcion es muy similar)
; => SOLAMENTE, CAMBIARA LOS VALORES DE FILAS Y COLS PARA LUEGO REALIZAR EL COPIADO DE BYTES O LETRAS
descifrarMensaje:

CasoBis1:              ;Cuando la FilaA = FilaB 

    mov     r11, 0                  ;Los comparo utilizando al r11w como pivote, pero antes lo inicializo en 0 (cero)
    mov     r11w, word[filaA]
    cmp     r11w, word[filaB]
    jne     CasoBis2

; Osea, si llegue aca las Filas son iguales y hare lo siguiente: ColA - 1, ColB - 1. 
    sub     word[columnaA], 1
    sub     word[columnaB], 1       ;Decremento ambas Cols en 1

;Y luego, chequeo que NO sean < 1 o que NO sean = 0. Por como esta definido el programa, a efectos practicos es indistinto
    cmp     word[columnaA], 0
    jne     sigoCasoBis1
    mov     word[columnaA], 5       ;Osea, si ColA < 1. Lo trato como circular y lo seteo en 5

sigoCasoBis1:
    cmp     word[columnaB], 0
    jne     TerminoCasoBis1
    mov     word[columnaB], 5       ;Osea, si ColB < 1. Lo trato como circular y lo seteo en 5

TerminoCasoBis1:
;Una vez terminado este caso, salto al final, a la ret
    jmp     endDescifrado

;----------------------------------------------------------------- (Separador de Casos)
CasoBis2:              ;Cuando la ColA = ColB

    mov     r12, 0               ;Los comparo utilizando al r12w como pivote, pero antes lo inicializo en 0 (cero)
    mov     r12w, word[columnaA]
    cmp     r12w, word[columnaB]
    jne     CasoBis3

; Osea, si llegue aca las Cols son iguales y hare lo siguiente: FilaA - 1, FilaB - 1. 
    sub     word[filaA], 1
    sub     word[filaB], 1       ;Decremento ambas Filas en 1

;Y luego, chequeo que NO sean < 1 o que NO sean = 0. Por como esta definido el programa, a efectos practicos es indistinto
    cmp     word[filaA], 0
    jne     sigoCasoBis2
    mov     word[filaA], 5       ;Osea, si FilA < 1. Lo trato como circular y lo seteo en 5

sigoCasoBis2:
    cmp     word[filaB], 1
    jge     TerminoCasoBis2
    mov     word[filaB], 5       ;Osea, si FilB < 1. Lo trato como circular y lo seteo en 5

TerminoCasoBis2:
;Una vez terminado este caso, salto al final, a la ret
    jmp     endDescifrado

;----------------------------------------------------------------- (Separador de Casos)
CasoBis3:              ;Cuando Filas y Cols son distintas, solo tengo que hacer un swap de las Columnas

    mov     r13, 0               ;Los swapeo utilizando al r13w y al r14w como pivotes, pero antes los inicializo en 0 (cero)
    mov     r14, 0
    
    mov     r13w, word[columnaA]
    mov     r14w, word[columnaB]

    mov     word[columnaA], r14w
    mov     word[columnaB], r13w

endDescifrado:
ret

;*********************************
;Calculo (mediante el contador de pos) la fila de la 1era Letra del Bloque del texto 
calcularFilaA:

    cmp     word[contadorPos], 5
    jle     AesFila1

    cmp     word[contadorPos], 10
    jle     AesFila2
     
    cmp     word[contadorPos], 15
    jle     AesFila3

    cmp     word[contadorPos], 20
    jle     AesFila4

; Si llegue aca esFila5, porq no queda otra opcion. Por como esta definido mi programa, contadorPos JAMAS puede ser > 25
    mov     word[filaA], 5
    jmp     endFilaA

AesFila1:
    mov     word[filaA], 1
    jmp     endFilaA

AesFila2:
    mov     word[filaA], 2
    jmp     endFilaA

AesFila3:
    mov     word[filaA], 3
    jmp     endFilaA

AesFila4:
    mov     word[filaA], 4
    jmp     endFilaA

endFilaA:
ret

;*********************************
;Calculo (mediante el contador de pos) la fila de la 2da Letra del Bloque del texto 
calcularFilaB:

    cmp     word[contadorPos], 5
    jle     BesFila1

    cmp     word[contadorPos], 10
    jle     BesFila2
     
    cmp     word[contadorPos], 15
    jle     BesFila3

    cmp     word[contadorPos], 20
    jle     BesFila4

; Si llegue aca esFila5, porq no queda otra opcion. Por como esta definido mi programa, contadorPos JAMAS puede ser > 25
    mov     word[filaB], 5
    jmp     endFilaB

BesFila1:
    mov     word[filaB], 1
    jmp     endFilaB

BesFila2:
    mov     word[filaB], 2
    jmp     endFilaB

BesFila3:
    mov     word[filaB], 3
    jmp     endFilaB

BesFila4:
    mov     word[filaB], 4
    jmp     endFilaB

endFilaB:
ret

;*********************************
;Calculo (mediante el contador de pos) la columna de la 1er Letra del Bloque del texto 
calcularColumnaA:
    mov     rax, 0
    mov     rdx, 0

; Antes de hacer las divisiones, como contadorPos puede ser =< 5, primero chequeo del 1 al 5 por fuerza bruta.
    cmp     word[contadorPos], 1
    je      AesCol1

    cmp     word[contadorPos], 2
    je      AesCol2
     
    cmp     word[contadorPos], 3
    je      AesCol3

    cmp     word[contadorPos], 4
    je      AesCol4

    cmp     word[contadorPos], 5
    je      AesCol5

; Una vez, haya chequeado esos valores. Ya ahi si comenzare a dividir por 5 para averiguar la columna de la Letra.
    mov     ax, word[contadorPos] ;Almaceno en AX el contadorPos
    mov     dl, 5
    idiv    dl                  ;Y divido el AX por dl (por 2), que como es de 8 bits los registros => Cociente: AL | Resto: AH
                                ;Lo que me queda en AH, es el resto. Por ej, 22/5 => (AL) = 4 , (AH) = [2] => SERA LA COL (MAS DIRECTO) 
    cmp     ah, 0
    je      AesCol5

    cmp     ah, 1  
    je      AesCol1

    cmp     ah, 2   
    je      AesCol2

    cmp     ah, 3    
    je      AesCol3

    cmp     ah, 4   
    je      AesCol4

AesCol1:
    mov     word[columnaA], 1
    jmp     AendCol

AesCol2:
    mov     word[columnaA], 2
    jmp     AendCol

AesCol3:
    mov     word[columnaA], 3
    jmp     AendCol

AesCol4:
    mov     word[columnaA], 4
    jmp     AendCol

AesCol5:
    mov     word[columnaA], 5
    jmp     AendCol

AendCol:
ret

;*********************************
;Calculo (mediante el contador de pos) la columna de la 2da Letra del Bloque del texto 
calcularColumnaB:
    mov     rax, 0
    mov     rdx, 0

; Antes de hacer las divisiones, como contadorPos puede ser =< 5, primero chequeo del 1 al 5 por fuerza bruta.
    cmp     word[contadorPos], 1
    je      BesCol1

    cmp     word[contadorPos], 2
    je      BesCol2
     
    cmp     word[contadorPos], 3
    je      BesCol3

    cmp     word[contadorPos], 4
    je      BesCol4

    cmp     word[contadorPos], 5
    je      BesCol5

; Una vez, haya chequeado esos valores. Ya ahi si comenzare a dividir por 5 para averiguar la columna de la Letra.
    mov     ax, word[contadorPos] ;Almaceno en AX el contadorPos
    mov     dl, 5
    idiv    dl                  ;Y divido el AX por dl (por 5), que como es de 8 bits los registros => Cociente: AL | Resto: AH
                                ;Lo que me queda en AH, es el resto. Por ej, 22/5 => (AL) = 4 , (AH) = 2
    cmp     ah, 0
    je      BesCol5

    cmp     ah, 1   
    je      BesCol1

    cmp     ah, 2   
    je      BesCol2

    cmp     ah, 3   
    je      BesCol3

    cmp     ah, 4   
    je      BesCol4

BesCol1:
    mov     word[columnaB], 1
    jmp     BendCol

BesCol2:
    mov     word[columnaB], 2
    jmp     BendCol

BesCol3:
    mov     word[columnaB], 3
    jmp     BendCol

BesCol4:
    mov     word[columnaB], 4
    jmp     BendCol

BesCol5:
    mov     word[columnaB], 5
    jmp     BendCol

BendCol:
ret

;*********************************
printMsg:
    sub     rsp, 32
    call    puts
    add     rsp, 32
ret





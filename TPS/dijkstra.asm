;**************************************************************
; ALGORITMO DE DIJKSTRA CAMINO MINIMO ENTRE DOS VERTICES      *
; Thiago Kovnat, Primer Cuatrimestre 2020 Orga 9557           *
;**************************************************************

global main
extern printf
extern gets
extern sscanf

section .data

; ########## RELACIONADAS A LA MATRIZ  ########## 

	SPT             times 20 dq 0

	matrizAdy      	dq 0, 35, 0, 42, 12, 3, 0, 0, 0, 0, 0, 0, 0, 11, 0 
					dq 35, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 32 
					dq 0, 0, 0, 56, 0, 0, 0, 0, 11, 11, 0, 0, 0, 0, 3 
					dq 42, 5, 56, 0, 21, 0, 0, 0, 13, 0, 0, 0, 0, 0, 5 
					dq 12, 0, 0, 21, 0, 1, 13, 1, 0, 0, 0, 0, 0, 0, 0 
					dq 3, 0, 0, 0, 1, 0, 17, 0, 0, 0, 0, 0, 0, 0, 0 
					dq 0, 0, 0, 0, 13, 17, 0, 21, 0, 0, 0, 0, 5, 0, 0 
					dq 0, 0, 0, 0, 1, 0, 21, 0, 11, 0, 0, 13, 1, 0, 0 
					dq 0, 0, 11, 13, 0, 0, 0, 11, 0, 23, 23, 3, 0, 0, 0 
					dq 0, 0, 11, 0, 0, 0, 0, 0, 23, 0, 3, 0, 0, 0, 0 
					dq 0, 0, 0, 0, 0, 0, 0, 0, 23, 3, 0, 0, 0, 0, 0 
					dq 0, 0, 0, 0, 0, 0, 0, 13, 3, 0, 0, 0, 0, 0, 0 
					dq 0, 0, 0, 0, 0, 0, 5, 1, 0, 0, 0, 0, 0, 0, 0 
					dq 11, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
					dq 0, 32, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 		

	matrizCaminoMinimo times 40 dq 0

; ##########  RELACIONADAS A LOS VERTICES ########## 

	cantVerticesSPT dq 1
	cantVertices    dq 15
	nodoMinimo      dq 0
	nodoInicial     dq 1
	nodoFin         dq 10

; ########## FILAS / COLUMNAS ########## 

	fila dq 0
	columna dq 0
	longFila dq 120
	elemento dq 0
	elementoCaminoMinimo dq 0

; ########## AUXILIARES ########## 

	auxiliar dq 0
	minimoActual dq 0
	formatoScanf dw "%i"

; ########## MENSAJES PARA PRINTF ########## 

	msjPrintf dw "Distancia: %hi",10,0
	printfCamino dw "%i <- ", 0
	printIn dw "IN",10,0
	printMsjCamino dw "Camino minimo desde %hi a %hi:",10,0

	msjIngresoVertices dw "Ingrese la cantidad de vertices:",10,0
	msjIngresoPeso dw "Ingrese un peso para la fila %hi y columna %hi :",10,0
	msjNodoInicial dw "Ingrese el nodo inicial: ",10,0
	msjNodoFin     dw "Ingrese el nodo fin: ",10,0

	msjMostrarMatriz  dw "La matriz de adyacencia usada fue la siguiente: ",10,0
	msjElementoMatriz dw "  %i  ",0

	msjNewLine dw "                                                      ",10,0

section .bss

	estaPresente resb 1
	buffer resq 1
	plusRsp resq 1

section .text


main:


	;call ingresarMatriz
	call ingresarNodosLimite
	call DIJKSTRA

	ret


; ########## RUTINAS INTERNAS ########## 

DIJKSTRA:
	
	
	call inicializarMatriz							; Inicializo la matriz que uso para el algoritmo


loopDIJKSTRA:


	call getNodoMinimo								; Busco el nodo con menor peso que no haya visistado

	mov rax, qword[nodoFin]
	cmp rax, qword[nodoMinimo]
	je finDIJKSTRA									; Si el nodo minimo es mi nodo fin, llegue al fin del algoritmo

	call actualizarMatriz							; Si no es mi nodo fin, actualizo la matriz tomando el minimo entre dist(u) y dist(v) + dist(u-v)
	
	jmp loopDIJKSTRA

finDIJKSTRA:


	call imprimirCamino								; Imprimo el camino fin 
	call imprimirMatriz

	ret


; ########## getNodoMinimo Busca en la matriz de camino minimo el nodo con menor peso que no haya sido visitado ########## 

getNodoMinimo:										


	mov qword[fila], 1
	mov qword[columna], 1
	mov qword[minimoActual], 60000

loopNodoMinimo:

	mov rax, qword[cantVertices]
	cmp qword[fila], rax
	jg finNodoMinimo

	mov rax, qword[nodoInicial]										; No comparo el nodo del cual parti, ya que su distancia siempre es 0 y quedaria como el nodo minimo.
	cmp qword[fila], rax
	je incrementFilaNodoMin

	mov rax, qword[fila]
	dec rax
	imul rax, 16

	mov rbx, rax

	mov rax, qword[columna]
	dec rax
	imul rax, 8

	add rbx, rax

	mov rax, qword[matrizCaminoMinimo + rbx]

	cmp rax, qword[minimoActual]
	jl nuevoMinimo

incrementFilaNodoMin:

	inc qword[fila]
	jmp loopNodoMinimo

finNodoMinimo:

	ret

nuevoMinimo:

	push qword[fila]
	push rax

	call comprobarSiNodoYaEstaPresente

	pop rax
	pop qword[fila]

	cmp byte[estaPresente], "S"                       ; Si el nodo ya fue visitado, lo descarto
	je incrementFilaNodoMin

	mov qword[minimoActual], rax					  ; Actualizo los valores minimos
	mov rax, qword[fila]
	mov qword[nodoMinimo], rax
	jmp incrementFilaNodoMin

; ########## comprobarSiNodoYaEstaPresente deja en una variable estaPresente S si el nodo ya fue visitado, N caso contrario ########## 

comprobarSiNodoYaEstaPresente:								

	mov rbx, qword[fila]                              ; Por como esta implementado, la fila tambien representa el numero que identifica al nodo

	mov byte[estaPresente], "N"

	mov qword[fila], 1

loopComprobarPresente:

	mov rax, qword[fila]
	dec rax
	imul rax, 8

	cmp rbx, qword[SPT + rax]						  ; Si el numero que identifica a mi nodo ya esta en SPT, significa que ya lo visite
	je nodoPresente

	mov rax, qword[cantVertices]
	inc qword[fila]
	cmp qword[fila], rax
	jle loopComprobarPresente

finComprobar:

	ret

nodoPresente:

	mov byte[estaPresente], "S"
	jmp finComprobar

; ########## inicializarMatriz inicializa la matriz de camino minimo que se utiliza para el algortimo de DIJKSTRA ########## 
inicializarMatriz:						

	mov rax, qword[nodoInicial]
	mov qword[fila], rax								; Mi fila es el numero que identifica al nodo inicial
	mov qword[columna], 1								; El desplazamiento sera de columna, iniciando en 1, recorriendo asi las adyacencias al nodo inicial

loopInicializar:

	mov rax, qword[cantVertices]
	cmp qword[columna], rax
	jg finInicializar

	call getElemento
	
	mov rax, qword[columna]
	dec rax
	imul rax, 16										; Dejo en el RAX el desplazamiento para saber donde tengo que guardar el valor


	cmp qword[elemento], 0								; Si el elemento es 0, significa que no hay edge uniendolos y las distancia entre ambos se setea en infinito
	je putInfinito

	mov rbx, qword[elemento]


	mov qword[matrizCaminoMinimo + rax], rbx
	add rax, 8											; Me desplazo a la columna donde almaceno desde que nodo vengo
	mov rbx, qword[nodoInicial]
	mov qword[matrizCaminoMinimo + rax], rbx


incrementColumna:

	inc qword[columna]
	jmp loopInicializar
	

putInfinito:

	mov rbx, qword[nodoInicial]

	mov qword[matrizCaminoMinimo + rax], 60000
	add rax, 8
	mov qword[matrizCaminoMinimo + rax], rbx

	jmp incrementColumna

finInicializar:

	ret

; ########## Dada una fila y una columna, getElemento devuelve el valor contenido en la matriz de adyacencia ##########  
getElemento:										
		
	mov rax, qword[fila]
	dec rax
	imul rax, qword[longFila]

	mov rbx, rax                                 ; RBX = Desplzamiento fila

	mov rax, qword[columna]
	dec rax
	imul rax, 8

	add rbx, rax                                 ; RBX = Desplzamiento total

	mov rax, [matrizAdy + rbx]
	mov qword[elemento], rax

	ret

; ########## Actualiza los valores de la matriz de camino minimo siguiendo el algortimo de DIJKSTRA ########## 
actualizarMatriz:

	mov rax, qword[nodoMinimo]

	mov qword[fila], rax
	mov qword[columna], 1

loopActualizar:
	
	call getElemento

	cmp qword[elemento], 0								; Si el elemento en la matriz es 0, significa que no hay edge uniendolos, no sigo adelante
	je incrementColumnaActualizar

	mov rax, qword[columna]
	cmp rax, qword[nodoMinimo]							; No hace falta comparar el valor en la celda ij con i = j ya que siempre sera 0
	je incrementColumnaActualizar

	call getElementoCaminoMinimo						; Busco la distancia actual para llegar al nodo que estoy analizando

	mov rax, qword[elementoCaminoMinimo]
	mov qword[auxiliar], rax

	push qword[columna]
	mov rax, qword[fila]

	mov qword[columna], rax

	call getElementoCaminoMinimo						; Busco cuanto me cuesta actualmente llegar al nodoMinimo que estoy analizando

	pop qword[columna]

	mov rax, qword[elementoCaminoMinimo]
	add rax, qword[elemento]                            ; dist[v] + edge(u-v) 
	mov qword[elemento], rax

	cmp rax, qword[auxiliar]                            ; if dist(u) > dist[v] + edge(u-v) then dist(u) = dist(v) + edge(u-v)
	jl placeElemento

incrementColumnaActualizar:

	inc qword[columna]

	mov rbx, qword[cantVertices]
	cmp qword[columna], rbx
	jg finActualizar

	jmp loopActualizar

finActualizar:

	inc qword[cantVerticesSPT]							

	mov rax, qword[cantVerticesSPT]
	dec rax
	imul rax, 8

	mov rbx, rax

	mov rax, qword[nodoMinimo]

	mov qword[SPT + rbx], rax						    ; Agrego el nodoMinimo actual al vector de visitados

	ret

; ########## Dada una fila, actualiza el valor en la matriz de camino minimo y tambien actualiza desde donde llegue a ese nodo ##########  	
placeElemento:

	mov rbx, qword[columna]   
	dec rbx
	imul rbx, 16

	mov qword[matrizCaminoMinimo + rbx], rax

	add rbx, 8                                          ; me desplazo a la columna "FROM"

	mov rax, qword[nodoMinimo]

	mov qword[matrizCaminoMinimo + rbx], rax

	jmp incrementColumnaActualizar

getElementoCaminoMinimo:

	
	mov rax, qword[columna]                             ; Por como esta hecha esta matriz, la columna de la matriz de adyacencia es la fila de la matriz de camino minimo
	dec rax
	imul rax, 16

	mov rbx, rax

	mov rax, 1                                          ; Siempre quiero el elemento de mi primera columna
	dec rax
	imul rax, 8

	add rbx, rax

	mov rax, qword[matrizCaminoMinimo + rbx]

	mov qword[elementoCaminoMinimo], rax

	ret

; ########## Imprime el camino minimo desde nodoInicial hasta nodoFin ########## 
imprimirCamino:
	
	mov rax, 0
	mov rdi, printMsjCamino
	mov rsi, qword[nodoInicial]
	mov rdx, qword[nodoFin]
	sub rsp, 8
	call printf
	add rsp, 8

loopCamino:

	mov rdi, printfCamino
	mov rsi, qword[nodoFin]
	sub rsp, 8
	call printf
	add rsp, 8

	mov rax, qword[nodoFin]
	dec rax
	imul rax, 16

	mov rbx, rax

	mov rax, 1
	imul rax, 8

	add rbx, rax

	mov rax, qword[matrizCaminoMinimo + rbx]

	cmp rax, qword[nodoInicial]
	je finMostrarCamino

	mov qword[nodoFin], rax
	jmp loopCamino

finMostrarCamino:

	mov rdi, printfCamino
	mov rsi, qword[nodoInicial]
	sub rsp, 8
	call printf
	add rsp, 8

	mov rdi, printIn
	sub rsp, 8
	call printf
	add rsp, 8

	ret

; ########## Pide al usuario el ingreso de los valores de la matriz de adyacencia ########## 
ingresarMatriz:

	mov rax, 0
	mov rdi, msjIngresoVertices
	sub rsp, 8
	call printf
	add rsp, 8

	mov rdi, buffer
	sub rsp, 8
	call gets
	add rsp, 8

	mov rdi, buffer
	mov rsi, formatoScanf
	mov rdx, cantVertices
	call checkAlign
	sub rsp, [plusRsp]
	call sscanf
	add rsp, [plusRsp]

	cmp qword[cantVertices], 20
	jg ingresarMatriz

	cmp qword[cantVertices], 0
	jl ingresarMatriz

	mov qword[fila], 1

loopFila:
	
	mov rax, qword[cantVertices]
	cmp qword[fila], rax
	jg finLoop

	mov qword[columna], 1
	call loopColumna

	inc qword[fila]
	jmp loopFila


loopColumna:

	mov rax, qword[cantVertices]
	cmp qword[columna], rax
	jg returnToFila

	mov rax, 0
	mov rdi, msjIngresoPeso
	mov rsi, qword[fila]
	mov rdx, qword[columna]
	sub rsp, 8
	call printf 
	add rsp, 8

	mov rdi, buffer
	sub rsp, 8
	call gets
	add rsp, 8


	mov rdi, buffer
	mov rsi, formatoScanf
	mov rdx, elemento
	call checkAlign
	sub rsp, [plusRsp]
	call sscanf
	add rsp, [plusRsp]

	call placeElementoAdyacencia

	inc qword[columna]
	jmp loopColumna

returnToFila:

	ret


finLoop:

	ret

; ########## Dada una fila, una columna y un elemento, coloca dicho elemento en la fila y columna indicada ########## 
placeElementoAdyacencia:

	mov rax, qword[fila]
	dec rax
	imul rax, qword[longFila]

	mov rbx, rax

	mov rax, qword[columna]
	dec rax
	imul rax, 8

	add rbx, rax

	mov rax, qword[elemento]
	mov qword[matrizAdy + rbx], rax

	ret

; ########## Pide al usuario el ingreso de los nodos limites para el camino minimo ########## 
ingresarNodosLimite:

	mov rax, 0
	mov rdi, msjNodoInicial
	sub rsp, 8
	call printf 
	add rsp, 8

	mov rdi, buffer
	sub rsp, 8 
	call gets
	add rsp, 8

	mov rdi, buffer
	mov rsi, formatoScanf
	mov rdx, nodoInicial
	call checkAlign
	sub rsp, [plusRsp]
	call sscanf
	add rsp, [plusRsp]

	mov rax, 0
	mov rdi, msjNodoFin
	sub rsp, 8
	call printf
	add rsp, 8

	mov rdi, buffer
	sub rsp, 8 
	call gets
	add rsp, 8

	mov rdi, buffer
	mov rsi, formatoScanf
	mov rdx, nodoFin
	call checkAlign
	sub rsp, [plusRsp]
	call sscanf
	add rsp, [plusRsp]

	ret


imprimirMatriz:

	mov qword[fila],1

	mov rax, 0
	mov rdi, msjMostrarMatriz
	sub rsp, 8
	call printf
	add rsp, 8

loopFilaImprimir:

	mov rax, qword[cantVertices]
	cmp qword[fila], rax
	jg finImprimir

	mov qword[columna], 1
	call loopColumnaImprimir

	mov rax, 0
	mov rdi, msjNewLine
	sub rsp, 8
	call printf 
	add rsp, 8

	inc qword[fila]
	jmp loopFilaImprimir

finImprimir:

	ret

loopColumnaImprimir:

	mov rax, qword[cantVertices]
	cmp qword[columna], rax
	jg finLoopColumnaImprimir

	mov rax, qword[fila]
	dec rax
	imul rax, qword[longFila]

	mov rbx, rax

	mov rax, qword[columna]
	dec rax
	imul rax, 8

	add rbx, rax
	mov rax, qword[matrizAdy + rbx]

	mov qword[elemento], rax

	mov rax, 0
	mov rdi, msjElementoMatriz
	mov rsi, qword[elemento]
	sub rsp, 8
	call printf
	add rsp, 8

	inc qword[columna]
	jmp loopColumnaImprimir

finLoopColumnaImprimir:

	ret

; ########## FUNCION CHECKALIGN, UTILIZADA PARA SSCANF ########## 
checkAlign:
	push rax
	push rbx
	push rdx
	push rdi

	mov qword[plusRsp],0
	mov	rdx,0

	mov	rax,rsp		
	add rax,8		
	add	rax,32	
	
	mov	rbx,16
	idiv rbx			

	cmp  rdx,0		
	je	finCheckAlign

	mov   qword[plusRsp],8

finCheckAlign:
	pop rdi
	pop rdx

	pop rbx
	pop rax
	ret
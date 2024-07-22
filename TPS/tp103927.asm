; Enunciado del Trabajo Práctico
; Trabajo Práctico: Operaciones con Matrices en Lenguaje Ensamblador

; Objetivo
; Desarrollar un programa en lenguaje ensamblador que permita al usuario ingresar y 
; operar con matrices. El programa debe permitir realizar las siguientes operaciones:

; - Ingresar múltiples matrices.
; - Restar dos o más matrices.
; - Verificar si dos matrices son iguales.
; - Multiplicar una matriz por un escalar.
; - Modificar el valor de un elemento específico de una matriz.
; - Consultar el valor de un elemento específico de una matriz.
; - Finalizar el programa.



global main
extern puts
extern gets
extern sscanf
extern printf

section .data
;Mensajes
    msjIngMatriz                db  "De la matriz %li",10,0
    msjIngMatrizFil             db  "ingrese el elemento en la fila %li columna %li, debe ser un numero entre -99 y 99",10,0
    msjIngCantMatrices          db  "Ingrese la cantidad de matrices con las que va a operar, debe ser un numero entre 2 y 5",0
    msjIngCantFilCol            db  "Ingrese la cantidad de filas y columnas que tendran las matrices, separados por un espacio, deben ser ambos numeros entre 1 y 8",0
    msjElementoMatriz           dq  "  %li  ",0
    msjMostrarMatriz            db  "Matrices:",10,0
    msjNewLine                  dw  " ",10,0
    msjCuantasMatrices          db  "Ingrese cuantas matrices quiere restar",0
    msjCualesMatricesRestar     db  "Cuales de las anteriores matrices desea restar? Indicando 1 para la primer matriz, 2 para la segunda y asi sucesivamente. Ingrese en el orden que desea restarlas, el primer numero, enter, el segundo, enter, etc",0
    msjResultadoResta           db  "Resultado de la resta: ",0
    msjCualesMatricesIgualar    db  "Ingrese los numeros de las dos matrices que desea igualar, primero uno, enter, luego el segundo",0
    msjMatricesDistintas        db  "Las matrices son distintas",0
    msjMatricesIguales          db  "Las matrices son iguales",0
    msjIngMatrizPorEscalar      db  "Ingrese el numero de matriz que desea multiplicar por escalar",0
    msjIngEscalar               db  "Ingrese el escalar para multiplicar por la matriz",0
    msjResultadoMultiplicar     db  "Resultado multiplicacion: ",0
    msjIngNumMatrizElemenMod    db  "Ingrese el numero de matriz que desea modificar",0
    msjIngFilColModificar       db  "Ingrese la fila y la columna del elemento que desea modificar (separadas por un espacio)",0
    msjIngElemento              db  "Ingrese el numero que desea poner en esa fila y columna, debe ser un numero entre -99 y 99",0
    msjIngNumMatrizElemenCon    db  "Ingrese el numero de la matriz que quiere consultar el elemento",0
    msjIngFilColConsultar       db  "Ingrese la fila y la columna del elemento que desea consultar (separadas por un espacio)",0
    msjElementoConsultado       db  "El elemento en esa posicion es: %li",10,0

;Mensajes Invalidos
    msjNumeroInvalido           db  "Numero ingresado invalido",0

;Opciones menu
    msjOpciones                 db  "Ingrese...",0
    opcionUno                   db  "1 para hacer resta de 2 o más matrices",0
    opcionDos                   db  "2 para ver si dos matrices son iguales",0
    opcionTres                  db  "3 para multiplicar una matriz por un valor escalar leído desde teclado",0
    opcionCuatro                db  "4 para modificar el valor de un elemento de una matriz",0
    opcionCinco                 db  "5 para consultar el valor de un elemento de una matriz",0
    opcionSeis                  db  "6 para finalizar el programa",0

;Formato
    formatoInputDosElementos    db  "%hi %hi",0
    formatoInputElemento        db  "%li",0

;Indices y posiciones
    indice                      dq  1
    indiceFila                  dq  1
    indiceCol                   dq  1
    indiceVector                dq  1
    indiceMatriz1               dq  0
    indiceMatriz2               dq  0
    posicionVector              dq  0
    posicionRestar              dq  0
    posicionMatriz1             dq  0
    posicionMatriz2             dq  0
    posicionMultiplicar         dq  0

;Auxiliares
    auxiliarFila                dq  0
    auxiliarCol                 dq  0
    auxiliarImprimir            dq  0
    auxiliarMatrices            dq  0
    auxiliar                    dq  0
    auxiliarGeneral             dq  0

;Elementos
    matrices         times 320 	dq  0
    matrizResta      times 64   dq  0
    matrizMultiplicar   times 64 dq 0

section .bss
    cantMatrices          resq    1
    plusRsp		          resq	  1
    inputDosElementos     resw    50
    fila                  resw    1   
    columna               resw    1
    filas                 resq    1
    elemento              resq    1
    opcion                resq    1
    cantMatricesRestar    resq    1
    matricesRestar      times 5 resq 1
    numMatRestar          resq    1
    inputNumero           resq    1
    columnaConsultar      resw    1
    filaConsultar         resw    1
    matrizAConsultar      resq    1
    matrizARestar         resq    1
    matriz1               resq    1   
    matriz2               resq    1
    elemento1             resq    1
    elemento2             resq    1
    matrizAMultiplicar    resq    1
    escalar               resq    1
    matrizAModificar      resq    1
    filaModificar         resw    1
    columnaModificar      resw    1
    elementoModificado    resq    1

section .text
main:
sub     rsp,8
    call    ingresoCantMatrices
    call    ingresoCantFilCol
    call    ingresoMatrices 

    mov     rcx,1
loopPrograma:
    mov     qword[auxiliarGeneral],rcx
    call    imprimirMatrices
    call    menuDeOpciones

    mov     rcx,qword[auxiliarGeneral]
    inc     rcx
    jnz     loopPrograma
add     rsp,8 
ret

ingresoCantMatrices:
    mov     rdi,msjIngCantMatrices
    call    puts

    mov     rdi,inputNumero
    call    gets

validarCantMatrices:
    mov     rdi,inputNumero 
    mov     rsi,formatoInputElemento
    mov     rdx,cantMatrices

    call    checkAlign
    sub     rsp,[plusRsp]

    call    sscanf  
    add		rsp,[plusRsp]   ;add rsp,32               
    cmp     rax,1                   
    jl      cantMatricesInvalido

    cmp     qword[cantMatrices],2    
    jl      cantMatricesInvalido        
    cmp     qword[cantMatrices],5    
    jg      cantMatricesInvalido
ret

cantMatricesInvalido:
    mov     rdi,msjNumeroInvalido
    call    puts
    jmp     ingresoCantMatrices
ret   

ingresoCantFilCol:
    mov     rdi,msjIngCantFilCol
    call    puts

    mov     rdi,inputDosElementos
    call    gets

validarFilCol:
    mov     rdi,inputDosElementos         
    mov     rsi,formatoInputDosElementos  
    mov     rdx,fila                
    mov     rcx,columna             
    call    checkAlign
    sub     rsp,[plusRsp]

    call    sscanf  
    add		rsp,[plusRsp]   ;add rsp,32    
    cmp     rax,2                   
    jl      filColInvalido

    cmp     word[fila],1    
    jl      filColInvalido        
    cmp     word[fila],8    
    jg      filColInvalido        

    cmp     word[columna],1 
    jl      filColInvalido        
    cmp     word[columna],8 
    jg      filColInvalido        
ret

filColInvalido:
    mov     rdi,msjNumeroInvalido
    call    puts
    jmp     ingresoCantFilCol
ret

ingresoMatrices:
    sub     rcx,rcx               
    mov     rcx,qword[cantMatrices] 

loopMensajeIngMatrices:
    push    rcx

    mov     rdi,msjIngMatriz
    mov     rsi,qword[indice]
    call    printf

    sub     rcx,rcx             
    mov     cx,word[fila]

loopMensajeFila:
    mov     qword[auxiliarFila],rcx

    sub     rcx,rcx             
    mov     cx,word[columna]

loopMensajeColumna:
    mov     qword[auxiliarCol],rcx

imprimirMsj:
    mov     rdi,msjIngMatrizFil
    mov     rsi,qword[indiceFila]
    mov     rdx,qword[indiceCol]
    call    printf

    mov     rdi,inputNumero
    call gets

validarElemento:
    mov     rdi,inputNumero       
    mov     rsi,formatoInputElemento 
    mov     rdx,elemento
    call    checkAlign
    sub     rsp,[plusRsp]

    call    sscanf  
    add		rsp,[plusRsp]   ;add rsp,32    
    
    cmp     rax,1                  
    jl      elementoInvalido

    cmp     qword[elemento],-99    
    jl      elementoInvalido        
    cmp     qword[elemento],99    
    jg      elementoInvalido               

    sub     rbx,rbx
    mov     rbx,qword[indiceVector]
    sub     rbx,1
    
    imul    rbx,rbx,8
    mov     qword[posicionVector],rbx 
    mov     rdx,qword[elemento]
    
    mov     qword[matrices+rbx],rdx
    inc     qword[indiceVector]

    inc     qword[indiceCol]
    mov     rcx,qword[auxiliarCol]
    dec     rcx
    jnz     loopMensajeColumna

    mov     qword[indiceCol],1
    inc     qword[indiceFila]
    mov     rcx,qword[auxiliarFila]
    dec     rcx
    jnz     loopMensajeFila

    mov     qword[indiceFila],1
    inc     qword[indice]
    pop     rcx
    dec     rcx
    jnz     loopMensajeIngMatrices
ret

elementoInvalido:
    mov     rdi,msjNumeroInvalido
    call    puts
    jmp     imprimirMsj
ret

menuDeOpciones:
    call    mostrarMenu

    cmp     qword[opcion],1                   
    je      restaDeMatrices

    cmp     qword[opcion],2
    je      igualdadDeMatrices

    cmp     qword[opcion],3
    je      matrizPorEscalar

    cmp     qword[opcion],4
    je      modificiarValorDeMatriz

    cmp     qword[opcion],5
    je      consultarValorDeMatriz

    cmp     qword[opcion],6
    je      finalizarPrograma
ret

mostrarMenu:
    mov     rdi,msjOpciones
    call    puts
    mov     rdi,opcionUno
    call    puts
    mov     rdi,opcionDos
    call    puts
    mov     rdi,opcionTres
    call    puts
    mov     rdi,opcionCuatro
    call    puts
    mov     rdi,opcionCinco
    call    puts
    mov     rdi,opcionSeis
    call    puts    

    mov     rdi,inputNumero
    call    gets

    call    validarOpcion
ret

validarOpcion:
    mov     rdi,inputNumero
    mov     rsi,formatoInputElemento
    mov     rdx,opcion

    call    checkAlign
    sub     rsp,[plusRsp]
    call    sscanf  
    add		rsp,[plusRsp]   ;add rsp,32  

    cmp     rax,1                   
    jl      opcionInvalida

    cmp     qword[opcion],1    
    jl      opcionInvalida        
    cmp     qword[opcion],6    
    jg      opcionInvalida
ret

opcionInvalida:
    mov     rdi,msjNumeroInvalido
    call    puts
    jmp     mostrarMenu
ret

restaDeMatrices:
    call    mostarMsjCuantasMatricesRestar

    call    mostrarMsjCualesMatricesRestar

calculoDesplazamientoPrimerMatriz:
    sub     rbx,rbx
    mov     bx,word[fila]
    imul    bx,word[columna]
    sub     rcx,rcx
    mov     rcx,rbx
    mov     qword[auxiliar],rcx

    mov     rax,qword[matricesRestar]
    dec     rax
    imul    rbx,rax
    mov     qword[indiceVector],rbx
    imul    rbx,rbx,8
    mov     qword[posicionVector],rbx
    mov     qword[posicionRestar],0
    mov     qword[indiceFila],0

    
loopGuardarMatriz:
    sub     rax,rax
    mov     rbx,qword[posicionVector]
    mov     rax,qword[matrices+rbx]
    sub     rbx,rbx
    mov     rbx,qword[posicionRestar]
    mov     qword[matrizResta+rbx],rax

    inc     qword[indiceVector]
    mov     rbx,qword[indiceVector]
    imul    rbx,rbx,8
    mov     qword[posicionVector],rbx
    inc     qword[indiceFila]
    mov     rbx,qword[indiceFila]
    imul    rbx,rbx,8
    mov     qword[posicionRestar],rbx

    mov     rcx,qword[auxiliar]
    dec     rcx
    mov     qword[auxiliar],rcx
    jnz     loopGuardarMatriz

    mov     qword[indice],1
    
    sub     rcx,rcx
    mov     rcx,qword[cantMatricesRestar]
    dec     rcx

loopMatrizRestar:
    mov     qword[auxiliarMatrices],rcx

    sub     rbx,rbx
    mov     rbx,qword[indice]
    imul    rbx,rbx,8
    mov     rax,qword[matricesRestar+rbx]
    mov     qword[matrizARestar],rax

    sub     rbx,rbx
    mov     bx,word[fila]
    imul    bx,word[columna]
    dec     qword[matrizARestar]
    imul    rbx,qword[matrizARestar]
    mov     qword[indiceFila],rbx

    mov     qword[indiceVector],0

    sub     rbx,rbx
    mov     bx,word[fila]
    imul    bx,word[columna]
    mov     rcx,rbx

loopResta:
    mov     qword[auxiliar],rcx

    mov     rbx,qword[indiceFila]
    imul    rbx,rbx,8
    mov     qword[posicionRestar],rbx

    mov     rax,qword[matrices+rbx]

    mov     rbx,qword[indiceVector]
    imul    rbx,rbx,8
    mov     qword[posicionVector],rbx

    sub     qword[matrizResta+rbx],rax

    inc     qword[indiceVector]
    inc     qword[indiceFila]
    mov     rcx,qword[auxiliar]
    dec     rcx
    jnz     loopResta
    
    inc     qword[indice]
    mov     rcx,qword[auxiliarMatrices]
    dec     rcx
    jnz     loopMatrizRestar

imprimirMatrizResta:
    mov     qword[auxiliarImprimir],0
    mov     rbx,0
    
    mov     rdi,msjResultadoResta
    call    puts

    sub rcx,rcx
    mov cx,word[fila]

loopImprimirFil:
    mov     qword[auxiliarFila],rcx
    sub     rcx,rcx
    mov     cx,word[columna]

loopImprimirElemCol:
    mov     qword[auxiliarCol],rcx

    mov     rax,qword[matrizResta+rbx]
    mov     qword[elemento],rax

    mov     rdi,msjElementoMatriz
    mov     rsi,qword[elemento]
    
    sub rsp, 8
	call printf
	add rsp, 8

    inc     qword[auxiliarImprimir]
    imul    rbx,qword[auxiliarImprimir],8

    mov     rcx,qword[auxiliarCol]
    dec     rcx
    jnz     loopImprimirElemCol

    mov     rdi,msjNewLine
    call    puts

    mov     rcx,qword[auxiliarFila]
    dec     rcx
    jnz     loopImprimirFil
ret

mostarMsjCuantasMatricesRestar:
    mov     rdi,msjCuantasMatrices
    call    puts

    mov     rdi,inputNumero
    call    gets

    call    validarCantMatricesRestar
ret

validarCantMatricesRestar:
    mov     rdi,inputNumero 
    mov     rsi,formatoInputElemento
    mov     rdx,cantMatricesRestar

    call    checkAlign
    sub     rsp,[plusRsp]

    call    sscanf  
    add		rsp,[plusRsp]   ;add rsp,32  

    cmp     rax,1                   
    jl      cantMatricesRestarInvalido

    cmp     qword[cantMatricesRestar],2    
    jl      cantMatricesRestarInvalido    
    mov     rcx,qword[cantMatrices]    
    cmp     qword[cantMatricesRestar],rcx 
    jg      cantMatricesRestarInvalido
ret

cantMatricesRestarInvalido:
    mov     rdi,msjNumeroInvalido
    call    puts
    jmp     mostarMsjCuantasMatricesRestar
ret

mostrarMsjCualesMatricesRestar:
    mov     rdi,msjCualesMatricesRestar
    call    puts

    mov     qword[posicionVector],0
    mov     qword[indiceVector],0

    sub     rcx,rcx
    mov     rcx,qword[cantMatricesRestar]

ingresoMatricesARestar:
    mov     qword[auxiliarMatrices],rcx
    mov     rdi,inputNumero
    call    gets

    call    validarNumMatRestar

    mov     rcx,qword[auxiliarMatrices]
    dec     rcx
    jnle     ingresoMatricesARestar
ret

validarNumMatRestar:
    mov     rdi,inputNumero
    mov     rsi,formatoInputElemento
    mov     rdx,numMatRestar

    call    checkAlign
    sub     rsp,[plusRsp]

    call    sscanf  
    add		rsp,[plusRsp]   ;add rsp,32               
    cmp     rax,1                   
    jl      numMatRestarInvalido

    cmp     qword[numMatRestar],1    
    jl      numMatRestarInvalido    
    mov     rcx,qword[cantMatrices]    
    cmp     qword[numMatRestar],rcx 
    jg      numMatRestarInvalido

    mov     rdx,qword[numMatRestar]
    mov     rbx,qword[posicionVector]
    mov     qword[matricesRestar+rbx],rdx
    inc     qword[indiceVector]
    imul    rbx,qword[indiceVector],8
    mov     qword[posicionVector],rbx
ret

numMatRestarInvalido:
    mov     rdi,msjNumeroInvalido
    call    puts
    jmp     mostrarMsjCualesMatricesRestar
ret

igualdadDeMatrices:
    call    ingresarNumMatricesIgualar

igualarMatrices:
    sub     rbx,rbx
    mov     bx,word[fila]
    imul    bx,word[columna]
    dec     qword[matriz1]
    imul    rbx,qword[matriz1]
    mov     qword[indiceMatriz1],rbx

    sub     rbx,rbx
    mov     bx,word[fila]
    imul    bx,word[columna]
    mov     rcx,rbx
    dec     word[matriz2]
    imul    rbx,qword[matriz2]
    mov     qword[indiceMatriz2],rbx

loopIgualar:
    mov     qword[auxiliarMatrices],rcx
    mov     rbx,qword[indiceMatriz1]
    imul    rbx,rbx,8
    mov     qword[posicionMatriz1],rbx

    mov     rax,qword[matrices+rbx]
    mov     qword[elemento1],rax

    mov     rbx,qword[indiceMatriz2]
    imul    rbx,rbx,8
    mov     qword[posicionMatriz2],rbx

    mov     rax,qword[matrices+rbx]
    mov     qword[elemento2],rax

    cmp     qword[elemento1],rax
    jne     matricesDistintas
    inc     qword[indiceMatriz1]
    inc     qword[indiceMatriz2]

    mov     rcx,qword[auxiliarMatrices]
    dec     rcx
    jnz     loopIgualar

    jmp     matricesIguales
ret

matricesIguales:
    mov     rdi,msjMatricesIguales
    call    puts
ret

matricesDistintas:
    mov     rdi,msjMatricesDistintas
    call    puts
ret

ingresarNumMatricesIgualar:
    mov     rdi,msjCualesMatricesIgualar
    call    puts

    mov     rdi,inputNumero
    call    gets

validarPrimezMatriz:
    mov     rdi,inputNumero       
    mov     rsi,formatoInputElemento
    mov     rdx,matriz1                
    call    checkAlign
    sub     rsp,[plusRsp]

    call    sscanf  
    add		rsp,[plusRsp]   ;add rsp,32    
    cmp     rax,1                   
    jl      matricesInvalidas

    cmp     qword[matriz1],1    
    jl      matricesInvalidas 
    mov     rcx,qword[cantMatrices]       
    cmp     qword[matriz1],rcx  
    jg      matricesInvalidas

ingresarSegundaMatrizIgualar:
    mov     rdi,inputNumero
    call    gets

    mov     rdi,inputNumero      
    mov     rsi,formatoInputElemento
    mov     rdx,matriz2                
    call    checkAlign
    sub     rsp,[plusRsp]

    call    sscanf  
    add		rsp,[plusRsp]   ;add rsp,32    
    cmp     rax,1                   
    jl      matricesInvalidas

    cmp     qword[matriz2],1 
    jl      matricesInvalidas  
    mov     rcx,qword[cantMatrices]      
    cmp     qword[matriz2],rcx 
    jg      matricesInvalidas
ret

matricesInvalidas:
    mov     rdi,msjNumeroInvalido
    call    puts
    jmp     ingresarNumMatricesIgualar
ret

matrizPorEscalar:
    call    ingresoNumMatrizPorEscalar

    call    ingresarEscalar

    sub     rbx,rbx
    mov     bx,word[fila]
    imul    bx,word[columna]
    mov     rcx,rbx
    dec     qword[matrizAMultiplicar]
    imul    rbx,qword[matrizAMultiplicar]
    mov     qword[indiceVector],rbx

    mov     qword[indice],0

loopMultiplicarMatriz:
    mov     qword[auxiliarMatrices],rcx

    mov     rbx,qword[indiceVector]
    imul    rbx,rbx,8
    mov     qword[posicionVector],rbx

    mov     rax,qword[matrices+rbx]
    imul    rax,qword[escalar]

    mov     rbx,qword[indice]
    imul    rbx,rbx,8
    mov     qword[posicionMultiplicar],rbx

    mov     qword[matrizMultiplicar+rbx],rax

    inc     qword[indice]
    inc     qword[indiceVector]
    mov     rcx,qword[auxiliarMatrices]
    dec     rcx
    jnz     loopMultiplicarMatriz

imprimirMatrizMultiplicar:
    mov     qword[auxiliarImprimir],0
    mov     rbx,0
    
    mov     rdi,msjResultadoMultiplicar
    call    puts

    sub rcx,rcx
    mov cx,word[fila]

loopImprimirFilMultiplicar:
    mov     qword[auxiliarFila],rcx
    sub     rcx,rcx
    mov     cx,word[columna]

loopImprimirElemColMultiplicar:
    mov     qword[auxiliarCol],rcx

    mov     rax,qword[matrizMultiplicar+rbx]
    mov     qword[elemento],rax

    mov     rdi,msjElementoMatriz
    mov     rsi,qword[elemento]
    
    sub rsp, 8
	call printf
	add rsp, 8

    inc     qword[auxiliarImprimir]
    imul    rbx,qword[auxiliarImprimir],8

    mov     rcx,qword[auxiliarCol]
    dec     rcx
    jnz     loopImprimirElemColMultiplicar

    mov     rdi,msjNewLine
    call    puts

    mov     rcx,qword[auxiliarFila]
    dec     rcx
    jnz     loopImprimirFilMultiplicar
ret 

ingresoNumMatrizPorEscalar:
    mov     rdi,msjIngMatrizPorEscalar
    call    puts

    mov     rdi,inputNumero
    call    gets

    call    validarNumMatrizXEscalar
ret

validarNumMatrizXEscalar:
    mov     rdi,inputNumero       
    mov     rsi,formatoInputElemento
    mov     rdx,matrizAMultiplicar                
    call    checkAlign
    sub     rsp,[plusRsp]

    call    sscanf  
    add		rsp,[plusRsp]   ;add rsp,32    
    cmp     rax,1                   
    jl      matrizInvalida

    cmp     qword[matrizAMultiplicar],1    
    jl      matrizInvalida
    mov     rcx,qword[cantMatrices]       
    cmp     qword[matrizAMultiplicar],rcx  
    jg      matrizInvalida             
ret

matrizInvalida:
    mov     rdi,msjNumeroInvalido
    call    puts
    jmp     ingresoNumMatrizPorEscalar
ret

ingresarEscalar:
    mov     rdi,msjIngEscalar
    call    puts

    mov     rdi,inputNumero
    call    gets

    call    validarEscalar
ret

validarEscalar:
    mov     rdi,inputNumero    
    mov     rsi,formatoInputElemento
    mov     rdx,escalar                
    call    checkAlign
    sub     rsp,[plusRsp]

    call    sscanf  
    add		rsp,[plusRsp]   ;add rsp,32    
    cmp     rax,1                   
    jl      escalarInvalido
ret

escalarInvalido:
    mov     rdi,msjNumeroInvalido
    call    puts
    jmp     ingresarEscalar
ret

modificiarValorDeMatriz:
    call    ingresarMatrizElementoModificar

    call    ingresarFilColElementoModificar

    call    ingresarElemento

modificarValor:
    sub     rbx,rbx
    mov     bx,word[fila]
    imul    bx,word[columna]
    dec     qword[matrizAModificar]
    imul    rbx,qword[matrizAModificar]
    mov     qword[indiceVector],rbx

    dec     word[filaModificar]
    dec     word[columnaModificar]
    sub     rbx,rbx
    mov     bx,word[filaModificar]
    imul    rbx,qword[columna]
    add     bx,word[columnaModificar]
    add     qword[indiceVector],rbx
    
    mov     rbx,qword[indiceVector]
    imul    rbx,rbx,8
    mov     rax,qword[elementoModificado]
    mov     qword[matrices+rbx],rax
ret

ingresarMatrizElementoModificar:
    mov     rdi,msjIngNumMatrizElemenMod
    call    puts

    mov     rdi,inputNumero
    call    gets

    call    validarNumMatrizModificar
ret

validarNumMatrizModificar:
    mov     rdi,inputNumero   
    mov     rsi,formatoInputElemento
    mov     rdx,matrizAModificar                
    call    checkAlign
    sub     rsp,[plusRsp]

    call    sscanf  
    add		rsp,[plusRsp]   ;add rsp,32    
    cmp     rax,1                   
    jl      matrizInvalidaModificar

    cmp     qword[matrizAModificar],1    
    jl      matrizInvalidaModificar
    mov     rcx,qword[cantMatrices]       
    cmp     qword[matrizAModificar],rcx  
    jg      matrizInvalidaModificar             
ret

matrizInvalidaModificar:
    mov     rdi,msjNumeroInvalido
    call    puts
    jmp     ingresarMatrizElementoModificar
ret

ingresarFilColElementoModificar:
    mov     rdi,msjIngFilColModificar
    call    puts

    mov     rdi,inputDosElementos
    call    gets

    call    validarFilColMatrizModificar
ret

validarFilColMatrizModificar:
    mov     rdi,inputDosElementos       
    mov     rsi,formatoInputDosElementos  
    mov     rdx,filaModificar                
    mov     rcx,columnaModificar             
    call    checkAlign
    sub     rsp,[plusRsp]

    call    sscanf  
    add		rsp,[plusRsp]   ;add rsp,32    
    cmp     rax,2                   
    jl      filColModificarInvalido

    cmp     word[filaModificar],1    
    jl      filColModificarInvalido  
    mov     bx,word[fila]
    cmp     word[filaModificar],bx   
    jg      filColModificarInvalido        

    cmp     word[columnaModificar],1 
    jl      filColModificarInvalido  
    mov     bx,word[columna]      
    cmp     word[columnaModificar],bx
    jg      filColModificarInvalido        
ret

filColModificarInvalido:
    mov     rdi,msjNumeroInvalido
    call    puts
    jmp     ingresarFilColElementoModificar
ret

ingresarElemento:
    mov     rdi,msjIngElemento
    call    puts

    mov     rdi,inputNumero
    call    gets

    call    validarElementoModificado
ret

validarElementoModificado:
    mov     rdi,inputNumero   
    mov     rsi,formatoInputElemento
    mov     rdx,elementoModificado                
    call    checkAlign
    sub     rsp,[plusRsp]

    call    sscanf  
    add		rsp,[plusRsp]   ;add rsp,32    
    cmp     rax,1                   
    jl      elementoModificadoInvalido  

    cmp     qword[elementoModificado],-99    
    jl      elementoModificadoInvalido
    cmp     qword[elementoModificado],99  
    jg      elementoModificadoInvalido           
ret

elementoModificadoInvalido:
    mov     rdi,msjNumeroInvalido
    call    puts
    jmp     ingresarElemento
ret

consultarValorDeMatriz:
    call    ingresarMatrizElementoConsultar

    call    ingresarFilColElementoConsultar

consultarValor:
    sub     rbx,rbx
    mov     bx,word[fila]
    imul    bx,word[columna]
    dec     qword[matrizAConsultar]
    imul    rbx,qword[matrizAConsultar]
    mov     qword[indiceVector],rbx

    dec     word[filaConsultar]
    dec     word[columnaConsultar]
    sub     rbx,rbx
    mov     bx,word[filaConsultar]
    imul    rbx,qword[columna]
    add     bx,word[columnaConsultar]
    add     qword[indiceVector],rbx
    
    mov     rbx,qword[indiceVector]
    imul    rbx,rbx,8

    mov     rdi,msjElementoConsultado
    mov     rsi,qword[matrices+rbx]
    
    sub rsp, 8
	call printf
	add rsp, 8
ret

ingresarMatrizElementoConsultar:
    mov     rdi,msjIngNumMatrizElemenCon
    call    puts

    mov     rdi,inputNumero
    call    gets

    call    validarNumMatrizConsultar
ret

validarNumMatrizConsultar:
    mov     rdi,inputNumero 
    mov     rsi,formatoInputElemento
    mov     rdx,matrizAConsultar                
    call    checkAlign
    sub     rsp,[plusRsp]

    call    sscanf  
    add		rsp,[plusRsp]   ;add rsp,32    
    cmp     rax,1                   
    jl      matrizInvalidaConsultar

    cmp     qword[matrizAConsultar],1    
    jl      matrizInvalidaConsultar
    mov     rcx,qword[cantMatrices]       
    cmp     qword[matrizAConsultar],rcx  
    jg      matrizInvalidaConsultar             
ret

matrizInvalidaConsultar:
    mov     rdi,msjNumeroInvalido
    call    puts
    jmp     ingresarMatrizElementoConsultar
ret

ingresarFilColElementoConsultar:
    mov     rdi,msjIngFilColConsultar
    call    puts

    mov     rdi,inputDosElementos
    call    gets

    call    validarFilColMatrizConsultar
ret

validarFilColMatrizConsultar:
    mov     rdi,inputDosElementos     
    mov     rsi,formatoInputDosElementos  
    mov     rdx,filaConsultar                
    mov     rcx,columnaConsultar             
    call    checkAlign
    sub     rsp,[plusRsp]

    call    sscanf  
    add		rsp,[plusRsp]   ;add rsp,32    
    cmp     rax,2                   
    jl      filColConsultarInvalido

    cmp     word[filaConsultar],1    
    jl      filColConsultarInvalido  
    mov     bx,word[fila]
    cmp     word[filaConsultar],bx   
    jg      filColConsultarInvalido        

    cmp     word[columnaConsultar],1 
    jl      filColConsultarInvalido  
    mov     bx,word[columna]      
    cmp     word[columnaConsultar],bx
    jg      filColConsultarInvalido        
ret

filColConsultarInvalido:
    mov     rdi,msjNumeroInvalido
    call    puts
    jmp     ingresarFilColElementoConsultar
ret
    
imprimirMatrices:
    mov qword[auxiliarImprimir],0
	mov rax, 0
	mov rdi, msjMostrarMatriz
	sub rsp, 8
	call printf
	add rsp, 8

    sub rbx,rbx
    mov rbx,0

    sub rcx,rcx
    mov rcx,qword[cantMatrices]   

loopImprimir:
    mov qword[auxiliarMatrices],rcx

    sub rcx,rcx
    mov cx,word[fila]

loopImprimirFilas:
    mov     qword[auxiliarFila],rcx
    sub     rcx,rcx
    mov     cx,word[columna]

loopImprimirElementoCol:
    mov     qword[auxiliarCol],rcx

    mov     rax,qword[matrices+rbx]
    mov     qword[elemento],rax

    mov     rdi,msjElementoMatriz
    mov     rsi,qword[elemento]
    
    sub rsp, 8
	call printf
	add rsp, 8

    inc     qword[auxiliarImprimir]
    imul    rbx,qword[auxiliarImprimir],8

    mov     rcx,qword[auxiliarCol]
    dec     rcx
    jnz     loopImprimirElementoCol

    mov     rdi,msjNewLine
    call    puts

    mov     rcx,qword[auxiliarFila]
    dec     rcx
    jnz     loopImprimirFilas

    mov     rdi,msjNewLine
    call    puts

    mov     rcx,qword[auxiliarMatrices]
    dec     rcx
    jnz     loopImprimir
ret

finalizarPrograma:
    mov     qword[auxiliarGeneral],-1
ret
;--------------------------------------------------------
;           CheckAlign
;--------------------------------------------------------
checkAlign:
	push rax
	push rbx
;	push rcx
	push rdx
	push rdi

	mov   qword[plusRsp],0
	mov		rdx,0

	mov		rax,rsp		
	add     rax,8		;para sumar lo q restó la CALL 
	add		rax,32	;para sumar lo que restaron las PUSH
	
	mov		rbx,16
	idiv	rbx			;rdx:rax / 16   resto queda en RDX

	cmp     rdx,0		;Resto = 0?
	je		finCheckAlign
;mov rdi,msj
;call puts
	mov   qword[plusRsp],8
finCheckAlign:
	pop rdi
	pop rdx
;	pop rcx
	pop rbx
	pop rax
	ret
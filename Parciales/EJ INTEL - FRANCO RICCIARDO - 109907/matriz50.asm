;*************************************************************************************************
; francoricciardoW.asm  ---> PADRON: 109907
; Se dispone de una matriz (M) de 50x50 elementos que almacena información sobre agroquímicos a aplicar en un campo. Cada 
; elemento de M ocupa 4 bytes y representa una parcela del campo. El primer entero de 2 bytes corresponde a la cantidad de 
; litros de compuesto fungicida a aplicar en esa parcela y el segundo, la cantidad de litros de compuesto fertilizante.
;
; Además, se cuenta con un archivo AGRO.DAT que contiene una recomendación del proveedor sobre las cantidades de agroquímicos 
; a aplicar en cada parcela, con registros de ancho fijo de acuerdo al siguiente formato:
;
;   - 1 byte en BPF c/s indicando el nro. de fila de la parcela (1 a 50)
;   - 1 byte en BPF c/s indicando el nro. de columna de la parcela (1 a 50)
;   - 1 byte en ASCII con los siguientes valores posibles: 'U' para fungicida | 'F' para fertilizante
;   - 2 bytes en BPF sin signo indicando la cantidad de litros de compuesto a aplicar.
;
; Se pide codificar un programa en Assembler de Intel 80x86 que permita:
; 1) Recorrer el archivo de recomendaciones y actualizar la matriz sumando al valor preexistente el valor recomendado en cada registro
; 2) Chequear que los registros del archivo contienen valores válidos para el dominio del problema. 
;    Esta validación deberá realizarse en una rutina aparte con rótulo VALIDA. Los registros no válidos deberán ser descartados.
; 3) Dado un número de fila que se asume ya cargado en un campo llamado filaInforme, mostrar por pantalla la cantidad total de 
;    parcelas que no necesitan fungicida de dicha fila y la cantidad total de litros de fertilizante recomendada para todas 
;    las parcelas también de dicha fila
;*************************************************************************************************

global	main
extern	gets
extern	sscanf
extern  printf
extern	puts
extern  fopen
extern  fread
extern  fclose

section	.data
    fileName        db "agro.dat",0
    modeFile        db "rb",0  ; read | binario | abrir o error
    handleFile      dq 0

    matriz          times   2500  dd 0 ; 2500 porque 50(filas) * 50(cols)

    registerFile    times   0   db ''   ;Longitud total del registro: 5
      fila                      db 0
      columna                   db 0
      compuesto                 db ' '
      litros        times   2   db 0    ;Como es un BPF s/signo no haces falta que lo valide. Siempre sera Positivo ó 0 (Cero)

    arrayCompuestos db  "UF"

    msgCantNOFung   db "La cantidad de parcelas que NO necesitan Fungicida en dicha fila son: %hi",10,0
    contadorFung    dw 0
    msgSumatFerti   db "La cantidad de litros totales que se necesitan de Fertilizante en dicha fila son: %hi",10,0
    cantLitrFerti   dw 0

    filaInforme         db 0    ;Inicializo la filaInforme en 0, por poner un ejemplo rapido para luego testear.
    msgInformeInvalido	db	"El dato filaInforme no es valido, es decir, no esta en el rango [1,2...50]",10,0

    ;*** Para debug
    msgOpenFileOk	db	"El archivo se abrio correctamente",0
    msgErrorOpen	db	"Error en la apertura del archivo",0
    msgReading	    db	"Leyendo...",0
    msgRegisterIsValid	db	"Reg valido",0

section	.bss
	registerIsValid resb    1
   	fieldIsValid	resb	1 ;S valido N invalido
    lineCount       resb    1

section	.text
main:

    call    openFile
    cmp     rax, 0
    jle     errorOpenFile
    mov     [handleFile], rax
    mov     rcx, msgOpenFileOk
    call    printMsg

readNextRegister:
    call    readRegister
    cmp     rax, 0
    jle     EndOfFile
    mov     rcx, msgReading
    call    printMsg

    call    VALIDA
    cmp     byte[registerIsValid],'N'
    je      readNextRegister
    mov     rcx, msgRegisterIsValid
    call    printMsg

;Actualizar la actividad leida del archivo en la matriz
    call    UpdateMatriz
    jmp     readNextRegister

EndOfFile:
    call    mostrarInforme
    call    closeFile
    jmp     endProg

errorOpenFile:
    mov     rcx, msgErrorOpen
    call    printMsg
    jmp     endProg

endProg:
ret 
;*********************************
; RUTINAS INTERNAS
;*********************************
openFile: ;Abro archivo
    mov     rcx, fileName
    mov     rdx, modeFile
    sub     rsp, 32
    call    fopen
    add     rsp, 32
ret

closeFile: ;Cierro archivo
    mov     rcx, [handleFile]
    sub     rsp, 32
    call    fclose
    add     rsp, 32
ret

;*********************************
readRegister:
    mov     rcx, registerFile   ;Param 1: direccion de area de memoria donde se copiaran los datos
    mov     rdx, 5              ;Param 2: longitud del registro completo
    mov     r8, 1               ;Param 3: cant de registros
    mov     r9, [handleFile]    ;Param 4: el handle del archivo a leer para completar el registro
    sub     rsp, 32
    call    fread
    add     rsp, 32
ret

;*********************************
;VALIDAR REGISTROS
VALIDA:
    mov     byte[registerIsValid],'N'

    call    validateFila
    cmp     byte[fieldIsValid],'N'
    je      endValidateRegister

    call    validateColumna
    cmp     byte[fieldIsValid],'N'
    je      endValidateRegister

    call    validateCompuesto
    cmp     byte[fieldIsValid],'N'
    je      endValidateRegister

    mov     byte[registerIsValid],'S'
endValidateRegister:
ret

;*********************************
;VALIDAR FILA
validateFila:
;Verifico si la fila de la parcela esta comprendida en el rango 1-50
    mov     byte[fieldIsValid], 'N'

    cmp     word[fila], 1
    jl      filaError
    cmp     word[fila], 50
    jg      filaError

    mov     byte[fieldIsValid],'S'
filaError:
ret

;*********************************
;VALIDAR COLUMNA
validateColumna:
;Verifico si la columna de la parcela esta comprendida en el rango 1-50
    mov     byte[fieldIsValid], 'N'

    cmp     word[columna], 1
    jl      columnaError
    cmp     word[columna], 50
    jg      columnaError

    mov     byte[fieldIsValid],'S'
columnaError:
ret

;*********************************
validateCompuesto:
;Verifico mediante una validacion por tabla, si el compuesto recibido es valido: 'U' para fungicida | 'F' para fertilizante
    mov     byte[fieldIsValid], 'S'

    mov     rbx, 0              ;Utilizo el rbx como puntero al vector arrayCompuestos
    mov     rcx, 2              ;Contador por las 2 opciones de la "tabla" de compuestos

nextCompuesto:
    push    rcx                     ;Con el push, me guardo el contador en la pila
    mov     rcx, 1                  ;1 porq es long de cada string de los Compuestos en el "vector"
    lea     rsi, [compuesto]        ;mov rsi,compuesto tambien podia ser
    lea     rdi, [arrayCompuestos + rbx]
    repe cmpsb
    pop     rcx                     ;Con el pop, recupero el contador de la pila

    je      CompuestoOk             ;Si es valido el compuesto, sigo a la siguiente validacion
    loop    nextCompuesto

    mov     byte[fieldIsValid],'N'
CompuestoOk:
ret

;*********************************
UpdateMatriz:
;  [(fila-1)*longFila]  + [(columna-1)*longElemento]
;  longFila = longElemento * cantidad columnas
;  FILAS: (50) / COLUMNAS: (50)

    mov     rax, 0
    mov     rbx, 0

    sub     byte[columna], 1     ;Resto a [columna] un 1 para hacer el desplaz. columnas
    mov     al, byte[columna]    ;Copio el [columna] al registro AL
    mov     bl, 4
    mul     bl           ;Multiplico por long. elem (Cols*4bytes) = desplaz. cols y resultado en AX

    mov     rdx, rax    ;[aca guardo, en el rdx, el desplaz. de columnas]

    mov     rax, 0
    sub     byte[fila], 1             ;Resto a [fila] un 1 para hacer el desplaz. filas
    mov     al, byte[fila]      ;Copio el [fila] al registro AL
    mov     bl, 200
    mul     bl            ;Multiplico 200 porque la longFila = (4 bytes) * (50 cols)
;en rax tengo el desplazamiento fila

    add     rax,rdx     ;[sumo ambos desplaz y tengo el desplaz total en RAX]

    cmp     byte[compuesto], 'F'
    je      actualizarFertilizante

;Si llegue aca es porque los litros a actualizar es el del compuesto Fungicida
    mov     bx, word[matriz + rax]  ;obtengo la cant. requerida de litros a aplicar del primer compuesto (Fungicida) en la matriz
    add     bx, [litros]            ;Le sumo los litros indicados registro
    mov     word[matriz + rax], bx  ;Vuelvo a almacenar la cant. de litros a aplicar de Fungicida, en la matriz

actualizarFertilizante:
;Si salto aca es porque los litros a actualizar es el del compuesto Fertilizante
    add     rax, 2                  ;Sumo 2 al desplaz, porque los dos datos de la matriz se subdividen en 2 bytes. Asi avanzo al subdato Fertilizante
    mov     bx, word[matriz + rax]  ;obtengo la cant. de litros a aplicar del segundo compuesto (Fertilizante) en la matriz
    add     bx, [litros]            ;Le sumo los litros indicados en el registro
    mov     word[matriz + rax], bx  ;Vuelvo a almacenar la cant. de litros a aplicar de Fertilizante, en la matriz

ret

;*********************************
mostrarInforme:
    mov     rbx, 0
    mov     bl, byte[filaInforme]
    add     bl, 5
    mov     byte[filaInforme], bl
;Esas primeras 4 lineas las use para testear, poniendo una filaInforma valida.

;Valido por rango si el numero filaInforme ya cargao este entre 1 y 50
    cmp     byte[filaInforme], 1
    jl      filaInformeInvalida
    cmp     byte[filaInforme], 50
    jg      filaInformeInvalida

;Ya tengo el num ingresado [1..50] en binario (1 byte) filaInforme
    
    mov     rax, 0
    mov     rbx, 0
    mov     rdx, 0   ;Como todavia no quiero moverme en columnas, inicializo el rdx en 0. Ese 0 equivale al desplaz en columnas

    sub     byte[filaInforme], 1       ;Resto a [filaInforme] un 1 para hacer el desplaz. filas
    mov     al, byte[filaInforme]      ;Copio el [filaInforme] al registro AL
    mov     bl, 200
    mul     bl                  ;Multiplico 200 porque la longFila = (4 bytes) * (50 cols)
;en rax tengo el desplazamiento fila
    
    add     rdx,rax     ;[sumo ambos desplaz y tengo el desplaz total en RDX]

    mov     rcx, 50
    mov     rsi, 0
    mov     rbx, 0      ;Utilizo rbx como auxiliar para levantar cant. de litros a aplicar

repeatDesplazEnFila:
    inc     rax
    mov     bx, word[matriz + rdx]  ;agarro la cant. de litros del 1er compuesto (Fungicida) de la matriz
    cmp     rbx, 0                  ;comparo si rbx (dato matriz) es igual que 0
    jl      SigIteracion            ;si NO es asi, entonces sigo avanzando porq no me interesa ese dato

    add     word[contadorFung], 1           ;si SI ES asi, entonces incremento un contador 

    add     rdx, 2
    mov     bx, word[matriz + rdx]      ;Me muevo 2 bytes mas, para asi agarrar la cant. de litros del 2do compuesto (Fertilizante) de la matriz
    add     word[cantLitrFerti], bx     ;Le sumo la cant. de litros a aplicar de Fertilizante a la sumatoria

SigIteracion:
    add     rdx, 2                 ;Avanzo al proximo elemento de la columna (cada subdivision es una word de 2 bytes)
    loop    repeatDesplazEnFila

; Una vez termine el loop, tengo el contador de parcelas que necesitan 0 Fungicida [contadorFung] y
; la sumatoria de litros que se necesitan de Fertilizante [cantLitrFerti]. Asique, solo queda imprimir por pantalla

    mov     rcx, msgCantNOFung
    mov     rdx, [contadorFung]
    sub     rsp, 32
    call    printf
    add     rsp, 32

    mov     rcx, msgSumatFerti
    mov     rdx, [cantLitrFerti]
    sub     rsp, 32
    call    printf
    add     rsp, 32
    jmp     finInforme

filaInformeInvalida:
    mov     rcx, msgInformeInvalido
    call    printMsg
    jmp     finInforme

finInforme:
ret

;*********************************
printMsg:
    sub     rsp, 32
    call    puts
    add     rsp, 32
ret


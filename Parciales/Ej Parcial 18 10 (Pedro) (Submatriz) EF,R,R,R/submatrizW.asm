;****************************************************************************************************
; submatrizW.asm
; Se dispone de una matriz M en memoria de 20x20 en la que cada elemento (i,j) es un BPF c/signo
; de 1 byte y de un archivo SUBMAT.dat que contiene informacion para obtener submatrices dentro
; de la matriz M. Cada registro del archivo cuenta con los siguiente campos:
;       - Empaquetado de 2 bytes para indicar num de fila (F)
;       - Empaquetado de 2 bytes para indicar num de columna (C)
;       - Empaquetado de 2 bytes para indicar la dimesion de la submatriz cuadrada
;         con vertice superior derecho dado por F y C
;
; Se pide: 
; 1 - Codificar un programa en assembler de intel 80x86 que realice la sumatoria de los
; los elementos de la diagonal principal de cada submatriz y muestr por pantalla la mayor de ellas.
; 
; 2 - Codificar una rutina interna VALSM para validar los datos del registro. La rutina debera
; validar que F y C no superen la dimension de M y que la submatriz quede dentro de los limites de M.
;****************************************************************************************************

global	main
extern	printf
extern	puts
extern  fopen
extern  fread
extern  fclose

section	.data
    fileName        db "submat.dat",0
    modeFile        db "rb",0  ; read | binario | abrir o error
    handleFile      dq 0

    matriz          times   400 db 0 ; 400 porque 20(filas) * 20(cols)

    regFile         times   0   db ''   ;Longitud total del registro: 6
      fila          times   2   db ' '    ;2 bytes
      columna       times   2   db ' '    ;2 bytes
      dimension     times   2   db ' '    ;2 bytes

    submatFila      dw 0
    submatCol       dw 0

    msgSumatoriaMax     db "La maxima sumatoria de las diagonales es: %i",0
    mayorSumatoria      dd 0
    sumatoriaDiagonal   dd 0
    cantElemSumados     dw 0
    ;*** Para debug
    msgOpenFileOk	db	"Apertura Listado ok",0
    msgErrorOpen	db	"El archivo no se pudo abrir correctamente",0
    msgReading	db	"Leyendo...",0
    msgRegisterIsValid	db	"Reg valido",0

section	.bss
	registerIsValid resb    1
   	fieldIsValid	resb	1 ;S valido N invalido
	submatIsValid   resb    1
    desplaz			resw	1

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

    call    VALSM
    cmp     byte[registerIsValid],'N'
    je      readNextRegister
    mov     rcx, msgRegisterIsValid
    call    printMsg

    call    calcSumatoria
    call    compareMaxSumat

    jmp     readNextRegister

EndOfFile:
    call    closeFile
    call    printMaxSumat
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
openFile: ;Abro archivo Submat
    mov     rcx, fileName
    mov     rdx, modeFile
    sub     rsp, 32
    call    fopen
    add     rsp, 32
ret

closeFile: ;Cierro archivo Submat
    mov     rcx, [handleFile]
    sub     rsp, 32
    call    fclose
    add     rsp, 32
ret

;*********************************
readRegister:
    mov     rcx, regFile        ;Param 1: direccion de area de memoria donde se copiaran los datos
    mov     rdx, 6              ;Param 2: longitud del registro completo
    mov     r8, 1               ;Param 3: siempre es 1, porq es cant de registros
    mov     r9, [handleFile]    ;Param 1: el handle del archivo a leer para completar el registro
    sub     rsp, 32
    call    fread
    add     rsp, 32
ret

;*********************************
;VALIDAR REG
VALSM:
    mov     byte[registerIsValid],'N'
; pero antes de las validaciones, tengo que pasar los empaquetados a binarios puros
; cargo en fila, columna, dimension los valores leidos

;Conversion de Fila
    mov     r8, 0x00
    mov     r9, 0x00
    mov     r8b, [regFile+1] ;en r8b me guardo las unidades
    mov     r9b, [regFile+1] ;en r9b me guardo las decenas
    and     r8b, 0x0F
    and     r9b, 0xF0
    rol     r9b, 4
    imul    r9, 0x0A    ;multiplico por 10 las decenas
    add     r8b, r9b    ;sumo las unidades
    mov     [fila], r8b 

;Conversion de Columna
    mov     r8, 0x00
    mov     r9, 0x00
    mov     r8b, [regFile+3] ;en r8b me guardo las unidades
    mov     r9b, [regFile+3] ;en r9b me guardo las decenas
    and     r8b, 0x0F
    and     r9b, 0xF0
    rol     r9b, 4
    imul    r9, 0x0A    ;multiplico por 10 las decenas
    add     r8b, r9b    ;sumo las unidades
    mov     [columna], r8b 

;Conversion de Dimension
    mov     r8, 0x00
    mov     r9, 0x00
    mov     r8b, [regFile+5] ;en r8b me guardo las unidades
    mov     r9b, [regFile+5] ;en r9b me guardo las decenas
    and     r8b, 0x0F
    and     r9b, 0xF0
    rol     r9b, 4
    imul    r9, 0x0A    ;multiplico por 10 las decenas
    add     r8b, r9b    ;sumo las unidades
    mov     [dimension], r8b 

;Ahora si, prosigo con la Validacion
    call    validateFila
    cmp     byte[fieldIsValid],'N'
    je      endValidateRegister

    call    validateCol
    cmp     byte[fieldIsValid],'N'
    je      endValidateRegister

    call    validateDim
    cmp     byte[fieldIsValid],'N'
    je      endValidateRegister

    call    validateSubmat
    cmp     byte[submatIsValid],'N'
    je      endValidateRegister

    mov     byte[registerIsValid],'S'
endValidateRegister:
ret

;*********************************
;VALIDAR FILA
validateFila:
    mov     byte[fieldIsValid], 'N'

    cmp     word[fila], 1
    jl      filaInvalida
    cmp     word[fila], 20
    jg      filaInvalida

    mov     byte[fieldIsValid],'S'
filaInvalida:
ret

;*********************************
;VALIDAR COLUMNA
validateCol:
    mov     byte[fieldIsValid], 'N'

    cmp     word[columna], 1
    jl      columnaInvalida
    cmp     word[columna], 20
    jg      columnaInvalida

    mov     byte[fieldIsValid],'S'
columnaInvalida:
ret

;*********************************
;VALIDAR DIMENSION
validateDim:
    mov     byte[fieldIsValid], 'N'

    cmp     word[dimension], 1
    jl      dimensionInvalida
    cmp     word[dimension], 20
    jg      dimensionInvalida

    mov     byte[fieldIsValid],'S'
dimensionInvalida:
ret

;*********************************
;VALIDAR DIMENSION
validateSubmat:
;tengo las coordenadas de la esquina superior derecha de la matriz,
;si la fila de la coordenada + la dimension de la submat - 1 esta dentro del rango 1-20 y
;si la columna de la coordenada - la dimension de la submat - 1 esta dentro del rango 1-20
; entonces la submatriz esta dentro de la matriz y es valida
    mov     byte[submatIsValid], 'N'
    mov     ax, [fila]
    mov     bx, [columna]
    mov     cx, [dimension]
    dec     cx          ; dimension - 1
    add     ax, cx      ; realizo filaSubmatriz = fila + (dimension - 1)
    cmp     ax, 20
    jg      matrizInvalida

    sub     bx, cx      ; realizo columbaSubmatriz = columna - (dimension - 1)
    cmp     bx, 1
    jl      matrizInvalida

; SUBMATRIZ VALIDA, cargo en fila y columna el primer elemento de la diag principal 

    mov     [submatCol], bx ;asigno bx a columna, ya que en bx esta la COL del 1er elemento de la diag principal 
    mov     ax, [fila]
    mov     [submatFila], ax ;asigno la fila

    mov     byte[fieldIsValid],'S'
matrizInvalida:
ret

;*********************************
calcDesplaz:
;  [(fila-1)*longFila]  + [(columna-1)*longElemento]
;  longFila = longElemento * cantidad columnas
    mov     rbx, 0x00
    mov     bx, word[submatFila] ;(fila)
    sub     bx,1    ; (fila-1)
    imul    bx,bx,20    ; 20 porque la longFila = longElemento (1 bytes) * cantCols (20 cols)
;en bx tengo el desplazamiento a la fila
    mov     [desplaz],rbx   ;Guardo el parcial en desplaz

    mov     rbx, 0x00
    mov     bx, word[submatCol] ;(col)
    dec     bx      ; (col-1)
    ; no hace falta hacer la mutiplicacion *longElem porq es 1 byte, osea *1

    add     [desplaz],rbx    ;y ahora, en desplaz tengo el desplazamiento total
ret

;*********************************
calcSumatoria:
    mov     cx, word[dimension]
sumarSiguiente:
    cmp     word[cantElemSumados], cx
    je      finSumatoria

    call	calcDesplaz
    mov     r9, matriz
    mov     r10, [desplaz]
    add     r9, r10  ;obtengo en r9 la pos absoluta del elemento como matriz+desplaz
    mov     al, byte[r9] ;cargo en el AL el byte apuntado por r9 para sumarlo
    cbw     ;extiendo el AL a 16 bits (2bytes) para sumarlo con su signo en 16bits
    add     [sumatoriaDiagonal], ax

;Incremento en uno a fila y columna para pasar al siguiente miembro de la diag principal
    inc     word[submatFila]
    inc     word[submatCol]     
    inc     word[cantElemSumados]
    jmp     sumarSiguiente

finSumatoria:
ret

;*********************************
;Determina si la sumatoria recien calculada es mayor a la ya registrada como mayor sumat
compareMaxSumat:
    mov     eax, [sumatoriaDiagonal]
    cmp     eax, [mayorSumatoria]
    jl      ActualIsLower

    mov     [mayorSumatoria], eax

ActualIsLower:
ret

;*********************************
printMaxSumat:
    mov     rcx, msgSumatoriaMax
    mov     rdx, [mayorSumatoria]
    sub     rsp, 32
    call    printf
    add     rsp, 32
ret

;*********************************
printMsg:
    sub     rsp, 32
    call    puts
    add     rsp, 32
ret


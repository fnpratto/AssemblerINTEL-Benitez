;*************************************************************************************************
; edificio.asm
;Ej Parcial (1ra Oportunidad - 16-06-2020) (Dptos) F,R,R
; Se dispone de una matriz 12x12 que representa un edificio nuevo a estranar, donde tiene
;12 pisos con 12 departamentos en cada uno.
; Cada elemento de la matriz es un binario de 4 bytes, donde guarda un precio de venta en U$S de 
;cada departamento. Se dispone de
; un archivo (PRECIOS.dat) que contiene los precios de los departamentos, donde cada 
;registro del archivo contiene los sig campos:
;       - Piso: Caracter de 2 bytes
;       - Departamento: Binario de 1 byte
;       - Precio Venta: Binario de 4 bytes
;
; Se pide realizar un programa en assembler Intel 80x86 que realice la carga de la 
;matriz a través del archivo. Como la informacion 
; del archivo puede ser incorrecta se debera validar haciendo uso de una rutina interna (VALREG) que descartará los registros
; invalidos (la rutina deberá validar todos los campos del registro).  
;
; Una vez finalizada la carga, se solicitara ingresar por teclado un numero (x) y un 
;precio de venta (no se requieren validar) y se
; debera mostrar todos los departamentos/pisos cuyo precio de venta sea menor al ingresado.
;      - Para alumnos con Padrón Par, x será un numero de piso y se debera mostrar por pantalla todos los numeros de 
;                     departamento cuyo precio sea inferior al ingresado en el piso ingresado.
;
;      - Para alumnos con Padrón Impar, x será un numero de departamento y se debera mostrar por pantalla todos los numeros de 
;                     piso donde el departamento ingresado tenga precio inferior al ingresado.
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
    fileEdificio    db "PRECIOS.dat",0
    modeEdificio    db "rb",0  ; read | binario | abrir o error
    handleEdificio  dq 0

    matriz          times   144  dd 0 ; 144 porque 12(filas) * 12(cols)

    regApartment    times   0   db ''   ;Longitud total del registro: 7
      piso          times   2   db ' '
      dpto                      db 0
      precio                    dd 0
    
    pisoAux         db  "**",0
    pisoFormat      db  "%hi",0 ;16 bits (word)
    pisoNum         dw  0       ;16 bits (word)


    msgAskPrice     db  "Ingrese un precio de departamento",13,0
    msgAskX         db  "Ingrese un numero valido [1,2...12]",13,0
    priceFormat     db  "%i"    ; %i 32 bits / %lli 64 bits
    msgMenorDpto    db  "El dpto X (num Ingresado) tiene un precio menor al pedido en el piso: %hi ",0

    ;*** Para debug
    msgOpenFileOk	db	"El archivo se abrio correctamente",
    msgErrorOpen	db	"Error en la apertura del archivo",0
    msgReading	    db	"Leyendo...",0
    msgRegisterIsValid	db	"Reg valido",0

section	.bss
	registerIsValid resb    1
   	fieldIsValid	resb	1 ;S valido N invalido
    bufferX         resb    10
    bufferPrice     resb    10
    numIng          resw    1
    priceIng        resd    1

section	.text
main:

    call    openEdificio
    cmp     rax, 0
    jle     errorOpenFile
    mov     [handleEdificio], rax
    mov     rcx, msgOpenFileOk
    call    printMsg

readNextRegister:
    call    readRegister
    cmp     rax, 0
    jle     EndOfFile
    mov     rcx, msgReading
    call    printMsg

    call    VALREG
    cmp     byte[registerIsValid],'N'
    je      readNextRegister
    mov     rcx, msgRegisterIsValid
    call    printMsg

;   Actualizar la actividad leida del archivo en la matriz
    call    UpdateMatriz
    jmp     readNextRegister

EndOfFile:
    call    padronImpar
    call    closeEdificio
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
openEdificio: ;Abro archivo PRECIOS.dat
    mov     rcx, fileEdificio
    mov     rdx, modeEdificio
    sub     rsp, 32
    call    fopen
    add     rsp, 32
ret

closeEdificio: ;Cierro archivo PRECIOS.dat
    mov     rcx, [handleEdificio]
    sub     rsp, 32
    call    fclose
    add     rsp, 32
ret

;*********************************
readRegister:
    mov     rcx, regApartment    ;Param 1: direccion de area de memoria donde se copiaran los datos
    mov     rdx, 7               ;Param 2: longitud del registro completo
    mov     r8, 1                ;Param 3: siempre es 1, porq es cant de registros
    mov     r9, [handleEdificio] ;Param 4: el handle del archivo a leer para completar el registro
    sub     rsp, 32
    call    fread
    add     rsp, 32
ret

;*********************************
;VALIDAR REG
VALREG:
    mov     byte[registerIsValid],'N'

    call    validatePiso
    cmp     byte[fieldIsValid],'N'
    je      endValidateRegister

    call    validateDpto
    cmp     byte[fieldIsValid],'N'
    je      endValidateRegister

    call    validatePrice
    cmp     byte[fieldIsValid],'N'
    je      endValidateRegister

    mov     byte[registerIsValid],'S'
endValidateRegister:
ret

;*********************************
validatePiso:
;Copia a un campo finalizado con 0 binario (para poder ser usado por sscanf)
    mov     byte[fieldIsValid], 'N'
    mov     rcx, 4
    mov     rsi, piso
    mov     rdi, pisoAux
    rep movsb

;Conversion para validacion fisica
    mov     rcx, pisoAux        ;Param 1: dir area de memoria con el dato a convertir
    mov     rdx, pisoFormat     ;Param 2: el formato al cual se convertira
    mov     r8, pisoNum         ;Param 3: dir area de memoria en donde se guardara el dato convertido
    
    sub     rsp, 32
    call    sscanf
    add     rsp, 32
    cmp     rax, 1
    jl      pisoInvalido

;Verifico si el num de piso esta comprendido en el rango 1-12
    cmp     word[pisoNum], 1
    jl      pisoInvalido
    cmp     word[pisoNum], 12
    jg      pisoInvalido

    mov     byte[fieldIsValid],'S'
pisoInvalido:
ret

;*********************************
;VALIDAR CODIGO DE PROVINCIA
validateDpto:
;Verifico si el num de departamento esta comprendido en el rango 1-12
    mov     byte[fieldIsValid], 'N'

    cmp     word[dpto], 1
    jl      dptoInvalid
    cmp     word[dpto], 12
    jg      dptoInvalid

    mov     byte[fieldIsValid],'S'
dptoInvalid:
ret

;*********************************
;VALIDAR PRECIO
validatePrice:
;Verifico si el precio del dpto es mayor a cero (nada es gratis)
    mov     byte[fieldIsValid], 'N'

    cmp     dword[precio], 0
    jl      priceError

    mov     byte[fieldIsValid],'S'
priceError:
ret

;*********************************
UpdateMatriz:
;  [(fila-1)*longFila]  + [(columna-1)*longElemento]
;  longFila = longElemento * cantidad columnas
;  FILAS: pisos (12) / COLUMNAS: dptos (12)

    mov     rax, 0x00
    mov     rbx, 0x00

    mov     bx, word[pisoNum] ;(fila)
    sub     bx,1    ; (fila-1)
    imul    bx,bx,48    ; 48 porque la longFila = longElemento (4 bytes) * cantCols (12 cols)
;en bx tengo el desplazamiento a la fila
    mov     rax,rbx   ;Guardo el parcial en rax

    mov     rbx, 0x00
    mov     bx, word[dpto] ;(col)
    dec     bx      ; (col-1)
    imul    bx, bx, 4   ;Multiplico por long. elem (*4bytes)

    add     rax, rbx    ;y ahora, en rax tengo el desplazamiento total

    mov     rbx, 0                      ;Limpio el rbx
    mov     ebx, dword[precio]          ;Guardo el precio de dicho departamento en un registro
    mov     dword[matriz + rax], ebx    ;Para luego, guardarlo en su correspondiente posicion de la matriz

ret

;*********************************
padronImpar:
;Aca solicitare por pantalla un numero valido X [1..12] (ya sea de dpto o piso)
askAgainX:
    mov     rcx, msgAskX
    call    printMsg

    mov     rcx, bufferX     ;Parametro 1: direccion de memoria del campo donde se guarda lo ingresado
    sub     rsp, 32
    call    gets             ;Lee de teclado y lo guarda como string hasta que se ingresa fin de linea
    add     rsp, 32

    mov     rcx, bufferX     ;Parametro 1: campo donde estan los datos a leer
    mov     rdx, pisoFormat  ;Parametro 2: direccion del string q contiene los formatos
    mov     r8, numIng       ;Parametro 3: direccion del campo que recibira el dato formateado
    sub     rsp, 32
    call    sscanf
    add     rsp, 32

    cmp     rax, 1      ;rax tiene la cantidad de campos que pudo formatear correctamente
    jl      askAgainX

;Valido por rango si el numero ingresado este entre 1 y 12
    cmp     word[numIng], 1
    jl      askAgainX
    cmp     word[numIng], 12
    jg      askAgainX

;Aca solicitare por pantalla un precio
askAgainPrice:
    mov     rcx, msgAskPrice
    call    printMsg

    mov     rcx, bufferPrice    ;Parametro 1: direccion de memoria del campo donde se guarda lo ingresado
    sub     rsp, 32
    call    gets                ;Lee de teclado y lo guarda como string hasta que se ingresa fin de linea
    add     rsp, 32

    mov     rcx, bufferPrice        ;Parametro 1: campo donde estan los datos a leer
    mov     rdx, priceFormat        ;Parametro 2: direccion del string q contiene los formatos
    mov     r8, priceIng            ;Parametro 3: direccion del campo que recibira el dato formateado
    sub     rsp, 32
    call    sscanf
    add     rsp, 32

    cmp     rax, 1      ;rax tiene la cantidad de campos que pudo formatear correctamente
    jl      askAgainPrice

;Aqui, ya tengo un precio de departamente ingresado 
;Y tengo el num ingresado [1..12] en binario (word, 2 bytes) numIng

    mov     rbx, 0x00
    mov     bx, word[numIng] ;(col)
    dec     bx      ; (col-1)
    imul    bx, bx, 4   ;Multiplico por long. elem (*4bytes)

    mov     rdi, rbx    ;Paso el desplaz. al RDI

    mov     rcx, 12
    mov     rbx, 0      ;Utilizo rbx como auxiliar para el precio del dpto en el corriente piso de la matriz
    mov     rax, 0      ;Utilizare el rax como "contador" de pisos      

repeatDesplazEnCol:
    push    rcx
    inc     rax
    mov     ebx, dword[matriz + rdi]  ;agarro el precio del dpto en el corriente piso de la matriz
    cmp     dword[priceIng], ebx     ;comparo si rbx (dato matriz) es mayor o igual que el precio ingresado
    jl      SigIteracion             ;si [priceIng] es menor, entonces avanzo a sig iteracion porq el dato de la matriz es mayor

;Si llegue aca es porque el precio de la matriz es menor al ingresado, asique lo imprimo
    mov     rcx, msgMenorDpto
    mov     rdx, rax
    sub     rsp, 32
    call    printf
    add     rsp, 32

SigIteracion:
    pop     rcx
    add     rdi, 48                 ;Avanzo al proximo elemento de la columna (cada elem. es una doubleword de 4 bytes * 12 "posiciones")
    loop    repeatDesplazEnCol

ret

;*********************************
printMsg:
    sub     rsp, 32
    call    puts
    add     rsp, 32
ret


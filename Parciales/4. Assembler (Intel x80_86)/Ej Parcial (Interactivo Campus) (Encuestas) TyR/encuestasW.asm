;*************************************************************************************************
; ejintegrador.asm
; Se cuenta con un archivo en formato binario llamado ENCUESTA.DAT que contiene información de las respuestas de una encuesta. La 
; encuesta pretende conocer los votantes aproximados de ciertos partidos políticos (de una lista de 5 opciones) en las 24 provincias del país.
; Cada registro del archivo representa una respuesta y contiene la siguiente información:
;       - Partido político: 3 bytes:  FTD, PRO, UCR, LLA ó, FDI
;       - Código de ciudad: 1 bytes en formato binario punto fijo sin signo (1 a 24)
;
; Se pide realizar un programa en assembler Intel que lea el archivo y por cada registro actualice una matriz (M) de 5x24 donde 
; cada fila representa un partido político y cada columna una provincia.  Cada elemento de la matriz M representa la sumatoria de 
; respuestas para cada partido político en las provincias. Los datos de cada registro del archivo deberán ser validados mediante 
; una rutina interna llamada VALREG para descartar los incorrectos. 
;
; Por último, según su número de padrón, el programa deberá resolver lo siguiente:
;       - Padrón Par: ingresar por teclado un código de provincia e informar por pantalla 
;                     el código del partido político con menor intención de voto.
;
;       - Padrón Impar: ingresar por teclado un código de provincia e informar por pantalla 
;                       el código del partido político con mayor intención de voto.
;*************************************************************************************************

global	main
extern	gets
extern	sscanf
extern	puts
extern  fopen
extern  fread
extern  fclose

section	.data
    fileEncuesta    db "ENCUESTA.dat",0
    modeEncuesta    db "rb",0  ; read | binario | abrir o error
    handleEncuesta  dq 0

    matriz          times   120  dw 0 ; 120 porque 5(filas) * 24(cols)

    regEncuesta     times   0   db ''   ;Longitud total del registro: 4
      partido       times   3   db ' '
      code                      db 0

    arrayPartidos   db  "FTDPROUCRLLAFDI"
    
    msgAsking       db  "Ingrese un cod. de provincia valido [1,2...24]",13,0
    numFormat       db  "%i"    ; %i 32 bits / %lli 64 bits
    msgVotes        db  "El partido politico que tiene mas votos en dicha provincia fue: ",0
    impresion       db  "***",0

    ;*** Para debug
    msgOpenFileOk	db	"El archivo se abrio correctamente",0
    msgErrorOpen	db	"Error en la apertura del archivo",0
    msgReading	    db	"Leyendo...",0
    msgRegisterIsValid	db	"Reg valido",0

section	.bss
	registerIsValid resb    1
   	fieldIsValid	resb	1 ;S valido N invalido
    partidoBin      resb    1
    buffer          resb    10
    numIng          resd    1
    lineCount       resb    1

section	.text
main:

    call    openEncuesta
    cmp     rax, 0
    jle     errorOpenFile
    mov     [handleEncuesta], rax
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
    call    closeEncuesta
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
openEncuesta: ;Abro archivo Encuesta
    mov     rcx, fileEncuesta
    mov     rdx, modeEncuesta
    sub     rsp, 32
    call    fopen
    add     rsp, 32
ret

closeEncuesta: ;Cierro archivo Encuesta
    mov     rcx, [handleEncuesta]
    sub     rsp, 32
    call    fclose
    add     rsp, 32
ret

;*********************************
readRegister:
    mov     rcx, regEncuesta    ;Param 1: direccion de area de memoria donde se copiaran los datos
    mov     rdx, 4              ;Param 2: longitud del registro completo
    mov     r8, 1               ;Param 3: siempre es 1, porq es cant de registros
    mov     r9, [handleEncuesta];Param 4: el handle del archivo a leer para completar el registro
    sub     rsp, 32
    call    fread
    add     rsp, 32
ret

;*********************************
;VALIDAR REG
VALREG:
    mov     byte[registerIsValid],'N'

    call    validatePartido
    cmp     byte[fieldIsValid],'N'
    je      endValidateRegister

    call    validateCode
    cmp     byte[fieldIsValid],'N'
    je      endValidateRegister

    mov     byte[registerIsValid],'S'
endValidateRegister:
ret

;*********************************
validatePartido:
    mov     byte[fieldIsValid], 'S'

    mov     rbx, 0              ;Utilizo el rbx como puntero al vector arrayPartidos
    mov     rcx, 5              ;Contador por las 5 opciones de la "tabla" de partidos
    mov     rax, 0

nextPartido:
    inc     rax
    push    rcx                 ;Con el push, me guardo el contador en la pila
    mov     rcx, 3              ;3 porq es long de cada string de los Partidos en el "vector"
    lea     rsi, [partido]      ;mov rsi,partido tambien podia ser
    lea     rdi, [arrayPartidos + rbx]
    repe cmpsb
    pop     rcx                 ;Con el pop, recupero el contador de la pila

    je      PartidoOk           ;Si es valido el partido politico, sigo a la siguiente validacion
    add     rbx,3
    loop    nextPartido

    mov     byte[fieldIsValid],'N'
PartidoOk:
    mov     byte[partidoBin], al    ;Paso el partido politico, en binario, a una variable (partidoBin)
ret

;*********************************
;VALIDAR CODIGO DE PROVINCIA
validateCode:
;Verifico si el codigo de provincia esta comprendido en el rango 1-24
    mov     byte[fieldIsValid], 'N'

    cmp     word[code], 1
    jl      codeError
    cmp     word[code], 24
    jg      codeError

    mov     byte[fieldIsValid],'S'
codeError:
ret

;*********************************
UpdateMatriz:
;  [(fila-1)*longFila]  + [(columna-1)*longElemento]
;  longFila = longElemento * cantidad columnas
;  FILAS: partidos (5) / COLUMNAS: cod.provincia (24)

    mov     rax, 0
    mov     rbx, 0

    sub     byte[code], 1     ;Resto a [code] un 1 para hacer el desplaz. columnas
    mov     al, byte[code]    ;Copio el [code] al registro AL
    mov     bl, 2
    mul     bl           ;Multiplico por long. elem (Cols*2bytes) = desplaz. cols y resultado en AX

    mov     rdx, rax    ;[aca guardo, en el rdx, el desplaz. de columnas]

    mov     rax, 0
    sub     byte[partidoBin], 1       ;Resto a [partidoBin] un 1 para hacer el desplaz. filas
    mov     al, byte[partidoBin]      ;Copio el [partidoBin] al registro AL
    mov     bl, 48
    mul     bl            ;Multiplico 48 porque la longFila = (2 bytes) * (24 cols)
;en rax tengo el desplazamiento fila

    add     rax,rdx     ;[sumo ambos desplaz y tengo el total en RAX]

    mov     bx, word[matriz + rax]  ;obtengo la cant. de respuestas de equis partido politico de equis cod.prov en la matriz
    inc     bx                      ;Lo incremento en 1
    mov     word[matriz + rax], bx  ;Vuelvo a almacenar la cant. de respuestas en la matriz

ret

;*********************************
padronImpar:

askAgain:
    mov     rcx, msgAsking
    call    printMsg

    mov     rcx, buffer     ;Parametro 1: direccion de memoria del campo donde se guarda lo ingresado
    sub     rsp, 32
    call    gets            ;Lee de teclado y lo guarda como string hasta que se ingresa fin de linea
    add     rsp, 32

    mov     rcx, buffer     ;Parametro 1: campo donde estan los datos a leer
    mov     rdx, numFormat  ;Parametro 2: direccion del string q contiene los formatos
    mov     r8, numIng      ;Parametro 3: direccion del campo que recibira el dato formateado
    sub     rsp, 32
    call    sscanf
    add     rsp, 32

    cmp     rax, 1      ;rax tiene la cantidad de campos que pudo formatear correctamente
    jl      askAgain

;Valido por rango si el numero ingresado este entre 1 y 24
    cmp     dword[numIng], 1
    jl      askAgain
    cmp     dword[numIng], 24
    jg      askAgain

;Ya tengo el num ingresado [1..24] en binario (doubleword, 4 bytes) numIng
    mov     rax, 0
    sub     dword[numIng],1
    mov     eax, dword[numIng]
    mov     bl, 2       ;Muevo el desplaz. cols  a bl como multiplizador: [(Cols-1)* Long. Elem]
    mul     bl          ;Resultado de la multip. queda en AX     

    mov     rdi, rax    ;Paso el desplaz. al RDI


    mov     rcx, 5
    mov     rsi, 0
    mov     rbx, 0      ;Utilizo rbx como auxiliar para levantar cant. total actividades
    mov     rax, 0
;Si hiciera el ej padron par, lo unico q tengo q hacer es cambiar a jG en la bifurcacion a SigIteracion 
;y la linea 264 copypaste aca arriba ^^, PERO por temas de sizes, seria SI y no RSI
repeatDesplazEnCol:
    inc     rax
    mov     bx, word[matriz + rdi]  ;agarro la cant. de respuestas de un partido politico de la matriz
    cmp     rbx, rsi                ;comparo si rbx (dato matriz) es mayor o igual que rsi (la mayor cant guardada)
    jl      SigIteracion            ;si rbx es menor, entonces avanzo a sig iteracion porq el q tenia guardado en rsi es mayor

    mov     rsi, rbx                ;Si llegue aca, es porq el dato de la matriz es mayor. Asique "actualizo" el valor del rsi
    mov     byte[lineCount], al     ;Paso el numero de fila (partido politico), en binario, a una variable (lineCount)

SigIteracion:
    add     rdi, 48                 ;Avanzo al proximo elemento de la columna (cada elem. es una word de 2 bytes * 24 "posiciones")
    loop    repeatDesplazEnCol

;Una vez termine el loop, tengo el mayor cant. respuestas en el rsi y la fila (osea el partido politico) en [lineCount] 
    sub     rsi, rsi         ;Limpio el rsi porq lo voy a querer vacio

    mov     rcx, msgVotes    ;Param 1: direc. de memoria del campo a imprimir
    call    printMsg

;Calculo cuanto voy a tener que avanzar en el vector de partidos para copiarlo en otro campo e imprimirlo
    mov     al, byte[lineCount]         ; COL-1
    sub     al, 1
    mov     bl, 3                       ; *LONG.ELEM (3 bytes)
    mul     bl
    add     ax, arrayPartidos           ; en ax voy a tener la direc de memoria del vector + el desplazamiento

    mov     rsi, rax                    ;Param 1 (rsi): origen
    mov     rdi, impresion              ;Param 2 (rdi): destino
    mov     rcx, 3                      ;Param 3 (rcx): la cantidad de bytes a copiar
    rep movsb                           ;la movsb copia el contenido de memoria apuntado por rsi al rdi
;siempre usar el rep para la movsb, ya que es la marca de "repetidor" de copiado de bytes que indica el rcx
    
    mov     rcx, impresion    ;Param 1: direccion de memoria de la cadena texto a imprimir
    call    printMsg

ret

;*********************************
printMsg:
    sub     rsp, 32
    call    puts
    add     rsp, 32
ret


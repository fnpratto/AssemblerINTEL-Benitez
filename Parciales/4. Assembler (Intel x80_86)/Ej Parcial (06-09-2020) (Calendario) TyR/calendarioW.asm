;*****************************************************************************
; ejparcial2020.asm
; Se dispone de una matriz C que representa un calendario de actividades de una persona.
; La matriz C está formada por 7 columnas (que corresponden a los dias de la semana)
; y por 6 filas (que corresponden a las semanas que puede tener como maximo un mes en un calendario)
; Cada elemento de la matriz es un BPF s/signo de 2 bytes (word) representa la cantidad de 
; actividades que realizara dicho dia en la semana. Ademas se dispone de un archivo de entrada
; llamado CALEN.DAT donde cada registro tiene el siguiente formato:
;       - Dia de la Semana: Caracter de 2 bytes (DO, LU, MA, MI, JU, VI, SA)
;       - Semana: Binario de 1 byte (1, 2... 6)
;       - Actividad: Caracteres de longitud 20 con la descripcion.
;
; Como la informacion leida del archivo puede ser erronea, se dispone una rutina interna llamada 
; VALCAL para su validacion. Se pide realizar un programa assembler Intel x86 que actualice la
; matriz C con aquellos registros validos. Al finalizar la actualizacion se solicitara el ingreso por
; teclado de una semana y se debe generar un listado indicando: "Dia de la Semana = Cantidad de Actividades"
; Ejemplo:
;
;       Dia         -   Cant. Act
;       Domingo             0
;       Lunes               0
;       Martes              2
;       Miercoles           0
;       Jueves              0
;       Viernes             0
;       Sabado              0
;
;*****************************************************************************

global	main
extern	puts
extern  printf
extern	sscanf
extern	gets
extern  fopen
extern  fread
extern  fclose

section	.data
    fileCalen       db  "CALEN.dat",0
    modeCalen       db  "rb",0  ; read | binario | abrir o error
    handleCalen     dq  0

    matriz          times   42  dw 0 ; 42 porque 7(filas) * 6(cols)

    regCalen        times   0   db ''   ;Longitud total del registro: 23 bytes
      day           times   2   db ' '
      week                      db 0
      descrip       times   20  db ' '

    arrayDays       db  "DOLUMAMIJUVISA"
    PrintDays       db  "Domingo       ",0
                    db  "Lunes         ",0
                    db  "Martes        ",0
                    db  "Miercoles     ",0
                    db  "Jueves        ",0
                    db  "Viernes       ",0
                    db  "Sabado        ",0

    msgCant         db  "%d",10,0
    msgList         db  "Dia    - Cant. Act",10,0
    msgAsking       db  "Ingrese una semana valida [1,2...6]",13,0
    numFormat       db  "%i"    ; %i 32 bits / %lli 64 bits

    ;*** Para debug
    msgErrorOpen	db	"Error en la apertura del archivo",0
    msgOpenFileOk	db	"El archivo se abrio correctamente",0
    msgReading	    db	"Leyendo...",0
    msgRegisterIsValid	db	"Registro valido",0

section	.bss
	registerIsValid resb    1
   	fieldIsValid	resb	1 ;S valido N invalido
    DayBin          resb    1
    buffer          resb    10
    numIng          resd    1

section	.text
main:

    call    openCalen
    cmp     rax, 0
    jle     errorOpenFile
    mov     [handleCalen], rax
    mov     rcx, msgOpenFileOk
    call    printMsg

readNextRegister:
    call    readRegister
    cmp     rax, 0
    jle     EndOfFile
    mov     rcx, msgReading
    call    printMsg

    call    VALCAL
    cmp     byte[registerIsValid],'N'
    je      readNextRegister
    mov     rcx, msgRegisterIsValid
    call    printMsg

;   Actualizar la actividad leida del archivo en la matriz
    call    UpdateMatriz
    jmp     readNextRegister

EndOfFile:
    call    makeList
    call    closeCalen
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
openCalen:
    mov     rcx, fileCalen
    mov     rdx, modeCalen
    sub     rsp, 32
    call    fopen
    add     rsp, 32
ret

closeCalen:
    mov     rcx, [handleCalen]
    sub     rsp, 32
    call    fclose
    add     rsp, 32
ret

;*********************************
readRegister:
    mov     rcx, regCalen   ;Parametro 1: dir area de memoria con los datos a copiar
    mov     rdx, 23         ;Parametro 2: longitud del registro
    mov     r8, 1           ;Parametro 3: cantidad de registros
    mov     r9, [handleCalen] ;Parametro 4: handle del archivo
    sub     rsp, 32
    call    fread
    add     rsp, 32
ret

;*********************************
;VALIDAR REGISTRO
VALCAL:
    mov     byte[registerIsValid],'N'

    call    validateDay
    cmp     byte[fieldIsValid],'N'
    je      endValidateRegister

    call    validateWeek
    cmp     byte[fieldIsValid],'N'
    je      endValidateRegister

    mov     byte[registerIsValid],'S'
endValidateRegister:
ret

;*********************************
validateDay:
    mov     byte[fieldIsValid], 'S'

    mov     rbx, 0          ;Utilizo el rbx como puntero al vector arrayDays
    mov     rcx, 7          ;Contador por los 7 dias por semana
    mov     rax, 0

nextDay:
    inc     rax
    push    rcx         ;Con el push, me guardo el contador en la pila
    mov     rcx, 2
    lea     rsi, [day]      ;mov rsi,day tambien podia ser
    lea     rdi, [arrayDays + rbx]
    repe cmpsb
    pop     rcx         ;Con el pop, recupero el contador de la pila

    je      DayOk       ;Si es valido el dia, sigo a la siguiente validacion
    add     rbx,2
    loop    nextDay

    mov     byte[fieldIsValid],'N'
DayOk:
    mov     byte[DayBin], al    ;Paso el dia, en binario, a una variable (DayBin)
ret

;*********************************
validateWeek:
;Verifico si el numero de semana esta comprendido en el rango 1-6
    mov     byte[fieldIsValid], 'N'

    cmp     word[week], 1
    jl      weekError
    cmp     word[week], 6
    jg      weekError

    mov     byte[fieldIsValid],'S'
weekError:
ret

;*********************************
UpdateMatriz:
;  [(fila-1)*longFila]  + [(columna-1)*longElemento]
;  longFila = longElemento * cantidad columnas
;  FILAS: semanas (6) / COLUMNAS: dias (7)

    mov     rax, 0
    mov     rbx, 0

    sub     byte[DayBin], 1     ;Resto a [DayBin] un 1 para hacer el desplaz. columnas
    mov     al, byte[DayBin]    ;Copio el [DayBin] al registro AL
    mov     bl, 2
    mul     bl           ;Multiplico por long. elem (Cols*2bytes) = desplaz. cols y resultado en AX

    mov     rdx, rax    ;[aca guardo, en el rdx, el desplaz. de columnas]

    mov     rax, 0
    sub     byte[week], 1       ;Resto a [week] un 1 para hacer el desplaz. filas
    mov     al, byte[week]      ;Copio el [week] al registro AL
    mov     bl, 14
    mul     bl            ;Multiplico 14 porque la longFila = (2 bytes) * (7 cols)
;en rax tengo el desplazamiento fila

    add     rax,rdx     ;[sumo ambos desplaz y tengo el total en RAX]

    mov     bx, word[matriz + rax]  ;obtengo la cant. de actividades del dia en la matriz
    inc     bx                      ;Lo incremento en 1
    mov     word[matriz + rax], bx  ;Vuelvo a almacenar la cant. activ en la matriz

ret

;*********************************
makeList:

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

;Valido por rango si el numero ingresado este entre 1 y 6
    cmp     dword[numIng], 1
    jl      askAgain
    cmp     dword[numIng], 6
    jg      askAgain

;Ya tengo el num ingresado [1..6] en binario (doubleword, 4 bytes) numIng
    sub     dword[numIng],1
    mov     rax, 0
    mov     eax, dword[numIng]
    mov     bl, 14      ;Muevo el desplaz. filas a bl como multiplizador: [(Fila-1)* Long.Fila]
    mul     bl          ;Resultado de la multip. queda en AX |     Long. Fila = (Long. Elem * Cant.Cols)

    mov     rdi, rax    ;Paso el desplaz. al RDI

    mov     rcx, msgList    ;Param 1: direc. de memoria del campo a imprimir
    call    printMsg

    mov     rcx, 7
    mov     rsi, 0      ;Utilizo rsi para desplazar dentro del vector PrintDays
    mov     rbx, 0      ;Utilizo rbx como auxiliar para levantar cant. total actividades
repeatPrint:
    push    rcx

    lea     rcx, [PrintDays + rsi]
    call    printMsg

    mov     bx, word[matriz + rdi] ;recupero la cantidad total de actividades del dia en la matriz
    
    mov     rcx, msgCant    ;Param 1: direccion de memoria de la cadena texto a imprimir
    mov     rdx, rbx        ;Param 2: campo en el que se encuentra el formato indicado, del q se imprimira por pantalla 
    sub     rsp, 32
    call    printf
    add     rsp, 32

    add     rdi, 2      ;Avanzo al proximo elemento de la fila (cada elem. es una word de 2 bytes)
    add     rsi, 15     ;Avanzo 14+1 bytes (14 del string dia | 1 byte de carac. especial 0 al final de cada dia)

    pop     rcx
    loop    repeatPrint

ret

;*********************************
printMsg:
    sub     rsp, 32
    call    puts
    add     rsp, 32
ret


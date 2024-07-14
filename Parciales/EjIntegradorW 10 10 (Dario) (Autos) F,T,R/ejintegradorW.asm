;*****************************************************************************
; ejintegrador.asm
; Dada un archivo en formato BINARIO que contiene informacion sobre los autos, llamado listado.dat
; donde cada REGISTRO del archivo representa informacion de un auto con los campos:
;       - marca:                      10 caracteres
;       - año de fabricacion:         4 caracteres
;       - patente:                    7 caracteres
;       - precio:                     4 bytes en bpf s/signo
;
; Se pide codificar un programa en assembler intel que lea cada registro del archivo listado y guarde
; en un nuevo archivo en formato binario llamado seleccionados.dat las patente y el precio (bpf c/signo) de aquellos
; autos cuyo año de fabricacion esté entre 2020 y 2022 (inclusive) y cuyo precio sea inferior a 5.000.000$
; Como los datos del archivo pueden ser incorrectos, se deberan validar mediante una rutina interna:
; Se deberá validar:
;       - Marca (que sea Fiat, Ford, Chevrolet, o Peugot)
;       - Año (que sea un valor numerico y que cumpla la condicion indicada del rango)
;       - Precio (que cumpla la condicion inferior a dicho precio)
;*****************************************************************************

global	main
extern	printf
extern	sscanf
extern	puts
extern	fwrite
extern  fopen
extern  fread
extern  fclose

section	.data
    fileList        db "listado.dat",0
    modeList        db "rb",0  ; read | binario | abrir o error
    handleList      dq 0

    fileSel         db "seleccion.dat",0
    modeSel         db "wb",0
    handleSel       dq 0

    regList         times   0   db ''   ;Longitud total del registro: 25
      brand         times   10  db ' '
      year          times   4   db ' '
      patente       times   7   db ' '
      price         times   4   db ' '

    arrayBrands     db  "Fiat      Ford      Chevrolet Peugot    "
    yearAux         db  "****",0
    yearformat      db  "%hi",0 ;16 bits (word)
    yearNum         dw  0       ;16 bits (word)

    regSel          times   0   db ''   ;Longitud total del registro: 11
      patenteSel    times   7   db ' '  ;7 bytes
      priceSel                  dd 0    ;4 bytes


    ;*** Para debug
    msgOpenFileOk	db	"Apertura Listado ok",0
    msgReading	db	"Leyendo...",0
    msgRegisterIsValid	db	"Reg valido",0

section	.bss
	registerIsValid resb    1
   	fieldIsValid	resb	1 ;S valido N invalido

section	.text
main:

    call    openList
    cmp     rax, 0
    jle     errorOpenList
    mov     [handleList], rax
    mov     rcx, msgOpenFileOk
    call    printMsg

    call    openSel
    cmp     rax, 0
    jle     errorOpenSel
    mov     [handleSel], rax


readNextRegister:
    call    readRegister
    cmp     rax, 0
    jle     closeFiles
    mov     rcx, msgReading
    call    printMsg

    call    validateRegister
    cmp     byte[registerIsValid],'N'
    je      readNextRegister
    mov     rcx, msgRegisterIsValid
    call    printMsg

    call    buildRegSel
    call    writeRegSel

    jmp     readNextRegister

errorOpenList:
;lo que considere si fallo la apertura
    call	endProg
errorOpenSel:
    call    closeList
    jmp     endProg
closeFiles:
	call    closeList
    call    closeSel

endProg:
ret 
;*********************************
; RUTINAS INTERNAS
;*********************************
openList: ;Abro archivo Listado
    mov     rcx, fileList
    mov     rdx, modeList
    sub     rsp, 32
    call    fopen
    add     rsp, 32
ret

openSel: ;Abro archivo Seleccion
    mov     rcx, fileSel
    mov     rdx, modeSel
    sub     rsp, 32
    call    fopen
    add     rsp, 32
ret

closeList: ;Cierro archivo Listado
    mov     rcx, [handleList]
    sub     rsp, 32
    call    fclose
    add     rsp, 32
ret

closeSel: ;Cierro archivo Seleccion
    mov     rcx, [handleSel]
    sub     rsp, 32
    call    fclose
    add     rsp, 32
ret

;*********************************
readRegister:
    mov     rcx, regList        ;Param 1: direccion de area de memoria donde se copiaran los datos
    mov     rdx, 25             ;Param 2: longitud del registro completo
    mov     r8, 1               ;Param 3: siempre es 1, porq es cant de registros
    mov     r9, [handleList]    ;Param 1: el handle del archivo a leer para completar el registro
    sub     rsp, 32
    call    fread
    add     rsp, 32
ret

;*********************************
;VALIDAR REG
validateRegister:
    mov     byte[registerIsValid],'N'

    call    validateBrand
    cmp     byte[fieldIsValid],'N'
    je      endValidateRegister

    call    validateYear
    cmp     byte[fieldIsValid],'N'
    je      endValidateRegister

    call    validatePrice
    cmp     byte[fieldIsValid],'N'
    je      endValidateRegister

    mov     byte[registerIsValid],'S'
endValidateRegister:
ret

;*********************************
;VALIDAR MARCA
validateBrand:
    mov     byte[fieldIsValid], 'S'

    mov     rbx, 0
    mov     rcx, 4
nextBrand:
    push    rcx
    mov     rcx, 10         ;10 porq es long de cada string de los Brand en el "vector"
    lea     rsi, [brand]    ;mov rsi,brand tambien podia ser
    lea     rdi, [arrayBrands + rbx]
    repe cmpsb
    pop     rcx

    je      BrandOk
    add     rbx,10
    loop    nextBrand

    mov     byte[fieldIsValid],'N'
BrandOk:
ret

;*********************************
;VALIDAR AÑO
validateYear:
;Copia a un campo finalizado con 0 binario (para poder ser usado por sscanf)
    mov     byte[fieldIsValid], 'N'
    mov     rcx, 4
    mov     rsi, year
    mov     rdi, yearAux
    rep movsb

;Conversion para validacion fisica
    mov     rcx, yearAux        ;Param 1: dir area de memoria con el dato a convertir
    mov     rdx, yearformat     ;Param 2: el formato al cual se convertira
    mov     r8, yearNum         ;Param 3: dir area de memoria en donde se guardara el dato convertido
    
    sub     rsp, 32
    call    sscanf
    add     rsp, 32
    cmp     rax, 1
    jl      yearError

;Verifico si el año esta comprendido en el rango 2020-2022
    cmp     word[yearNum], 2020
    jl      yearError
    cmp     word[yearNum], 2022
    jg      yearError

    mov     byte[fieldIsValid],'S'
yearError:
ret

;*********************************
;VALIDAR PRECIO
validatePrice:
    mov     byte[fieldIsValid],'S'
    cmp     dword[price], 5000000
    jle     PrecioOk
    mov     byte[fieldIsValid],'N'
PrecioOk:
ret

;*********************************
buildRegSel:
    ;Copiar los datos requeridos al archivo de seleccion
    ;Copio Patente
    mov     rcx,7
    mov     rsi, patente
    mov     rdi, patenteSel
    rep movsb

    ;Copio precio
    mov     eax, [price]
    mov     [priceSel], eax
ret

;*********************************
writeRegSel:
    ;Guardo registro en archivo Seleccion
    mov     rcx, regSel     ;Parametro 1: dir area de memoria con los datos a copiar
    mov     rdx, 11         ;Parametro 2: longitud del registro
    mov     r8, 1           ;Parametro 3: cantidad de registros
    mov     r9, [handleSel] ;Parametro 4: handle del archivo
    sub     rsp, 32
    call    fwrite
    add     rsp, 32
ret

;*********************************
printMsg:
    sub     rsp, 32
    call    puts
    add     rsp, 32
ret


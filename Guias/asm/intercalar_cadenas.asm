
; Dos cadenas de caracteres, A y B, de longitudes iguales e igual al dato almacenado en la
;direcci�n 0500h comienzan en las direcciones 0200h la cadena A y 0300h la cadena B.
;Armar una cadena de caracteres C a partir de la direcci�n 0400h intercalando cada
;elemento de la cadena A con cada elemento de la cadena B uno a uno. El programa
;comienza en la direcci�n 0100h

org 100h

    mov cx,[0500h]     // longitud
    mov si,0200h       // Inicio cadena A
    mov di,0300h       // Inicio cadena B
    mov bx,0400h       // Cadena mergeada
loop:
    mov ax, [si]
    mov [bx],ax
    inc bx
    inc si

    mov ax, [di]
    mov [bx],ax
    inc bx
    inc di
    
    dec cx
    cmp cx, 00h
    jne loop

ret





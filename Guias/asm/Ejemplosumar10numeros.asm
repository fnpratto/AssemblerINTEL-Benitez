
.MODEL SMALL
.STACK ; asigna un STACK de 1K
.DATA
cen db 0
dece db 0
uni db 0

DATOSSUM DB 01h, 02h, 03h, 04h, 05h ; datos que vamos
         DB 06h, 07h, 08h, 09h, 0Ah ; a procesar     
         
.CODE
SUMA PROC 
    MOV AX, @DATA
    MOV DS, AX
    XOR BX, BX        ; indice de acceso al área de datos
    XOR DL, DL        ; acumulador de datos
    MOV CX, 0Ah       ; numero de datos a procesar  
    
ACUMULA:     

        ADD DL, DATOSSUM [BX]
        INC BX
        LOOP ACUMULA    
        
inicio:
mov al,DL   ; asigno el valor de la suma en decimal al registro AL
aam         ; ajusta el valor en AL por: AH los digitos mas significativos Y AL el primer digito

mov uni,al  ; Respaldo el primer digito en unidades
mov al,ah   ; muevo lo que tengo en AH a AL para poder volver a separar los números
              
aam         ; separa lo qe hay en AL por: AH digito mas significativo Y AL el primer digito
mov cen,ah  ; respaldo las centenas en cen en este caso 2

mov dece,al ; respaldo las decenas en dec, en este caso 3

              
            ; Imprimos los tres valores empezando por centenas, decenas y unidades.

mov ah,02h

mov dl,cen
add dl,30h  ; se suma 30h a dl para imprimir el numero real.
int 21h

mov dl,dece
add dl,30h
int 21h

mov dl,uni
add dl,30h
int 21h

            ; Termina programa
mov ah,04ch
int 21h
end        
        
        

                      ; DL contiene el resultado
        ;MOV AH, 02h   ; despliega el resultado
        ;INT 21h       ; AL = dato a desplegar
        ;MOV AH, 4Ch   ;
        ;INT 21h       ; salida al DOS
SUMA ENDP
END
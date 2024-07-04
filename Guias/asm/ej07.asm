    .model small

    .stack 64

    .DATA
        cad1 db 'Cadena de prueba','$'                                              
        cad2 db 16 dup (' '),'$'        ;El operador dup asigna 16 bytes
                                        ;para una cadena de caracteres
    .CODE
      inicio: ;Punto de entrada al programa
        mov ax, @data ;inicia registros de segmento
        mov ds, ax ;DS trabaja con SI  DS:[SI]
        mov es, ax ;ES trabaja con DI  ES:[DI] 
        
        cld ;Procesamiento de izq->der.  
            ;ESI y EDI se incrementan 
            ;(STD los decrementa izq <--- der)
        
        mov cx,16 ;Longitud de la cadena. 
                  ;Loop la va decrementando 
                  ;hasta 0 para saltar.
        
        lea si,cad1 ;DS:SI->Cad1  
                    ;(load effective address)
                    ;mueve a si el offset de cad1
        
        
        lea di,cad2+15 ;ES:DI apuntan al final del 
                       ;area reservada para almacenar 
                       ;la cadena invertida
       
       
        otro: ;
        
        lodsb ;Obtener el primer caracter de Cad1. 
              ;Carga un byte desde DS:[SI] en AL 
              ;y actualiza SI.(+-1 segun flag DF) 
        
        mov [di],al ;almacenar el caracterleido de cad1
                    ;en la posicion actual de DI. Posicion
                    ;final de cad2 para el primer caracter.  
        
        dec di  ;Decrementar di en 1
        
        
        loop otro ;Obtener siguiente caracter de Cad1
       
       
        lea dx,cad1 ;
        mov ah,09h ;Imprimir cadena original
        int 21h 
        
        lea dx,cad2 ;  mueve a dx el offset de cad2
        mov ah,09h ;Imprimir cadena invertida
        int 21h ;
        
        mov ax,4c00h ;Terminar programa y regresar al DOS
        int 21h ;
      END inicio
     END
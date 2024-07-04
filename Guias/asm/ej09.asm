;Un byte se encuentra en la direccion 0100.
;Ubicar en la direccion 0101 su
;nible más significativo.

org 100h
; Almacenar en la direccion 100 un numero
mov al, 10101100b
mov [100], al 


mov al,[100]        ; Leer la direccion 
and al, 11110000b   ; enmascarar
mov [101], al       ; almacenar resultado
ret





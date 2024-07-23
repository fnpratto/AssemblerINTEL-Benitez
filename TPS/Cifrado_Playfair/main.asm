;*****************************************************************************
; conversionW.asm     |   TP 11 Cifrado Playfair => FUNCIONA CORRECTAMENTE
; La protección de información consiste en convertir un mensaje original en otro de forma tal que éste
; sólo pueda ser recuperado por un grupo de personas a partir del mensaje codificado.
; El sistema para llevar a cabo la protección deberá basarse en el álgebra lineal, con las siguientes pautas:
;       - Alfabeto a utilizar 25 caracteres (A .. Z, omitiendo la J).
;       - Las letras son distribuidas en una matriz de 5x5.
;       - El mensaje a codificar deberá ser dividido en bloques de a dos caracteres (validando que ninguno de
;         los bloques contenga dos ocurrencias de la misma letra y la ‘J’).
;
;La conversión se llevará a cabo por bloques, es decir tomando dos caracteres del mensaje por vez.
;       ● Si los caracteres se encuentran en distinta fila y columna de la matriz, considerar un rectángulo
;         formado con los caracteres como vértices y tomar de la misma fila la esquina opuesta.
;       ● Si los caracteres se encuentran en la misma fila, de cada caracter el situado a la derecha.
;       ● Si los caracteres se encuentran en la misma columna, tomar el caracter situado debajo.
;
; Se pide desarrollar un programa en assembler Intel 80x86 que permita proteger información de la
; manera antes descripta. El mismo va a recibir como entrada:
;       ● El mensaje a codificar o codificado.
;       ● La matriz de 5x5.
; Y el mismo va a dejar como salida:
;       ● El mensaje codificado u original.
;*****************************************************************************


global main

extern 

section .data

section .bss

section .text
main:
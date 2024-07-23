; Enunciado del Trabajo Práctico
; Trabajo Práctico: Operaciones con Matrices en Lenguaje Ensamblador

; Objetivo
; Desarrollar un programa en lenguaje ensamblador que permita al usuario ingresar y 
; operar con matrices. El programa debe permitir realizar las siguientes operaciones:

; - Ingresar múltiples matrices.
; - Restar dos o más matrices.
; - Verificar si dos matrices son iguales.
; - Multiplicar una matriz por un escalar.
; - Modificar el valor de un elemento específico de una matriz.
; - Consultar el valor de un elemento específico de una matriz.
; - Finalizar el programa.


global main

extern fclose , fopen, printf, scanf


section .data

section .bss
    matriz:
        filas resq 1
        col resq 1
        

section .text

main:
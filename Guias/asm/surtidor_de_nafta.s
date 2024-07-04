@Escribir un código ARM, para el procesador de un surtidor de nafta, que muestre el
@importe a pagar. El mapeo de memoria del surtidor es el siguiente:
@Dirección: FF200050h. Contenido: Litros de nafta vendidos.
@Dirección: FF200040h. Contenido: Precio del litro de nafta.
@Dirección: FF200000h. Contenido: Importe a pagar que muestra un display.
@ Simulador https://cpulator.01xz.net/?sys=arm-de1soc

.equ LITROS,  0xFF200050
.equ PRECIO,  FF200040h
.equ DISPLAY, FF200000h

.global _start
_start:
	LDR R0, =LITROS
	LDR R1, =LITROS
	LDR R2, =LITROS









































	

.equ LITROS, 0xFF200050	 @ la dirección de la cantidad vendida
.equ PRECIO, 0xFF200040	 @ la dirección del precio por litro
.equ DISPLAY,0xFF200000  @ la dirección del display

.global _start
_start:
		ldr r0,=LITROS
		ldr r1,[r0]      @ lectura del dispositivo de entrada (litros vendidos) almacenada en r1
		
		ldr r0,=PRECIO
		ldr r2,[r0]		 @ lectura del dispositivo de entrada (precio por litro) almacenada en r2
		
		mul r3,r1,r2     @ cálculo del precio
		
		ldr r0,=DISPLAY
		str r3,[r0]		 @ escritura en el dispositivo de salida (display del monto a pagar)
		
		.end
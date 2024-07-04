# OperacionesLogicas
Trabajo Practico 1

Se dispone de un archivo que contiene registros con el siguiente contenido:
- Operando: secuencia de caracteres que simbolizan bits (caracteres 0 o 1) (16 bytes)
- Operación: carácter que simboliza una operación a efectuar entre dos operandos, y puede ser O
(Or), X (Xor) y N (And) (1 byte)

*Nota*: Tenga en cuenta que los registros son secuencias de bytes contiguos en la memoria, sin saltos de línea.

Por ejemplo, el contenido de un archivo con tres registros podría ser:

1111111111111111X0000111100001111N0000000000001111O

Por otro lado se lee desde teclado un valor de Operando inicial con el mismo formato que el del campo
de los registros del archivo (caracteres 0 ó 1) (16 bytes).
Se pide realizar un programa en assembler Intel 80x86 que vaya informando por pantalla el resultado de aplicar a los operandos la secuencia de
operaciones informadas en los registros del archivo de entrada. La aplicación de las operaciones se hará de la siguiente manera:

Op. Ini Operac. Reg.1 Op. Reg 1 -> Res. Parcial Operac. Reg. 2 Op. Reg 2 -> Res. Parcial ...

Ejemplo:

Operando Inicial = 0000000000000101

Operando Registro 1 = 1111111111111111

Operación Registro 1 = X (Xor)

- Resultado Parcial = 1111111111111010

Operando Registro 2 = 0000111100001111

Operación Registro 2 = N (And)

- Resultado Parcial = 0000111100001010

...


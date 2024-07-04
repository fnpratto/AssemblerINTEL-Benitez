## Examen Parcial - 1da Oportunidad - 16/6/2020
Se dispone de una matriz de 12x12 que representa un edificio nuevo a estrenar, donde tiene 12 pisos con 12 departamentos en cada uno. Cada elemento de la matriz es un binario de 4 bytes, donde guarda el precio de venta en U$S de cada departamento. Se dispone de un archivo (PRECIOS.DAT) que contiene los precios de los departamentos, donde cada registro del archivo contiene los siguientes campos: 
•	Piso: Carácter de 2 bytes 
•	Departamento:  Binario de 1 byte  
•	Precio venta: Binario de 4 bytes
Se pide realizar un programa en assembler Intel 80x86 que realice la carga de la matriz a través del archivo. Como la información del archivo puede ser incorrecta se deberá validar haciendo uso de una rutina interna (VALREG) que descartará los registros inválidos (la rutina deberá validar todos los campos del registro).
Una vez finalizada la carga, se solicitará ingresar por teclado numero (x) y un precio de venta (no se requieren validar) y se deberá mostrar todos los departamentos/pisos cuyo precio de venta sea menor al ingresado.
Para alumnos con padrón par, x será un numero de piso y se deberá mostrar por pantalla todos los nros de departamento cuyo precio sea inferior al ingresado en el piso ingresado.
Para alumnos con padrón impar, x será un numero de departamento y se deberá mostrar por pantalla todos los nros de piso donde el departamento ingresado tenga precio inferior al ingresado.

## Examen Parcial - 2da Oportunidad - 30/6/2020
Se dispone de una matriz de 30x10 que representa un tablero de Tetris (30 de alto y 10 de largo).Cada elemento de la matriz indica si ese punto del tablero está ocupado o no siendo  '*' (asterisco) ocupado y ' ' (espacio en blanco) en caso contrario.
Para cargar el tablero se hará uso de un archivo (FICHAS.DAT) que contiene el posicionamiento inicial de las fichas. Solo hay fichas de tipo '|' (dimensión 4x1) y cada registro del archivo tiene los siguientes campos:
●  Fila: CL2 (Indica la fila de la posición inicial de la ficha - 1..30)
●  Columna: BL1 (Indica la columna de la posición inicial de la ficha - 1..10)
●  Sentido: CL1 (Indica el sentido hacia donde continúan el resto de las posiciones que ocupa la ficha en el tablero   A - Arriba; B - Abajo; D - Derecha; I - Izquierda)
Se pide realizar un programa en assembler Intel 8086 que realice la carga del tablero (se asume que las fichas no solapan). Como la información del archivo puede ser incorrecta se deberá validar haciendo uso de una rutina interna (VALFICHA) para descartar los inválidos. La rutina deberá validar todos los campos del registro (tipo de datos, valores y que la ficha quepa en el tablero)  
Se pide
1.	Carga del tablero
2.	Codificación de rutina interna VALFICHA
3.	Para aquellos alumnos con padrón PAR se deben imprimir los nros de filas donde todos los elementos tienen * mientras que los alumnos con padrón IMPAR los nros de columnas donde todos tiene *.

## Examen Parcial - 3ra Oportunidad - 14/7/2020
Se cuenta con un archivo en formato binario llamado ENCUESTA.DAT que contiene información de las respuestas de una encuesta que consultaba a empleados de 10 compañías cuál es el recurso más importante que el empleador debía pagar para facilitar el trabajo remoto y daba para elegir 4 opciones (Internet, Computadora, Silla, Luz). Cada registro del archivo representa la respuesta de un empleado y contiene la siguiente información:
•	Código de recurso: 2 bytes en formato ASCII (IN, CO, SI, LU)
•	Código de compañía: 1 byte en formato binario punto fijo sin signo (1 a 10)
Se pide realizar un programa en assembler Intel que:

1.	Lea el archivo y por cada registro llene una matriz (M) de 4x10 donde cada fila representa a un recurso y cada columna una compañía.  Cada elemento de M es un binario de punto fijo sin signo de 2 bytes y representa la sumatoria de respuestas para cada recurso en cada compañía; 
2.	Validar los datos del registro mediante una rutina interna (VALREG) para que puedan ser descartados los inválidos.
3.	Padrón PAR: ingresar por teclado un código de recurso e informar por pantalla la compañía que más lo eligió y que % representa del total.  Padrón IMPAR: ingresar por teclado un código de compañía e informar por pantalla el recurso con mayor cantidad de votos y que % representa del total.

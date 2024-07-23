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


## AGROQUIMICOS
Se dispone de una matriz (M) de 50x50 elementos que almacena información sobre agroquímicos a aplicar en un campo. Cada 
 elemento de M ocupa 4 bytes y representa una parcela del campo. El primer entero de 2 bytes corresponde a la cantidad de 
 litros de compuesto fungicida a aplicar en esa parcela y el segundo, la cantidad de litros de compuesto fertilizante.

Además, se cuenta con un archivo AGRO.DAT que contiene una recomendación del proveedor sobre las cantidades de agroquímicos 
 a aplicar en cada parcela, con registros de ancho fijo de acuerdo al siguiente formato:

   - 1 byte en BPF c/s indicando el nro. de fila de la parcela (1 a 50)
   - 1 byte en BPF c/s indicando el nro. de columna de la parcela (1 a 50)
   - 1 byte en ASCII con los siguientes valores posibles: 'U' para fungicida | 'F' para fertilizante
  - 2 bytes en BPF sin signo indicando la cantidad de litros de compuesto a aplicar.

 Se pide codificar un programa en Assembler de Intel 80x86 que permita:
 1) Recorrer el archivo de recomendaciones y actualizar la matriz sumando al valor preexistente el valor recomendado en cada
 registro
 2) Chequear que los registros del archivo contienen valores válidos para el dominio del problema. 
    Esta validación deberá realizarse en una rutina aparte con rótulo VALIDA. Los registros no válidos deberán ser descartados.
 



## Deptos(16-06-2020)
Ej Parcial (1ra Oportunidad - 16-06-2020) (Dptos) F,R,R
 Se dispone de una matriz 12x12 que representa un edificio nuevo a estranar, donde tiene
12 pisos con 12 departamentos en cada uno.
 Cada elemento de la matriz es un binario de 4 bytes, donde guarda un precio de venta en U$S de 
cada departamento. Se dispone de
 un archivo (PRECIOS.dat) que contiene los precios de los departamentos, donde cada 
registro del archivo contiene los sig campos:
       - Piso: Caracter de 2 bytes
       - Departamento: Binario de 1 byte
       - Precio Venta: Binario de 4 bytes

 Se pide realizar un programa en assembler Intel 80x86 que realice la carga de la 
matriz a través del archivo. Como la informacion 
 del archivo puede ser incorrecta se debera validar haciendo uso de una rutina interna (VALREG) que descartará los registros
 invalidos (la rutina deberá validar todos los campos del registro).  

 Una vez finalizada la carga, se solicitara ingresar por teclado un numero (x) y un 
precio de venta (no se requieren validar) y se
 debera mostrar todos los departamentos/pisos cuyo precio de venta sea menor al ingresado.
      - Para alumnos con Padrón Par, x será un numero de piso y se debera mostrar por pantalla todos los numeros de 
                     departamento cuyo precio sea inferior al ingresado en el piso ingresado.

      - Para alumnos con Padrón Impar, x será un numero de departamento y se debera mostrar por pantalla todos los numeros de 
                     piso donde el departamento ingresado tenga precio inferior al ingresado.

## Ej Parcial (06-09-2020) (Calendario) TyR

 Se dispone de una matriz C que representa un calendario de actividades de una persona.
 La matriz C está formada por 7 columnas (que corresponden a los dias de la semana)
 y por 6 filas (que corresponden a las semanas que puede tener como maximo un mes en un calendario)
 Cada elemento de la matriz es un BPF s/signo de 2 bytes (word) representa la cantidad de 
 actividades que realizara dicho dia en la semana. Ademas se dispone de un archivo de entrada
 llamado CALEN.DAT donde cada registro tiene el siguiente formato:
       - Dia de la Semana: Caracter de 2 bytes (DO, LU, MA, MI, JU, VI, SA)
       - Semana: Binario de 1 byte (1, 2... 6)
       - Actividad: Caracteres de longitud 20 con la descripcion.

 Como la informacion leida del archivo puede ser erronea, se dispone una rutina interna llamada 
 VALCAL para su validacion. Se pide realizar un programa assembler Intel x86 que actualice la
 matriz C con aquellos registros validos. Al finalizar la actualizacion se solicitara el ingreso por
 teclado de una semana y se debe generar un listado indicando: "Dia de la Semana = Cantidad de Actividades"
 Ejemplo:

       Dia         -   Cant. Act
       Domingo             0
       Lunes               0
       Martes              2
       Miercoles           0
       Jueves              0
       Viernes             0
       Sabado              0

## Ej Parcial (Interactivo Campus) (Encuestas) TyR
 ejintegrador.asm
 Se cuenta con un archivo en formato binario llamado ENCUESTA.DAT que contiene información de las respuestas de una encuesta. La 
 encuesta pretende conocer los votantes aproximados de ciertos partidos políticos (de una lista de 5 opciones) en las 24 provincias del país.
 Cada registro del archivo representa una respuesta y contiene la siguiente información:
       - Partido político: 3 bytes:  FTD, PRO, UCR, LLA ó, FDI
       - Código de ciudad: 1 bytes en formato binario punto fijo sin signo (1 a 24)

 Se pide realizar un programa en assembler Intel que lea el archivo y por cada registro actualice una matriz (M) de 5x24 donde 
 cada fila representa un partido político y cada columna una provincia.  Cada elemento de la matriz M representa la sumatoria de 
 respuestas para cada partido político en las provincias. Los datos de cada registro del archivo deberán ser validados mediante 
 una rutina interna llamada VALREG para descartar los incorrectos. 

 Por último, según su número de padrón, el programa deberá resolver lo siguiente:
       - Padrón Par: ingresar por teclado un código de provincia e informar por pantalla 
                     el código del partido político con menor intención de voto.

       - Padrón Impar: ingresar por teclado un código de provincia e informar por pantalla 
                       el código del partido político con mayor intención de voto.


## Ej Parcial 18 10 (Pedro) (Submatriz) EF,R,R,R

Se dispone de una matriz M en memoria de 20x20 en la que cada elemento (i,j) es un BPF c/signo
de 1 byte y de un archivo SUBMAT.dat que contiene informacion para obtener submatrices dentro
de la matriz M. Cada registro del archivo cuenta con los siguiente campos:
       - Empaquetado de 2 bytes para indicar num de fila (F)
       - Empaquetado de 2 bytes para indicar num de columna (C)
       - Empaquetado de 2 bytes para indicar la dimesion de la submatriz cuadrada
         con vertice superior derecho dado por F y C

Se pide: 
1 - Codificar un programa en assembler de intel 80x86 que realice la sumatoria de los
los elementos de la diagonal principal de cada submatriz y muestr por pantalla la mayor de ellas.
 
2 - Codificar una rutina interna VALSM para validar los datos del registro. La rutina debera
validar que F y C no superen la dimension de M y que la submatriz quede dentro de los limites de M.


## EjIntegradorW 10 10 (Dario) (Autos)

 Dada un archivo en formato BINARIO que contiene informacion sobre los autos, llamado listado.dat
 donde cada REGISTRO del archivo representa informacion de un auto con los campos:
       - marca:                      10 caracteres
       - año de fabricacion:         4 caracteres
       - patente:                    7 caracteres
       - precio:                     4 bytes en bpf s/signo

 Se pide codificar un programa en assembler intel que lea cada registro del archivo listado y guarde
 en un nuevo archivo en formato binario llamado seleccionados.dat las patente y el precio (bpf c/signo) de aquellos
 autos cuyo año de fabricacion esté entre 2020 y 2022 (inclusive) y cuyo precio sea inferior a 5.000.000$
 Como los datos del archivo pueden ser incorrectos, se deberan validar mediante una rutina interna:
 Se deberá validar:
       - Marca (que sea Fiat, Ford, Chevrolet, o Peugot)
       - Año (que sea un valor numerico y que cumpla la condicion indicada del rango)

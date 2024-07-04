# Simulador de caché

En este trabajo práctico se implementará un simulador de caché parametrizado. Serán configurables las distintas características de la caché simulada (tamaño, número de sets y asociatividad), y el programa principal leerá y simulará una secuencia de operaciones desde un archivo de trazas.

## Requisitos formales

El comportamiento del programa se describe en detalle en la sección Especificaciones. En esta sección se listan primero los requisitos formales de la implementación y de la entrega.

### Lenguaje

La implementación del simulador debe realizarse en C (versión del estándar C11). Se pueden usar todas las funciones de la biblioteca estándar de C, incluyendo extensiones de GNU.

### Makefile

Deberá incluirse en la entrega un archivo Makefile tal que, al correr en el directorio de la entrega la orden make cachesim, se compile dicho binario en el directorio.

El archivo Makefile no debe asumir que el compilador es GCC. En particular, se debe cuidar:

- no escribir ninguna regla explícita, esto es, usar solamente líneas de dependencias del estilo: `cachesim: cachesim.o foo.o bar.o`.

- de escribirse reglas explícitas, referenciar al compilador de C con la variable `$(CC)` de make, nunca con nombres prefijados (como ‘gcc’)

- a la hora de dar valor a la variable `CFLAGS`, hacerlo mediante el operador de asignación condicional: `CFLAGS ?= -g -O2 -std=gnu11 -Wall -Wextra`

- nunca asignar un valor a la variable CC (ni siquiera condicionalmente)

- para enlazar con la biblioteca matemática, se puede usar: LDLIBS := -lm.

Ejemplo completo:

```
CFLAGS ?= -g -O2 -std=gnu11 -Wall -Wextra -Wvla
LDLIBS := -lm

cachesim: cachesim.o

.PHONY: clean
```

### Entrega

La entrega se realizará en el repositorio de Git proporcionado por la cátedra, en el subdirectorio cachesim de dicho repositorio. En ese subdirectorio deberá hallarse todo el código del simulador.

El directorio cachesim debe añadirse en una rama separada dev_tp4, para entonces crear un pull request desde dicha rama hacia la rama tp4. Sobre ese pull request se realizará la corrección del trabajo.

## Especificaciones

En esta sección se especifica en detalle el formato de los archivos de traza que manipula el simulador, así como la interfaz de línea de comandos que el programa debe seguir. Se indica, asimismo, el formato exacto de salida que se espera del programa.

### Archivos de traza

Todas las simulaciones se realizarán sobre archivos de trazas de accesos a memoria, en el formato que se especifica a continuación. Cada uno de esos archivos enumera una serie de operaciones e indica, para cada una de ellas, tanto el tipo de la operación (lectura o escritura) como la direccion de memoria sobre la que se realiza.

Como dato interesante, los archivos de traza proporcionados corresponden a ejecuciones reales de varios programas, con lo que al simularlos bajo distintas configuraciones, los resultados son indicativos de cómo afecta la configuración de la caché a programas existentes. *(En realidad las trazas usadas corresponden a programas de benchmarking de la colección [MiBench](https://ieeexplore.ieee.org/document/990739). Por tanto, si bien son programas “reales”, son del tipo normalmente empleado para medir el rendimiento de una computadora (CPU, memoria y caché), o de su software (compilador y sistema operativo).)*

Cada archivo de trazas contiene un número de líneas N, cada una de las cuales representa un acceso a memoria. Un ejemplo de archivo de traza sería:
```
0xb7fc7489: W 0xbff20468 4 0xb7fc748e
0xb7fc748e: R 0xbff20468 4 0xb7fc748e
0xb7fc7495: W 0xbff20478 4 0xbff204b0
0xb7fc749e: R 0xb7fd9ff4 4 0x15f24
```
Los cinco campos de cada línea representan:

1. El primer número en hexadecimal es el instruction pointer, esto es, la ubicación en memoria de la instrucción que está siendo ejecutada.

2. Un caracter ASCII indicando si la operación es de lectura: ‘R’; o de escritura: ‘W’.

3. El siguiente valor en hexadecimal es la dirección de memoria a la que se realiza el acceso.

4. Un número entero positivo (por ejemplo, 4 u 8) que indica la cantidad de bytes que la instrucción lee, o escribe.

5. El último valor en hexadecimal corresponde a los datos que se leyeron o escribieron.

El programa simulará estos accesos con una caché del tipo indicado, y reportará las estadísticas correspondientes. Los detalles de la simulación (cálculo de tiempos, etc.) se explican en la sección Operación.

#### Aclaraciones

- Las direcciones de memoria son siempre de 32 bits.

### Línea de comandos

La interfaz del programa en la línea de comandos es:

```
$ ./cachesim tracefile.xex C E S [ -v n m ]
```
Los cuatro primeros argumentos son:
1. el archivo de traza a simular
2. el tamaño de la caché C, en bytes
3. la asociatividad de la caché, E
4. el número de sets de la caché, S

Ejemplo de invocación:

```
$ ./cachesim blowfish.xex 2048 4 8
```

El parámetro `-v` es opcional pero, de estar presente, siempre aparece en quinto lugar, seguido de dos números enteros. Su presencia activa un “modo verboso” en que se imprime información detallada para un subconjunto de las operaciones, tal y como se explica en la sección Salida del programa.

#### Condiciones de error

El programa debe imprimir un mensaje de error, y terminar con estado distinto de cero, en cada uno de los casos siguientes:

- si el número de argumentos no es 4 o 7;
- si el archivo de trazas especificado no existe;
- si alguno de los parámetros C, E o S no son potencia de dos;
- si los argumentos n y m del modo verboso no son números enteros que cumplan 0 ≤ n ≤ m

#### Precondiciones

El programa puede asumir que, si el archivo especificado existe, entonces es un archivo de trazas válido, y todas sus líneas respetan el formato especificado anteriormente.

### Parámetros fijos

Hay dos cosas que no se parametrizan en el simulador, que son:

- la política que desalojo, que es siempre least-recently used (LRU)
- la penalty por accesos a memoria en el cómputo de tiempos, que es siempre 100 ciclos (ver sección Detalle de casos).

### Salida del programa

La salida del programa sigue siempre el mismo formato y se estructura en dos partes (de estas dos partes, la primera solo se muestra en modo verboso):

1. Si se especificó la opción `-v`, se habilita el modo verboso para el subconjunto de operaciones en el rango [n, m] (rango inclusivo). Así, para cada una de ellas se imprimirá una línea con información detallada sobre su resultado, en el formato especificado en la sección Modo verboso.

    Debe considerarse que, en el archivo, las operaciones se enumeran comenzando desde 0. Por tanto, si se especificase por ejemplo `./cachesim … -v 0 9`, se mostraría información detallada para los primeros diez accesos a memoria (que corresponderían a las diez primeras líneas del archivo).

2. En segundo lugar, al finalizar la simulación se imprime siempre un resumen de la ejecución y una serie de estadísticas recolectadas. Esta información se debe imprimir en el orden y formato especificado en la sección Resumen y estadísticas.

### Modo verboso

Si se especifica un rango [n, m] para el que mostrar información detallada, para cada operación en el rango se debe imprimir una línea con la siguiente información:

1- el índice de la operación (este campo será n en la primera línea que se imprima, y m en la última)

2- el identificador de caso según lo explicado en la sección Detalle de casos, que será uno de los siguientes valores:
        ‘1’ para cache hit
        ‘2a’ para clean cache miss
        ‘2b’ para dirty cache miss

3- cache index: el índice (en hexadecimal) del set correspondiente a la dirección, que será un valor en el rango [0, S).

4- cache tag: el valor (en hexadecimal) del tag correspondiente a la dirección de la operación

5- cache line: número de la línea leída o escrita en el set, que será un valor decimal en el rango [0, E).

6- line tag: el tag presente anteriormente en la línea (mostrar -1 si no había datos válidos)

7- valid bit: 1 o 0 según la línea de caché elegida tuviera previamente datos válidos, o no.

8- dirty bit: 0 o 1 según el bloque estuviera previamente sincronizado con memoria principal, o no.

9- last used: solo para cachés con asociatividad E > 1, el índice de la operación que usó este bloque por última vez.

### Resumen y estadísticas

Durante la simulación, se deben recolectar ciertas métricas, que serán mostradas al final de la ejecución en el formato exacto que se muestra abajo. Las métricas necesarias son:

- número de lecturas (loads)
- número de escrituras (stores)
- número total de accesos (loads + stores)
- número de misses de lectura (rmiss)
- número de mises de escritura (wmiss)
- número total de misses (rmiss + wmiss)
- número de “dirty read misses” y “dirty write misses”
- cantidad de bytes leídos de memoria (bytes read)
- cantidad de bytes escritos en memoria (bytes written)
- tiempo de acceso acumulado (en ciclos) para todas las lecturas
- tiempo de acceso acumulado (en ciclos) para todas las escrituras
- miss rate total

Para la definición exacta de estas métricas, consultar la sección Métricas. Una vez finalice la simulación, se las deberá imprimir en el siguiente formato:

```
2-way, 64 sets, size = 4KB
loads 65672 stores 34328 total 100000
rmiss 679 wmiss 419 total 1098
dirty rmiss 197 dirty wmiss 390
bytes read 17568 bytes written 9392
read time 153272 write time 115228
miss rate 0.010980
```
donde la primera línea es una mera descripción de los parámetros de la caché.

## Operacion

En esta sección se explica:

- para cada métrica, la definición exacta de qué debe medir
- para cada acceso, los distintos casos que pueden ocurrir, y la penalización (en tiempo) de cada uno

### Metricas

Las dos primeras métricas, loads y stores, corresponden simplemente al número de operaciones de cada tipo (`R` y `W`), y su suma debe corresponder al total de líneas en el archivo de trazas.

Un “miss de lectura” ocurre ante cualquier operación de tipo `R` que resulte en un acceso a memoria. Un “miss de escritura” es el caso equivalente, pero para operaciones de tipo `W`. En ambos casos se incrementará el valor de las métricas bytes read y bytes written según corresponda (¡teniendo en cuenta el tamaño del bloque!).

Las métricas dirty rmiss y dirty wmiss son el subconjunto de misses en que se escribe en memoria, esto es: se remplaza un bloque de la caché, y ese bloque tenía datos que no habían sido enviados aún a memoria principal. (En otras palabras, el dirty bit de la línea remplazada estaba a 1.)

Finalmente, el miss rate total es la división del número total de misses por el número total de accesos. (La contabilización de tiempos de lectura y escritura se describen en la siguiente sección.)

### Detalle de casos

Cada operación en la cache resultará en uno de estos tres casos:

1- hit;
2- miss; que puede ser:
    - clean
    - dirty

Sea un acceso a la dirección M, cuyo set (cache index) resulta ser i; dicho set tiene contiene E líneas, que numeramos de 0 a E-1. Entonces:

1. si hay un hit, significa que hay la línea número k, con 0 ≤ k < E, tiene una coincidencia con M en su tag; en ese caso:
    - el tiempo que toma la operación es 1 ciclo (ver sección Métricas)
    - el campo last-used de la línea k se actualiza con el índice de la operación actual (para el mecanismo LRU)
    - si el acceso es de escritura, se pone a 1 el dirty bit del bloque
2. si se produce un miss, se debe elegir una línea k donde alojar el bloque; ésta siempre será: bien la línea no válida de menor índice, bien la línea con menor valor de last-used. Entonces puede suceder:
    a. la línea a desalojar no tiene datos válidos, o bien los tiene pero el dirty bit es 0: clean cache miss. Se lee el bloque M de memoria y:
        - el tiempo de acceso en ciclos es 1 + penalty
        - se actualiza el campo last-used
        - si el acceso es de escritura, se pone a 1 el dirty bit del bloque
    b. la línea a desalojar tiene su dirty bit a 1: dirty cache miss. Se escribe en memoria el bloque existente y:
        - se lee el bloque M de memoria
        - el tiempo de acceso en ciclos es 1 + 2 × penalty
        - se actualiza el campo last-used
        - si el acceso es de escritura, se pone a 1 el dirty bit del bloque

### Ejemplo

Dado el archivo de traza [adpcm.xex](https://github.com/aguirre-ivan/orgacomp-tps/blob/main/tp4/cachesim/adpcm.xex), se ofrecen muestras de la salida en las siguientes configuraciones:

- 2KiB, 2-way, 64 sets:

```
$ ./cachesim adpcm.xex 2048 2 64 -v 0 15000
```
Salida esperada: [adpcm_2048-2-64.txt](https://github.com/aguirre-ivan/orgacomp-tps/blob/main/tp4/cachesim/adpcm_2048-2-64.txt)

- 4KiB, direct-mapped, 256 sets:

```
$ ./cachesim adpcm.xex 4096 1 256 -v 0 10000
```
Salida esperada: [adpcm_2048-2-64.txt](https://github.com/aguirre-ivan/orgacomp-tps/blob/main/tp4/cachesim/adpcm_4096-1-256.txt)

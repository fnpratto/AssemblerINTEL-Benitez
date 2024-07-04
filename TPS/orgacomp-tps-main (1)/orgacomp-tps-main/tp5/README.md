# Arquitectura
Este trabajo consta de 2 partes, donde se plantea el estudio de la arquitectura Y86-64 vista en clase (ver libro [BRY15]) y su modificación utilizando el lenguaje HCL.

Descargar los fuentes necesarios en el archivo [archlab.tar](https://github.com/aguirre-ivan/orgacomp-tps/tree/main/tp5/archlab.tar).

## Parte A

Para esta primera parte se debe implementar en assembler Y86-64 las tres funciones del archivo sim/misc/examples.c. Cada función debe ir en un archivo separado:

- **sum.ys**: programa a partir de la función `sum_list()`
- **rsum.ys**: ídem, `rsum_list()`
- **copy.ys**: ídem, `copy_block()`

Estos archivos tienen que ser programas completos ejecutables tanto por el intérprete de instrucciones *yis* como por el simulador *ssim*. Para ello, deben incluir variables globales los datos sobre los que trabajar (*ver valores en archlab.pdf*), así como un stack. Se puede usar como punto de partida el archivo *sim/y86-code/asum.ys*.

Para compilar y ejecutar:
```
$ tar -xf sim.tar
$ cd sim
$ make

$ cd y86-code
$ ../misc/yas asum.ys          # Genera asum.yo
$ ../misc/yis asum.yo          # Corre con intérprete

$ cd ../seq
$ ./ssim ../y86-code/asum.yo   # Corre con simulador
```
Tras la ejecución, se debe verificar que el valor de *%rax* es el esperado (`0xcba` en los tres casos). Para *copy.ys*, además, se deben revisar los cambios en memoria para verificar que la copia se realizó con éxito.

## Parte B

En esta parte se desea modificar el archivo *sim/seq/seq-full.hcl* para añadir la instrucción `IADDQ`, que suma un inmediato a un registro (por ejemplo: `iaddq $8,%rax`). Para ello se deben configurar las distintas etapas y señales, añadiendo referencias a `IIADDQ` donde corresponda.

El archivo *y86-code/asumi.ys* es una versión de *asum.ys* que utiliza la instrucción `iaddq`. Se pueden correr con el intérprete de instrucciones para observar el mismo resultado en ambas versiones:
```
$ ../misc/yis ../y86-code/asum.yo | grep %rax
%rax:   0x0000000000000000      0x0000abcdabcdabcd

$ ../misc/yis ../y86-code/asumi.yo | grep %rax
%rax:   0x0000000000000000      0x0000abcdabcdabcd
```
En el simulador, en un principio solo funciona la primera versión:
```
$ ./ssim ../y86-code/asum.yo | grep '^%rax'
%rax:   0x0000000000000000      0x0000abcdabcdabcd

$ /ssim ../y86-code/asumi.yo | grep '^%rax'
%rax:   0x0000000000000000      0x0000000d000d000d
                                ^^^^^^^^^^^^^^^^^^
```
Pero una vez completado el ejercicio, recompilando el simulador en su versión *full*:
```
$ make VERSION=full clean all
# Building the seq-full.hcl version of SEQ
...

$ ./ssim ../y86-code/asumi.yo | grep '^%rax'
%rax:   0x0000000000000000      0x0000abcdabcdabcd
```
Con `make testssim` se puede comprobar que el resto de funcionalidad del simulador sigue funcionado:
```
$ cd ../y86-code
$ make testssim
...
... ISA Check Succeeds
```

## Parte C

Esta parte consiste en modificar dos archivos para lograr que la ejecución de cierto código corra lo más rápido posible. Estos archivos son el código *ys* de una función y la implementación PIPE de la aquitectura.

A diferencia de los anteriores, en este caso se debe trabajar en el directorio `sim/pipe`.

El archivo `ncopy.ys` contiene la implementación de una función que copia un arreglo de enteros de una dirección src a una dirección dst.

El archivo `pipe-full.hcl` implementa, en código HCL, la arquitectur PIPE vista en clase.

### Compilación y ejecución

Utilizando el código provisto se pueden generar pruebas para validar la correcta ejecución código. Uno de los ejecutables, `gen-driver.py`, genera arreglos de dimensiones variadas para copiar. Ejecutando
```
$ make drivers
```
genera dos programas de prueba:

- `sdriver.yo`: es un archivo que prueba la ejecución de `ncopy` con arreglos chicos, y si funciona bien finaliza con el valor 2 en *%rax*.
- `ldriver.yo`: es un archivo que prueba la ejecución de `ncopy` con arreglos de 63 elementos, y si funciona bien finaliza con el valor 31 en *%rax*.

Cada vez que se modifique `ncopy.ys` es necesario volver a ejecutar `make drivers`.

Cada vez que se modifica `pipe-full.hcl` es necesario ejecutar make psim VERSION=full.

Para ejecutar los archivos generados con `make drivers` es necesario escribir:
```
./psim -g sdriver.yo
./psim -g ldriver.yo
```
Notar que `-g` implica que se quiere probar en modo GUI y es necesario compilar con la varible `HAS_GUI` definida.

El archivo *archlab.pdf* contiene más información sobre las pruebas y validaciones de la parte C.

El resultado de este trabajo se ve al ejecutar el *script* de pruebas
```
./benchmark.pl
```
Este script reporta el CPE promedio para una serie de arreglos de prueba. En el caso del archivo sin modificar, el CPE medio es 15.18.
# Cola enlazada

Se pide implementar en assembly x86_64 una cola enlazada de punteros genéricos. Para ello se dispone de los siguientes archivos:

- el archivo [cola.h](https://github.com/aguirre-ivan/orgacomp-tps/blob/main/assembly/cola.h) contiene la lista de primitivas a implementar, así como la descripción de cada una de ellas. (Nota sobre pre-condiciones: para todas las primitivas que reciben un puntero cola_t *, se puede asumir que este puntero nunca es nulo y que fue obtenido previamente mediante cola_crear).

- el archivo [cola_defs.c](https://github.com/aguirre-ivan/orgacomp-tps/blob/main/assembly/cola_defs.c) contiene las definiciones privadas de los struct cola y nodo; la implementación en assembly debe ser compatible con estas definiciones, que no está permitido cambiar.

- en un archivo aparte, [cola_asm.h](https://github.com/aguirre-ivan/orgacomp-tps/blob/main/assembly/cola_asm.h), se proporcionan constantes con el tamaño de dichos structs, y los offsets de cada uno de sus miembros; así, se puede incluir este archivo desde un el archivo .S para usar constantes simbólicas en lugar de valores numéricos fijos en la implementación de las primitivas.

- el archivo [cola_impl.S](https://github.com/aguirre-ivan/orgacomp-tps/blob/main/assembly/cola_impl.S) contiene el esqueleto de las funciones a implementar, así como el “budget” (o presupuesto) de instrucciones condicionales que se puede usar para cada una de ellas. Esto quiere decir que, para la mayoría de las funciones, se indica si se la debe implementar con saltos o conditional moves, y cuántos está permitido usar.)

- finalmente, el archivo [pruebas_cola.c](https://github.com/aguirre-ivan/orgacomp-tps/blob/main/assembly/pruebas_cola.c) contiene una lista de pruebas unitarias sugeridas para verificar el correcto comportamiento de la cola. El archivo no está completo, pero se proporciona un segundo archivo, pruebas_pila.c, que se puede usar como guía para finalizar las pruebas de la cola.

## Declaracion del origen

El objetivo de esta parte del lab es poder escribir una pequeña cantidad de código en assembly (entre 50 y 100 líneas) que mayormente manipula structs y punteros.

Ante cualquier trabajo práctico que suponga escribir código assembly, existe la tentación de realizar la implementacion en otro lenguaje (por ejemplo, C), y basar la entrega final en código generado por un compilador.

Solo serán aceptadas las entregas que incluyan, en el directorio assembly, un archivo llamado ORIGEN.txt con la siguiente declaración:

```
Todo el código propuesto como solución al trabajo es autoría de los
integrantes, y ha sido escrito sin leer código assembly generado
automáticamente ni fuentes de terceros.
```

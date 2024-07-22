;21.Se cuenta con un archivo en formato binario llamado ENCUESTA.DAT que 
;contiene información de las respuestas de una encuesta.  La encuesta consultaba a que candidato votaría (de una lista de 4 opciones) 
;y se realizó en 10 ciudades.
;Cada registro del archivo representa una respuesta y contiene la siguiente información:
;•	Código de candidato: 2 bytes en formato ASCII (AF, MM, RL, SM)
;•	Código de ciudad: 1 bytes en formato binario punto fijo sin signo 
;Se pide realizar un programa en assembler Intel x86 que lea el archivo y 
;por cada registro llene una matriz (M) de 4x10 donde cada fila representa a un candidato y 
;cada columna una ciudad.  Cada elemento de la matriz M representa la sumatoria de respuestas para
; cada candidato en cada ciudad; para el llenado de M se hará uso de una rutina interna VALREG q validará 
;los datos de cada registro descartando los incorrectos. 
;Por último el programa debe pedir ingresar un código de candidato e informar por pantalla en que ciudad 
;tiene menos intención de votos teniendo en cuenta que habrá un vector en memoria de longitud 10, 
;cuyos elementos tienen 20 bytes de longitud con los nombres de las ciudades.



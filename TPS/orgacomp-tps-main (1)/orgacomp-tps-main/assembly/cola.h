#ifndef _COLA_H
#define _COLA_H

#include <stdbool.h>

struct cola;  // Definición completa en cola_defs.c
typedef struct cola cola_t;

// Crea una cola en memoria dinámica.
cola_t *cola_crear(void);

// Destruye la cola (libera la memoria de los nodos, y el struct cola).
void cola_destruir(cola_t *cola);

// Devuelve verdadero si la cola está vacía, falso en caso contrario.
bool cola_esta_vacia(const cola_t *cola);

// Agrega un nuevo elemento al final de la cola. Devuelve falso si no se
// pudo reservar memoria para el nuevo nodo.
bool cola_encolar(cola_t *cola, void *valor);

// Devuelve el valor del primer elemento de la cola. Si la cola no tiene
// elementos, se devuelve NULL.
void *cola_ver_primero(const cola_t *cola);

// Desencola el primer elemento de la cola, devolviendo el valor almacenado.
// Si la cola está vacía, se devuelve NULL.
void *cola_desencolar(cola_t *cola);

#endif  // _COLA_H

#include "cola.h"
#include "cola_asm.h"

#include <assert.h>
#include <stddef.h>

typedef struct nodo {
    void *data;
    struct nodo *next;
} nodo_t;

struct cola {
    nodo_t *head;
    nodo_t *tail;
};

static_assert(sizeof(cola_t) == SIZEOF_COLA, "SIZEOF_COLA incorrecto");
static_assert(sizeof(nodo_t) == SIZEOF_NODO, "SIZEOF_NODO incorrecto");

static_assert(offsetof(cola_t, head) == OFFSET_HEAD, "OFFSET_HEAD incorrecto");
static_assert(offsetof(cola_t, tail) == OFFSET_TAIL, "OFFSET_TAIL incorrecto");

static_assert(offsetof(nodo_t, data) == OFFSET_DATA, "OFFSET_DATA incorrecto");
static_assert(offsetof(nodo_t, next) == OFFSET_NEXT, "OFFSET_NEXT incorrecto");

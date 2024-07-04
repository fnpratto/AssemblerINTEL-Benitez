//
// Este archivo contiene los tamaños y offsets del struct cola y el
// struct nodo, para ser usados desde cola_impl.S. Las definiciones
// se encuentran en cola_defs.c, desde donde se comprueba que estos
// valores sean correctos.
//

#define SIZEOF_COLA 16
#define OFFSET_HEAD 0
#define OFFSET_TAIL 8

#define SIZEOF_NODO 16
#define OFFSET_DATA 0
#define OFFSET_NEXT 8

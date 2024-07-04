/*
 * Ejemplo de pruebas para una pila de punteros.
 */

#include "acutest.h"


static void test_apilar(void) {
    int v[1];
    pila_t *pila = pila_crear();

    TEST_ASSERT(pila != NULL);
    TEST_CHECK(pila_esta_vacia(pila));
    TEST_CHECK(pila_apilar(pila, v));
    TEST_CHECK(!pila_esta_vacia(pila));

    pila_destruir(pila);
}


static void test_ver_tope(void) {
    int v[2];
    pila_t *pila = pila_crear();

    TEST_ASSERT(pila != NULL);
    TEST_CHECK(pila_esta_vacia(pila));
    TEST_CHECK(pila_ver_tope(pila) == NULL);

    TEST_CHECK(pila_apilar(pila, v));
    TEST_CHECK(!pila_esta_vacia(pila));
    TEST_CHECK(pila_ver_tope(pila) == &v[0]);

    TEST_CHECK(pila_apilar(pila, v + 1));
    TEST_CHECK(pila_ver_tope(pila) == &v[1]);

    pila_destruir(pila);
}


static void test_desapilar(void) {
    int v[3];
    pila_t *pila = pila_crear();

    TEST_ASSERT(pila != NULL);
    TEST_CHECK(pila_apilar(pila, v));
    TEST_CHECK(pila_apilar(pila, v + 1));
    TEST_CHECK(pila_apilar(pila, v + 2));

    TEST_CHECK(pila_desapilar(pila) == &v[2]);
    TEST_CHECK(pila_desapilar(pila) == &v[1]);
    TEST_CHECK(pila_desapilar(pila) == &v[0]);
    TEST_CHECK(pila_esta_vacia(pila));

    pila_destruir(pila);
}


static void test_varios_elementos(void) {
    int v[5];
    pila_t *pila = pila_crear();

    TEST_ASSERT(pila != NULL);

    TEST_CHECK(pila_apilar(pila, v));
    TEST_CHECK(pila_apilar(pila, v + 1));
    TEST_CHECK(pila_desapilar(pila) == &v[1]);

    TEST_CHECK(pila_apilar(pila, v + 2));
    TEST_CHECK(pila_desapilar(pila) == &v[2]);
    TEST_CHECK(pila_desapilar(pila) == &v[0]);
    TEST_CHECK(pila_esta_vacia(pila));

    TEST_CHECK(pila_apilar(pila, v + 3));
    TEST_CHECK(pila_desapilar(pila) == &v[3]);
    TEST_CHECK(pila_esta_vacia(pila));

    TEST_CHECK(pila_apilar(pila, v + 4));
    TEST_CHECK(pila_desapilar(pila) == &v[4]);
    TEST_CHECK(pila_esta_vacia(pila));
    TEST_CHECK(pila_ver_tope(pila) == NULL);

    pila_destruir(pila);
}


TEST_LIST = {{"pila apilar", test_apilar},
             {"pila ver primero", test_ver_tope},
             {"pila desapilar", test_desapilar},
             {"pila varios elementos", test_varios_elementos},
             {NULL, NULL}};

/*
 * Pruebas para una cola de punteros.
 */

#include "cola.h"
#include "acutest.h"


static void test_encolar(void) {
	int v[1];
	cola_t *cola = cola_crear();

	TEST_ASSERT(cola != NULL);
	TEST_CHECK(cola_esta_vacia(cola));
	TEST_CHECK(cola_encolar(cola, v));
	TEST_CHECK(!cola_esta_vacia(cola));

	cola_destruir(cola);
}

static void test_encolar_null(void) {
	cola_t *cola = cola_crear();

	TEST_ASSERT(cola != NULL);
	TEST_CHECK(cola_esta_vacia(cola));
	TEST_CHECK(cola_encolar(cola, NULL));
	TEST_CHECK(!cola_esta_vacia(cola));
	TEST_CHECK(cola_ver_primero(cola) == NULL);

	cola_destruir(cola);
}

static void test_ver_primero(void) {
	int v[3];
	cola_t *cola = cola_crear();

	TEST_ASSERT(cola != NULL);
	TEST_CHECK(cola_esta_vacia(cola));
	TEST_CHECK(cola_ver_primero(cola) == NULL);

	TEST_CHECK(cola_encolar(cola, v));
	TEST_CHECK(!cola_esta_vacia(cola));
	TEST_CHECK(cola_ver_primero(cola) == &v[0]);

	TEST_CHECK(cola_encolar(cola, v + 1));
	TEST_CHECK(cola_ver_primero(cola) == &v[0]);

	cola_destruir(cola);
}


static void test_desencolar(void) {
	int v[3];
	cola_t *cola = cola_crear();

	TEST_ASSERT(cola != NULL);
	TEST_CHECK(cola_encolar(cola, &v[0]));
	TEST_CHECK(cola_encolar(cola, &v[1]));
	TEST_CHECK(cola_encolar(cola, &v[2]));

	TEST_CHECK(cola_desencolar(cola) == &v[0]);
	TEST_CHECK(cola_desencolar(cola) == &v[1]);
	TEST_CHECK(cola_desencolar(cola) == &v[2]);

	cola_destruir(cola);
}


static void test_varios_elementos(void) {
	int v[5];
	cola_t* cola = cola_crear();

	TEST_ASSERT(cola != NULL);

	TEST_CHECK(cola_encolar(cola, v));
	TEST_CHECK(cola_encolar(cola, v + 1));
	TEST_CHECK(cola_desencolar(cola) == &v[0]);

	TEST_CHECK(cola_encolar(cola, v + 2));
	TEST_CHECK(cola_desencolar(cola) == &v[1]);
	TEST_CHECK(cola_desencolar(cola) == &v[2]);
	TEST_CHECK(cola_esta_vacia(cola));

	TEST_CHECK(cola_encolar(cola, v + 3));
	TEST_CHECK(cola_desencolar(cola) == &v[3]);
	TEST_CHECK(cola_esta_vacia(cola));

	TEST_CHECK(cola_encolar(cola, v + 4));
	TEST_CHECK(cola_desencolar(cola) == &v[4]);
	TEST_CHECK(cola_esta_vacia(cola));
	TEST_CHECK(cola_ver_primero(cola) == NULL);

	cola_destruir(cola);
}

static void test_volumen(void) {
	cola_t* cola = cola_crear();
	int size_valores = 1000;
	int valores[size_valores];
	bool encolado_ok = true;
	bool desencolado_ok = true;

	for (int i = 0; i < size_valores; i++) {
		if (!cola_encolar(cola, &valores[i])) encolado_ok = false;
	}

	TEST_CHECK(encolado_ok);

	for (int j = 0; j < size_valores; j++) {
		if (cola_desencolar(cola) != &valores[j]) desencolado_ok = false;
	}

	TEST_CHECK(desencolado_ok);
	TEST_CHECK(cola_esta_vacia(cola));
	TEST_CHECK(cola_ver_primero(cola) == NULL);

	cola_destruir(cola);
}

static void test_destruir(void) {
	int v[2];
	cola_t* cola = cola_crear();
	TEST_ASSERT(cola != NULL);
	TEST_CHECK(cola_encolar(cola, v));
	TEST_CHECK(cola_encolar(cola, v + 1));
	cola_destruir(cola);
}

TEST_LIST = {{"cola encolar", test_encolar},
			 {"cola encolar NULL", test_encolar_null},
			 {"cola ver primero", test_ver_primero},
			 {"cola desencolar", test_desencolar},
			 {"cola varios elementos", test_varios_elementos},
			 {"cola destruir con elementos", test_destruir},
			 {"cola volumen", test_volumen},
			 {NULL, NULL}};

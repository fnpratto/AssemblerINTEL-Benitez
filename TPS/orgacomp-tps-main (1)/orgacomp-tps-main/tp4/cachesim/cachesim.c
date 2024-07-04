#define _POSIX_C_SOURCE 200809L
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include "cache_simulator.h"

#define NULL_INDEX -1

/* *****************************************************************
 *                            FUNCTIONS
 *******************************************************************/

bool proccessInputFile(FILE* inputFile, char** argv, bool verboseMode) {
	char *linea = NULL;
	size_t tam = 0;

	int n = NULL_INDEX;
	int m = NULL_INDEX;

	int tam_cache = atoi(argv[2]);
	int ways = atoi(argv[3]);
	int sets = atoi(argv[4]);

	if (verboseMode) {
		n = atoi(argv[6]);
		m = atoi(argv[7]);
		verboseMode = false;
	}

	cache_simulator_t* cacheSimulator = createCacheSimulator(tam_cache, sets, ways);
	if (!cacheSimulator) {
		return false;
	}

	int indexOperation = -1;

	while ((getline(&linea, &tam, inputFile) != EOF)) {
		indexOperation++;

		if (n <= indexOperation && indexOperation <= m) {
			verboseMode = true;
		}

		processOperation(cacheSimulator, linea, verboseMode, stdout);

		verboseMode = false;

	}

	printMetricsInfo(cacheSimulator, stdout);

	destroyCacheSimulator(cacheSimulator);

	free(linea);

	return true;

}

/* *****************************************************************
 *                           ASSERTIONS
 *******************************************************************/

bool invalidNumberOfParameters (int argc){
	return (argc != 5 && argc != 8);
}

bool fileExists(const char* fileName) {
	FILE* fileToCheck = fopen(fileName, "r");

	if (fileToCheck) {
		fclose(fileToCheck);
		return true;
	}

	return false;
}

bool isPower2(int x) {
	int isNegative = (x >> 31) & 0x1;
	int var = x & (~x + 1); // if != x -> more than 1 bit
	int isPow2 = !(x ^ var);
	int isZero = !x;
	return isPow2 & !isNegative & !isZero;
}

bool invalidParametersNM(int n, int m) {
	return !((0 <= n) && (n <= m));
}

bool inputIsNotValid (int argc, char** argv) {
	if (invalidNumberOfParameters(argc)) {
		fprintf(stderr, "Cantidad de parametros invalida\n");
		return true;
	}

	if (!fileExists(argv[1])) {
		fprintf(stderr, "El archivo no existe\n");
		return true;
	}

	if (!(isPower2(atoi(argv[2])) && (isPower2(atoi(argv[3]))) && (isPower2(atoi(argv[4]))))) {
		fprintf(stderr, "Los parametros C, E y/o S no son potencia de 2\n");
		return true;
	}

	if (argc == 8 && invalidParametersNM(atoi(argv[6]), atoi(argv[7]))) {
		fprintf(stderr, "No se cumple la condicion 0 <= n <= m\n");
		return true;
	}

	return false;
}

/* *****************************************************************
 *                              MAIN
 *******************************************************************/

int main(int argc, char** argv) {

	if (inputIsNotValid(argc, argv)) return 1;

	bool verboseMode = false;
	char* fileName = argv[1];
	FILE* inputFile = fopen(fileName, "r");

	if (argc == 8) {
		verboseMode = true;
	}

	if (!proccessInputFile(inputFile, argv, verboseMode)) {
		return 1;
	};

	fclose(inputFile);

	return 0;
}
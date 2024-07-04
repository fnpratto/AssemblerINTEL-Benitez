#include "metric_counter.h"
#include <stdlib.h>
#include <stdio.h>

/* *****************************************************************
 *                             STRUCT
 *******************************************************************/

typedef struct cache_simulator cache_simulator_t;

/* *****************************************************************
 *                        PRIMITIVE FUNCTIONS
 *******************************************************************/

cache_simulator_t* createCacheSimulator(int sizeCache, unsigned int numberOfSets, int associavity);

void processOperation(cache_simulator_t* cacheSimulator, char* commandOperation, bool verboseMode, FILE* fileToPrintOn);

void printMetricsInfo(cache_simulator_t* cacheSimulator, FILE* fileToPrintOn);

void destroyCacheSimulator(cache_simulator_t* cacheSimulator);
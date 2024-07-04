#include <stdlib.h>
#include "metric_counter.h"
#include <stdio.h>

/* *****************************************************************
 *                             STRUCT
 * *****************************************************************/

struct metric_counter {
	int loads;			// numero de lecturas
	int stores;			// numero de escrituras
	int missR;			// numero de misses de lectura
	int missW;			// numero de misses de escritura
	int dirtyMissR;		// numero de dirty read misses
	int dirtyMissW;		// numero de dirty write misses
	int bytesRead;		// cantidad de bytes leidos en memoria
	int bytesWritten;	// cantidad de bytes escritos en memoria
	int accessTimeR;	// tiempo de acceso acumulado para todas las lecturas
	int accessTimeW;	// tiempo de acceso acumulado para todas las escrituras
};

/* *****************************************************************
 *                        PRIMITIVE FUNCTIONS
 * *****************************************************************/

metric_counter_t* createMetricCounter(void) {
	metric_counter_t* metricCounter = malloc(sizeof(metric_counter_t));
	if (metricCounter == NULL) return NULL;

	metricCounter->loads = 0;
	metricCounter->stores = 0;
	metricCounter->missR = 0;
	metricCounter->missW = 0;
	metricCounter->dirtyMissR = 0;
	metricCounter->dirtyMissW = 0;
	metricCounter->bytesRead = 0;
	metricCounter->bytesWritten = 0;
	metricCounter->accessTimeR = 0;
	metricCounter->accessTimeW = 0;

	return metricCounter;
}

void destroyMetricCounter(metric_counter_t* metricCounter) {
	free(metricCounter);
}

/* *****************************************************************
 *                        COUNTER FUNCTIONS
 * *****************************************************************/

void incLoads(metric_counter_t* metricCounter) {
	metricCounter->loads++;
}

void incStores(metric_counter_t* metricCounter) {
	metricCounter->stores++;
}

void incMissR(metric_counter_t* metricCounter) {
	metricCounter->missR++;
}

void incMissW(metric_counter_t* metricCounter) {
	metricCounter->missW++;
}

void incDirtyMissW(metric_counter_t* metricCounter) {
	metricCounter->dirtyMissW++;
}

void incDirtyMissR(metric_counter_t* metricCounter) {
	metricCounter->dirtyMissR++;
}

void incBytesRead(metric_counter_t* metricCounter, int bytes) {
	metricCounter->bytesRead += bytes;
}

void incBytesWritten(metric_counter_t* metricCounter, int bytes) {
	metricCounter->bytesWritten += bytes;
}

void incAccessTimeR(metric_counter_t* metricCounter, int time) {
	metricCounter->accessTimeR += time;
}

void incAccessTimeW(metric_counter_t* metricCounter, int time) {
	metricCounter->accessTimeW += time;
}

/* *****************************************************************
 *                          GETTER FUNCTIONS
 * *****************************************************************/

int getLoads(metric_counter_t* metricCounter) {
	return metricCounter->loads;
}

int getStores(metric_counter_t* metricCounter) {
	return metricCounter->stores;
}

int getTotalAccesses(metric_counter_t* metricCounter) {
	return metricCounter->loads + metricCounter->stores;
}

int getMissR(metric_counter_t* metricCounter) {
	return metricCounter->missR;
}

int getMissW(metric_counter_t* metricCounter) {
	return metricCounter->missW;
}

int getTotalMisses(metric_counter_t* metricCounter) {
	return metricCounter->missR + metricCounter->missW;
}

int getDirtyMissW(metric_counter_t* metricCounter) {
	return metricCounter->dirtyMissW;
}

int getDirtyMissR(metric_counter_t* metricCounter) {
	return metricCounter->dirtyMissR;
}

int getBytesRead(metric_counter_t* metricCounter) {
	return metricCounter->bytesRead;
}

int getBytesWritten(metric_counter_t* metricCounter) {
	return metricCounter->bytesWritten;
}

int getAccessTimeR(metric_counter_t* metricCounter) {
	return metricCounter->accessTimeR;
}

int getAccessTimeW(metric_counter_t* metricCounter) {
	return metricCounter->accessTimeW;
}

float getTotalMissRate(metric_counter_t* metricCounter) {
	float totalMisses = getTotalMisses(metricCounter);
	float totalAccesses = getTotalAccesses(metricCounter);

	return totalMisses / totalAccesses;
}
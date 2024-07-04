#include <stdlib.h>

/* *****************************************************************
 *                             STRUCT
 *******************************************************************/

typedef struct metric_counter metric_counter_t;

/* *****************************************************************
 *                        PRIMITIVE FUNCTIONS
 *******************************************************************/

metric_counter_t* createMetricCounter(void);

void destroyMetricCounter(metric_counter_t* metricCounter);

/* *****************************************************************
 *                        COUNTER FUNCTIONS
 *******************************************************************/

void incLoads(metric_counter_t* metricCounter);

void incStores(metric_counter_t* metricCounter);

void incMissR(metric_counter_t* metricCounter);

void incMissW(metric_counter_t* metricCounter);

void incDirtyMissW(metric_counter_t* metricCounter);

void incDirtyMissR(metric_counter_t* metricCounter);

void incBytesRead(metric_counter_t* metricCounter, int bytes);

void incBytesWritten(metric_counter_t* metricCounter, int bytes);

void incAccessTimeR(metric_counter_t* metricCounter, int time);

void incAccessTimeW(metric_counter_t* metricCounter, int time);

/* *****************************************************************
 *                          GETTER FUNCTIONS
 *******************************************************************/

int getLoads(metric_counter_t* metricCounter);

int getStores(metric_counter_t* metricCounter);

int getTotalAccesses(metric_counter_t* metricCounter);

int getMissR(metric_counter_t* metricCounter);

int getMissW(metric_counter_t* metricCounter);

int getTotalMisses(metric_counter_t* metricCounter);

int getDirtyMissW(metric_counter_t* metricCounter);

int getDirtyMissR(metric_counter_t* metricCounter);

int getBytesRead(metric_counter_t* metricCounter);

int getBytesWritten(metric_counter_t* metricCounter);

int getAccessTimeR(metric_counter_t* metricCounter);

int getAccessTimeW(metric_counter_t* metricCounter);

float getTotalMissRate(metric_counter_t* metricCounter);
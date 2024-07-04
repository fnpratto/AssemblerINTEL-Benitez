#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include "cache_simulator.h"
#include "metric_counter.h"

#define NULL_INDEX -1
#define HIT_TIME 1
#define PENALTY 100

/* *****************************************************************
 *                               STRUCT LINE
 *******************************************************************/

typedef struct line {
	int validBit;
	int dirtyBit;
	unsigned int tagIndex;
	int lastUsed;
} line_t;

void initializeEmptyLine(line_t* line) {
	line->validBit = 0;
	line->dirtyBit = 0;
	line->tagIndex = NULL_INDEX;
	line->lastUsed = NULL_INDEX;
}

void initializeEmptyLinesArray(line_t* lines, int associavity) {
	for (int i = 0; i < associavity; i++) {
		initializeEmptyLine(lines + i);
	}
}

/* *****************************************************************
 *                              STRUCT SET
 *******************************************************************/
typedef struct set {
	line_t* lines;
	int associavity;
} set_t;

bool initializeEmptySet(set_t* set, int associavity) {
	set->associavity = associavity;

	line_t* lines = calloc(associavity, sizeof(line_t));
	if (!lines) {
		return false;
	}

	initializeEmptyLinesArray(lines, associavity);

	set->lines = lines;

	return true;
}

void destroySet(set_t* set) {
	free(set->lines);
}

void destroySetsArray(set_t* sets, unsigned int numberOfSets) {
	for (unsigned int i = 0; i < numberOfSets; i++) {
		destroySet(sets + i);
	}
	free(sets);
}

bool initializeEmptySetsArray(set_t* sets, unsigned int numberOfSets, int associavity) {
	for (unsigned int i = 0; i < numberOfSets; i++) {
		if (!initializeEmptySet(sets + i, associavity)) {
			destroySetsArray(sets, numberOfSets);
			return false;
		}
	}

	return true;
}

/* *****************************************************************
 *                      STRUCT CACHE SIMULATOR
 *******************************************************************/
struct cache_simulator {
	unsigned int numberOfSets;
	set_t* sets;
	int sizeBlock;
	int currentOperationIndex;
	metric_counter_t* metricCounter;
};

typedef enum type_access {
	WRITTING,
	READING,
} access_type_t;
typedef enum case_indicator {
	CACHE_HIT,
	CLEAN_CACHE_MISS,
	DIRTY_CACHE_MISS,
} case_indicator_t;

/* *****************************************************************
 *                        PRIVATE FUNCTIONS
 *******************************************************************/

/*                            PRINTING                           	*/

// auxiliar of verbose mode in process operation
void printCaseIndicator(FILE* fileToPrintOn, case_indicator_t caseIndicator) {
	if (caseIndicator == CACHE_HIT) {
		fprintf(fileToPrintOn, "1");
	}
	else if (caseIndicator == CLEAN_CACHE_MISS) {
		fprintf(fileToPrintOn, "2a");
	}
	else if (caseIndicator == DIRTY_CACHE_MISS) {
		fprintf(fileToPrintOn, "2b");
	}

}

// auxiliar of metrics info
void printFirstLineMetricsInfo(FILE* fileToPrintOn, cache_simulator_t* cacheSimulator) {
	char* otherWay = "-way";
	char* directMapping = "direct-mapped";
	int sizeCache = (cacheSimulator->sizeBlock * cacheSimulator->numberOfSets * cacheSimulator->sets->associavity) / 1000;

	if (cacheSimulator->sets->associavity == 1) {
		fprintf(fileToPrintOn, "%s, ", directMapping);
	} else {
		fprintf(fileToPrintOn, "%d%s, ", cacheSimulator->sets->associavity, otherWay);
	}

	fprintf(fileToPrintOn, "%d sets, size = %dKB\n", cacheSimulator->numberOfSets, sizeCache);
}

/*                          COMMAND PROCESS                            */

unsigned calculateOffset(unsigned n) {
	unsigned offset = 0;
	while (n != 1){
		offset += 1;
		n >>= 1;
	}
	return offset;
}

unsigned int calculateTag(size_t numberOfSetsOffset, size_t blockOffsetOffset, unsigned int accessAddress) {
	unsigned int tag = accessAddress >> (numberOfSetsOffset + blockOffsetOffset);
	return tag;
}

unsigned int calculateSetIndex(size_t numberOfSetsOffset, size_t blockOffsetOffset, unsigned int accessAddress) {
	unsigned int indexMask = (1 << (blockOffsetOffset + numberOfSetsOffset)) - 1;
	unsigned int setIndex = (accessAddress & indexMask) >> blockOffsetOffset;
	return setIndex;
}

// returns line index avaliable to allocate
int getLineToDeallocate(set_t set) {
	for (int i = 0; i < set.associavity; i++) {
		if (!set.lines[i].validBit) {
			return i;
		}
	}

	int resultIndex = 0;

	for (int i = 0; i < set.associavity; i++) {
		if (set.lines[i].lastUsed < set.lines[resultIndex].lastUsed) {
			resultIndex = i;
		}
	}

	return resultIndex;
}

access_type_t getAccessType(char* commandOperation) {
	access_type_t type = strcmp(commandOperation, "R") == 0 ? READING : WRITTING;
	return type;
}

void assignAccessTypeAndAccessAddress(char* commandOperation, access_type_t* accessType, unsigned int* accessAddress) {
	char* commandOperationArray[5]; /* commandOperationArray[1] = (R or W) and commandOperationArray[2] = (access address) */
	char* token = strtok(commandOperation, " ");
	int i = 0;
	while (token != NULL){
		commandOperationArray[i++] = token;
		token = strtok(NULL, " ");
	}

	*accessType = getAccessType(commandOperationArray[1]);
	*accessAddress = strtoul(commandOperationArray[2], NULL, 0);
}

// returns line index if is tag hit, set.associavity if none
int getCoincidentLineTagIndex(set_t set, unsigned int tagIndexToCheck) {
	int coincidentLineTagIndex = set.associavity;

	for (int i = 0; i < set.associavity; i++) {
		if ((set.lines[i].tagIndex == tagIndexToCheck) && set.lines[i].validBit) {
			coincidentLineTagIndex = i;
			break;
			}
	}

	return coincidentLineTagIndex;
}

/* *****************************************************************
 *                        PRIMITIVE FUNCTIONS
 *******************************************************************/

cache_simulator_t* createCacheSimulator(int sizeCache, unsigned int numberOfSets, int associavity) {
	cache_simulator_t* cacheSimulator = calloc(1, sizeof(cache_simulator_t));
	if (cacheSimulator == NULL) {
		return NULL;
	}

	metric_counter_t* metricCounter = createMetricCounter();
	if (metricCounter == NULL) {
		free(cacheSimulator);
		return NULL;
	}

	set_t* sets = calloc(numberOfSets, sizeof(set_t));
	if (sets == NULL) {
		free(cacheSimulator);
		free(metricCounter);
		return NULL;
	}

	if (!initializeEmptySetsArray(sets, numberOfSets, associavity)) {
		free(cacheSimulator);
		free(metricCounter);
		free(sets);
		return NULL;
	}

	cacheSimulator->sets = sets;
	cacheSimulator->metricCounter = metricCounter;
	cacheSimulator->currentOperationIndex = 0;
	cacheSimulator->numberOfSets = numberOfSets;
	cacheSimulator->sizeBlock = sizeCache / (numberOfSets * associavity);

	return cacheSimulator;
}

void processOperation(cache_simulator_t* cacheSimulator, char* commandOperation, bool verboseMode, FILE* fileToPrintOn) {
	int accessTime = HIT_TIME;

	//* verbose mode
	case_indicator_t caseIndicator = CACHE_HIT;

	int previousTagIndex = NULL_INDEX;

	int validBitToPrint = 0;
	int dirtyBitToPrint = 0;

	bool isDirtyMiss = false;
	int lastUsedToPrint = NULL_INDEX;
	// */

	access_type_t accessType;
	unsigned int accessAddress;
	assignAccessTypeAndAccessAddress(commandOperation, &accessType, &accessAddress);

	unsigned blockOffsetOffset = calculateOffset(cacheSimulator->sizeBlock);
	unsigned numberOfSetsOffset = calculateOffset(cacheSimulator->numberOfSets);

	unsigned int setIndex = calculateSetIndex(numberOfSetsOffset, blockOffsetOffset, accessAddress);
	unsigned int tagIndex = calculateTag(numberOfSetsOffset, blockOffsetOffset, accessAddress);

	int coincidentLineIndex = getCoincidentLineTagIndex(cacheSimulator->sets[setIndex], tagIndex);
	int lineIndexToPrint = coincidentLineIndex;

	if (coincidentLineIndex < cacheSimulator->sets->associavity) { // cache hit
		validBitToPrint = cacheSimulator->sets[setIndex].lines[coincidentLineIndex].validBit;
		dirtyBitToPrint = cacheSimulator->sets[setIndex].lines[coincidentLineIndex].dirtyBit;
		lastUsedToPrint = cacheSimulator->sets[setIndex].lines[coincidentLineIndex].lastUsed;
		previousTagIndex = tagIndex;

		cacheSimulator->sets[setIndex].lines[coincidentLineIndex].lastUsed = cacheSimulator->currentOperationIndex; // refresh last used

		if (accessType == WRITTING) {
			cacheSimulator->sets[setIndex].lines[coincidentLineIndex].dirtyBit = 1;
			incAccessTimeW(cacheSimulator->metricCounter, accessTime);
		} else {
			incAccessTimeR(cacheSimulator->metricCounter, accessTime);
		}

	} else { // miss
		// * Line to deallocate
		int lineIndexToDeallocate = getLineToDeallocate(cacheSimulator->sets[setIndex]);
		int lineToDeallocateValidBit = cacheSimulator->sets[setIndex].lines[lineIndexToDeallocate].validBit;
		int lineToDeallocateDirtyBit = cacheSimulator->sets[setIndex].lines[lineIndexToDeallocate].dirtyBit;

		lastUsedToPrint = cacheSimulator->sets[setIndex].lines[lineIndexToDeallocate].lastUsed;
		validBitToPrint = lineToDeallocateValidBit;
		lineIndexToPrint = lineIndexToDeallocate;
		dirtyBitToPrint = lineToDeallocateDirtyBit;
		previousTagIndex = cacheSimulator->sets[setIndex].lines[lineIndexToDeallocate].tagIndex;

		cacheSimulator->sets[setIndex].lines[lineIndexToDeallocate].tagIndex = tagIndex; // refresh tag index
		cacheSimulator->sets[setIndex].lines[lineIndexToDeallocate].validBit = 1; 

		if (lineToDeallocateDirtyBit) { // dirty cache miss
			caseIndicator = DIRTY_CACHE_MISS;
			accessTime += 2 * PENALTY;
			isDirtyMiss = true;
			incBytesWritten(cacheSimulator->metricCounter, cacheSimulator->sizeBlock);
		} else { // clean cache miss
			caseIndicator = CLEAN_CACHE_MISS;
			accessTime += PENALTY;
		}


		if (accessType == READING) {
			incMissR(cacheSimulator->metricCounter);
			if (isDirtyMiss) {
				incDirtyMissR(cacheSimulator->metricCounter);
			}
			incAccessTimeR(cacheSimulator->metricCounter, accessTime);
			cacheSimulator->sets[setIndex].lines[lineIndexToDeallocate].dirtyBit = 0;
		} else { // writting
			incMissW(cacheSimulator->metricCounter);
			if (isDirtyMiss) {
				incDirtyMissW(cacheSimulator->metricCounter);
			}
			incAccessTimeW(cacheSimulator->metricCounter, accessTime);
			cacheSimulator->sets[setIndex].lines[lineIndexToDeallocate].dirtyBit = 1;
		}

		// in both cases

		incBytesRead(cacheSimulator->metricCounter, cacheSimulator->sizeBlock);
		cacheSimulator->sets[setIndex].lines[lineIndexToDeallocate].lastUsed = cacheSimulator->currentOperationIndex;

	}

	if (verboseMode) {
		fprintf(fileToPrintOn, "%d ", cacheSimulator->currentOperationIndex);
		printCaseIndicator(fileToPrintOn, caseIndicator);
		fprintf(fileToPrintOn, " %01x %01x", setIndex, tagIndex); // cache index and cache tag
		fprintf(fileToPrintOn, " %d", lineIndexToPrint);
		if (previousTagIndex == NULL_INDEX) {
				fprintf(fileToPrintOn, " -1"); // previous tag or -1 if it was empty
			} else {
				fprintf(fileToPrintOn, " %01x", previousTagIndex); // previous tag
			}
		fprintf(fileToPrintOn, " %d", validBitToPrint); // previous valid bit
		fprintf(fileToPrintOn, " %d", dirtyBitToPrint); // previous dirty bit
		if (cacheSimulator->sets->associavity > 1) {
			if (lastUsedToPrint == NULL_INDEX) {
				fprintf(fileToPrintOn, " 0");
			} else {
			fprintf(fileToPrintOn, " %d", lastUsedToPrint);
			}
		}
		fprintf(fileToPrintOn, "\n");
	}

	if (accessType == READING) {
		incLoads(cacheSimulator->metricCounter);
	} else {
		incStores(cacheSimulator->metricCounter);
	}

	cacheSimulator->currentOperationIndex++;
}


void printMetricsInfo(cache_simulator_t* cacheSimulator, FILE* fileToPrintOn) {
	metric_counter_t* metricCounter = cacheSimulator->metricCounter;

	printFirstLineMetricsInfo(fileToPrintOn, cacheSimulator);

	fprintf(fileToPrintOn, "loads %d stores %d total %d\n", getLoads(metricCounter), getStores(metricCounter), getTotalAccesses(metricCounter));

	fprintf(fileToPrintOn, "rmiss %d wmiss %d total %d\n", getMissR(metricCounter), getMissW(metricCounter), getTotalMisses(metricCounter));

	fprintf(fileToPrintOn, "dirty rmiss %d dirty wmiss %d\n", getDirtyMissR(metricCounter), getDirtyMissW(metricCounter));

	fprintf(fileToPrintOn, "bytes read %d bytes written %d\n", getBytesRead(metricCounter), getBytesWritten(metricCounter));

	fprintf(fileToPrintOn, "read time %d write time %d\n", getAccessTimeR(metricCounter), getAccessTimeW(metricCounter));

	fprintf(fileToPrintOn, "miss rate %f\n", getTotalMissRate(metricCounter));
}

void destroyCacheSimulator(cache_simulator_t* cacheSimulator) {
	destroySetsArray(cacheSimulator->sets, cacheSimulator->numberOfSets);
	destroyMetricCounter(cacheSimulator->metricCounter);
	free(cacheSimulator);
}
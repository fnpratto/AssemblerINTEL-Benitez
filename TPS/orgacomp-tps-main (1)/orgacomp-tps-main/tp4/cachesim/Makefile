CFLAGS ?= -pedantic -g -O2 -std=c11 -Wall -Wextra -Wvla
LDFLAGS := -lm
VALGRIND = valgrind --leak-check=full
CC = gcc

CACHESIM_OBJS = cachesim.o cache_simulator.o metric_counter.o
TESTING_OBJS = testing_equal_files.o

EXPECTED_FILE1 = adpcm_2048-2-64.txt
RESULT_FILE1 = test_adpcm_2048-2-64.txt
EXPECTED_FILE2 = adpcm_4096-1-256.txt
RESULT_FILE2 = test_adpcm_4096-1-256.txt

cachesim: $(CACHESIM_OBJS)

metric_counter.o: metric_counter.c
cache_simulator.o: cache_simulator.c metric_counter.c
cachesim.o: cache_simulator.c

test:
	$(CC) testing_equal_files.c -o testing
	make cachesim
	clear
	$(VALGRIND) ./cachesim adpcm.xex 2048 2 64 -v 0 15000 > $(RESULT_FILE1)
	$(VALGRIND) ./cachesim adpcm.xex 4096 1 256 -v 0 10000 > $(RESULT_FILE2)
	./testing $(RESULT_FILE1) $(EXPECTED_FILE1)
	./testing $(RESULT_FILE2) $(EXPECTED_FILE2)
	make clean

clean:
	rm -f $(CACHESIM_OBJS) $(TESTING_OBJS) cachesim testing $(RESULT_FILE1) $(RESULT_FILE2)

.PHONY: clean
CC ?= gcc
MAIN := pruebas_cola

CFLAGS := -Wall -g -std=gnu18

all: test

test: $(MAIN)
	valgrind -q ./$(MAIN)

clean:
	rm -f *.o $(MAIN) core vgcore.*

$(MAIN): pruebas_cola.o cola_defs.o cola_impl.o

.PHONY: all test clean

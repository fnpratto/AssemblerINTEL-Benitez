NASM=nasm
NASMFLAGS=-f elf64 -g -F dwarf

GCC=gcc
GCCFLAGS=-no-pie -z noexecstack -g

all: juego.out


juego.out: main.o
	$(GCC) main.o -o juego.out $(GCCFLAGS)



main.o: main.asm
	$(NASM) $(NASMFLAGS) -o main.o main.asm


clean:
	rm -f *.o *.lst *.dat juego.out

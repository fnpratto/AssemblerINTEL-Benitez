# GuiaAssemblerINTEL-Benitez (0/21)

nasm -f elf64 ej6.asm -o main.o 

gcc main.o -o juego.out -no-pie -z noexecstack

./juego.out

# Modelos de parciales
# Tps de anteriores cuatris
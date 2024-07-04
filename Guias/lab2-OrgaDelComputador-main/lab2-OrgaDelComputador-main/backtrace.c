#include <stdint.h>
#include <stdio.h>
#include <unistd.h>

void print_newline(){

    printf("\n");
}

void backtrace() {
    void **ebp = __builtin_frame_address(0);
    uint32_t *values;

    for (int i=1; ebp[0] != NULL; i++) {
        values = *ebp + 8;
        printf("#%d [%p] %p ( %#x %#x %#x )\n", i, ebp[0], ebp[1], values[0], values[1], values[2]);
        ebp = ebp[0];
    }
    print_newline(); //Para poder hacer until con gdb
}

void my_write(int fd, const void *msg, size_t count) {
    backtrace();
    fprintf(stderr, "=> write(%d, %p, %zu)\n", fd, msg, count);
    write(fd, msg, count);
}

void recurse(int level) {
    if (level > 0)
        recurse(level - 1);
    else
        my_write(2, "Hello, world!\n", 15);
}

void start_call_tree() {
    recurse(5);
}

int main(void) {
    start_call_tree();
}
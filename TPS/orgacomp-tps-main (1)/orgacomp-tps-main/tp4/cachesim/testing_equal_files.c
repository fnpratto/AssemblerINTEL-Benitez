/* 
Testing cachesim
*/

#include <stdbool.h>
#include <stdio.h>

bool _filesAreEqual(FILE* file1, FILE* file2) {

    char ch1 = getc(file1);
    char ch2 = getc(file2);

    while (ch1 != EOF && ch2 != EOF) {
        if (ch1 != ch2) {
            return false;
        }

        ch1 = getc(file1);
        ch2 = getc(file2);

    }

    return ch1 == EOF && ch2 == EOF;
}

bool filesAreEqual(char* fileName1, char* fileName2) {

    FILE* file1 = fopen(fileName1, "r");
    FILE* file2 = fopen(fileName2, "r");

    if (file1 == NULL || file2 == NULL) {
        fprintf(stderr, "Error : files not open\n");
        return false;
    }

    bool result = _filesAreEqual(file1, file2);

    fclose(file1);
    fclose(file2);

    return result;
}

int main(int argc, char** argv) {

    if (argc != 3) {
        fprintf(stderr, "Error : wrong arguments\n");
        return 1;
    }

	char* fileName1 = argv[1];
	char* fileName2 = argv[2];

    char* result = filesAreEqual(fileName1, fileName2) ? "OK" : "NO";

    fprintf(stdout, "\n---- TESTING FILES -----\n");
    fprintf(stdout, "%s == %s ------> %s\n", fileName1, fileName2, result);
    fprintf(stdout, "------------------------\n");

	return 0;
}
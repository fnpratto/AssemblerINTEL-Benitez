/*Count Salutes

There is a na arrow hallway in which people can go right and left only. When two people meet in the hallway, by tradition they must salute each other. People move at the same speed left and right.
Your task is to write a function that, given string representation of people moving in the hallway,
will count the number of salutes that will occur. Note: 2 salutes occur when people meet, one to the other and vice versa.
Input:
People moving right will be represented by >; people moving left will be represented by <. An example input would be >--<--->->. The - character represents empty space, which you need not worry about.
Examples:
Input: >----->-----<--< Output: 8
Explanation: Both guys moving right will meet both guys moving left. Hence a total of 4 meetings will occur and 8 salutes will occur.
Input: <---<--->----< Output: 2
Explanation: Only one meeting occurs.*/

#include <stdio.h>
#include <string.h>
#include <stdbool.h>

const char MINOR = '<';
const char GREATER = '>';
const char NOTHING = '-';


int count_salutes (char* string){
    int salutes = 0;
    int lenght = strlen(string);
    int i = 0;
    bool match_not_found= false;    
    while(!match_not_found || i< lenght){
        if(string[i]==GREATER){
            int j = i+1;
            while(!match_not_found || j< lenght){
                if (string[j] == MINOR){
                    salutes++;
                    printf("encontrado");
                    string[j] = NOTHING;
                    match_not_found = true;
                }
                j++;
            }
        }
        i ++;
    }
}



int main() {
    char test1[] = "<---->><<<--->";
    char test2[] = "<<>>";
    char test3[] = "<<<<";
    char test4[] = ">>>>";
    char test5[] = ">><<";
    
    printf("Test 1: %s -> Salutes: %d\n", test1, count_salutes(test1));
    printf("Test 2: %s -> Salutes: %d\n", test2, count_salutes(test2));
    printf("Test 3: %s -> Salutes: %d\n", test3, count_salutes(test3));
    printf("Test 4: %s -> Salutes: %d\n", test4, count_salutes(test4));
    printf("Test 5: %s -> Salutes: %d\n", test5, count_salutes(test5));

    return 0;
}
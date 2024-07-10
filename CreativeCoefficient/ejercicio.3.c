/*Ejercicio 3
Goal: Rearrange the boxes in the factory to form stacks of equal height.

Rules
You work in an automated factory. 
The factory uses a simple robotic arm to move boxes around.
The arm is capable of picking a box from a stack, and placing it on another stack. 
All boxes are on one of a given number of stacks. 
Your objective is to rearrange the stacks in order to have an equal number of boxes on each stack. 
If this is not possible, any excess box must be stacked from left to right.
Your code will periodically receive the current state of the arm and the number of boxes on each stack. 
In order to succeed, your function must return one command per turn up until the boxes are correctly positioned.
The available commands are: 
RIGHT : the arm moves one stack to the right. 
LEFT : the arm moves one stack to the left. 
PICK : the arm grabs a box from the stack directly below it. 
PLACE : the arm places a box onto the stack directly below it. 
Warning, you may execute a maximum of 80 commands, but it is not necessary to minimize the amount of instructions.
Implementation
Implement the function solve(clawPos, boxes, boxInClaw) that takes as arguments: 
an integer clawPos for the index of the stack the arm is currently above.
boxes an array of integers for the size of each stack. 
The integer boxInClaw which will be equal to 1 if the arm is carrying a box, 0 otherwise.
Victory Conditions
All stacks have been smoothed from left to right. It should look like this for the example above.

Lose Conditions
Your function returns an incorrect command. The stacks still aren't smooth after 80 turns.
Constraints
2 ≤ number of stacks ≤ 8
1 ≤ number of boxes ≤ 16*/


#include <stdio.h>
#include <string.h>
#include <stdbool.h>

const char* RIGHT = "RIGHT";
const char* LEFT = "LEFT";
const char* PICK = "PICK";
const char* PLACE = "PLACE";
#define  INCORRECT "INCORRECT"
#define  WIN "GANASTE"

int getMaxIndex(int* boxes) {
    int maxIndex = 0;
    for (int i = 1; i < 3; i++) {
        if (boxes[i] > boxes[maxIndex])
            maxIndex = i;
    }
    return maxIndex;
}

int getMinIndex(int* boxes) {
    int minIndex = 0;
    for (int i = 1; i < 3; i++) {
        if (boxes[i] < boxes[minIndex]) 
            minIndex = i;
    }
    return minIndex;
}

int moveToBoxOrStack(int clawPos, int index){
    int contador_turnos=0;
    while(clawPos != index){
        if (clawPos < index) {
            printf("%s\n", RIGHT);
            clawPos++;
        } else if (clawPos > index) {
            printf("%s\n", LEFT);
            clawPos--;
        }
    }
    return contador_turnos; 
}

int moveExcessBoxes(int excessBoxes, int clawPos, int* boxes, int boxInClaw){
    int maxIndex = getMaxIndex(boxes);
    int minIndex = getMinIndex(boxes);
    int turnosExtra = 0;

    for(int i= 2; i<0 ; i--){
       if (boxes[i-1] <boxes[i] ){
            turnosExtra+= moveToBoxOrStack(clawPos, i);
            printf("%s\n", PICK);
            boxes[maxIndex]--;
            boxInClaw = 1;
            turnosExtra++;
            turnosExtra+= moveToBoxOrStack(clawPos, 1);
        } 
    }
    return turnosExtra;
}


char* solve(int clawPos, int* boxes, int boxInClaw){
    int totalBoxes = 0;
    for (int i = 0; i < 3; i++) {
        totalBoxes += boxes[i];
    }
    int targetBoxes = totalBoxes / 3;
    int excessBoxes = totalBoxes % 3;
    int turnos= 0;
    while(turnos <80){
        int maxIndex = getMaxIndex(boxes);
        int minIndex = getMinIndex(boxes);

        if (boxes[maxIndex] <= targetBoxes + 1 && boxes[minIndex] >= targetBoxes) {
            printf( "Ganaste");
            turnos += moveExcessBoxes(excessBoxes,clawPos, boxes, boxInClaw);
            return WIN;
        }

        if (boxInClaw == 0) {
            if (boxes[maxIndex] >= targetBoxes ) {
                turnos += moveToBoxOrStack(clawPos, maxIndex);
                printf("%s\n", PICK);
                boxes[maxIndex]--;
                boxInClaw = 1;
            }
        } else {
            if (boxes[minIndex] < targetBoxes) {
                turnos += moveToBoxOrStack(clawPos, minIndex);
                printf("%s\n", PLACE);
                boxes[minIndex]++;
                boxInClaw = 0;
            } else if (boxes[maxIndex] >= targetBoxes ) {
                turnos += moveToBoxOrStack(clawPos, maxIndex);
                printf("%s\n", PLACE);
                boxes[maxIndex]++;
                boxInClaw = 0;
            }
        }
        turnos++;

    }

    printf("Perdiste");
    return INCORRECT;


}
#include <stdio.h>
#include <math.h>
#include "functions.h"

//Sample Function
int add(int a, int b)
{
    return a+b;
}

//Entry point
int main(int argc, char *argv[])
{
    FILE *filePointer;
    filePointer = fopen("data.csv","w");
    
    fprintf(filePointer, "%d", add(1,2));

    printf("Number: %d \n", subtract(1,2));

    fclose(filePointer);
}

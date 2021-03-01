#include<stdio.h>
#include<string.h>

void vulnFunc(char *input);

int main(int argc, char *argv[])
{
 if(argc>1)
    vulnFuncunc(argv[1]);
}

void vulnFunc(char *input)
{
 char buffer[256];
 strcpy(buffer, input);
}
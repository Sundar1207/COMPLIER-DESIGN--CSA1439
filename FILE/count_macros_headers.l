%{
#include <stdio.h>

int macro_count = 0;
int header_count = 0;

%}

%%

#define[ \t]+[A-Za-z_][A-Za-z0-9_]*   { macro_count++; }
#include[ \t]+[<"][A-Za-z0-9._]+[>"]    { header_count++; }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Processing C program to count macros and header files:\n");
    yylex();
    printf("Number of macros: %d\n", macro_count);
    printf("Number of header files: %d\n", header_count);
    return 0;
}

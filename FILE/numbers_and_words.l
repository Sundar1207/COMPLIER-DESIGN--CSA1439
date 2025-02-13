%{
#include <stdio.h>

int word_count = 0;
int number_count = 0;
%}

%%

[0-9]+              { number_count++; printf("Number: %s\n", yytext); }
[a-zA-Z]+           { word_count++; printf("Word: %s\n", yytext); }
[^a-zA-Z0-9]+       { /* Ignore non-alphanumeric characters */ }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter a statement:\n");
    yylex();
    printf("\nTotal Words: %d\n", word_count);
    printf("Total Numbers: %d\n", number_count);
    return 0;
}

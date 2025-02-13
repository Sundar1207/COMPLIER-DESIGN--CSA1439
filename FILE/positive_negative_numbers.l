%{
#include <stdio.h>
#include <stdlib.h>

int positive_count = 0;
int negative_count = 0;
%}

%%

[+]?[0-9]+(\.[0-9]+)?    { 
                                if (yytext[0] == '-') {
                                    negative_count++;
                                    printf("Negative number: %s\n", yytext);
                                } else {
                                    positive_count++;
                                    printf("Positive number: %s\n", yytext);
                                }
                            }

[^0-9]+                   { /* Ignore other characters */ }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter numbers (positive/negative):\n");
    yylex();
    printf("\nTotal Positive Numbers: %d\n", positive_count);
    printf("Total Negative Numbers: %d\n", negative_count);
    return 0;
}

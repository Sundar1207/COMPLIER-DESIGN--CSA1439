%{
#include <stdio.h>
%}

%%

[a-zA-Z]+           { printf("Word: %s\n", yytext); }
[<>!=]=?             { printf("Relational Operator: %s\n", yytext); }
.                    { /* Ignore other characters */ }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter a statement:\n");
    yylex();
    return 0;
}

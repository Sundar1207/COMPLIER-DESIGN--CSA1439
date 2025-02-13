%{
#include <stdio.h>
%}

%%

[ \t\n]+           { /* Ignore spaces, tabs, and new lines */ }
int|char|float|double { printf("Keyword: %s\n", yytext); }
[A-Za-z_][A-Za-z0-9_]* { printf("Identifier: %s\n", yytext); }
[0-9]+             { printf("Integer constant: %s\n", yytext); }
\"[^\"]*\"         { printf("String literal: %s\n", yytext); }
[+\-*/=<>]         { printf("Operator: %s\n", yytext); }
";"                { printf("Semicolon\n"); }
","                { printf("Comma\n"); }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Separating tokens in the C program:\n");
    yylex();
    return 0;
}

%{
#include <stdio.h>
%}

%%

[0-9]+\.[0-9]+           { printf("Float constant: %s\n", yytext); }
[0-9]+                   { printf("Integer constant: %s\n", yytext); }
\"[^\"]*\"               { printf("String constant: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Processing constants in the C program:\n");
    yylex();
    return 0;
}

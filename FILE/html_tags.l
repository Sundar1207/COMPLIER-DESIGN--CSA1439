%{
#include <stdio.h>
%}

%%

<[^>]+>    { printf("HTML Tag: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Processing HTML file to extract tags:\n");
    yylex();
    return 0;
}

%{
#include <stdio.h>

int line_number = 1;
%}

%%

\n      { printf("%d: ", line_number++); }
.       { printf("%s", yytext); }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Adding line numbers to the C program:\n");
    yylex();
    return 0;
}

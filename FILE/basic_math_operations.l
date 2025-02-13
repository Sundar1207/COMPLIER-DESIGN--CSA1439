%{
#include <stdio.h>
#include <stdlib.h>

int result = 0;
%}

%%

[0-9]+      { result = atoi(yytext); printf("Result: %d\n", result); }
[+\-*/]     { printf("Operator: %s\n", yytext); }
\n          { /* End of line */ }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter mathematical expressions:\n");
    yylex();
    printf("Final result: %d\n", result);
    return 0;
}

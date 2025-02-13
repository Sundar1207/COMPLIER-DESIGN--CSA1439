%{
#include <stdio.h>
%}

digit   [0-9]

%%

{digit}+   { printf("The input is a digit.\n"); }
.          { printf("The input is not a digit.\n"); }

%%

int yywrap(void) {
    return 1;  // return 1 to indicate the end of the input
}

int main() {
    yylex();
    return 0;
}

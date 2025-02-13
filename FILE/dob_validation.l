%{
#include <stdio.h>
%}

%%

([0-9]{2})/([0-9]{2})/([0-9]{4})   { printf("Valid DOB: %s\n", yytext); }
.                                    { printf("Invalid DOB\n"); }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter a DOB (DD/MM/YYYY):\n");
    yylex();
    return 0;
}

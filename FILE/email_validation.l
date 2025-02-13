%{
#include <stdio.h>
%}

%%

[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}    { printf("Valid email: %s\n", yytext); }
.                                               { printf("Invalid email\n"); }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter an email address:\n");
    yylex();
    return 0;
}

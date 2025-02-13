%{
#include <stdio.h>
%}

%%

(http|https)://[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+(/[a-zA-Z0-9-]*)*    { printf("Valid URL: %s\n", yytext); }
.                                                               { printf("Invalid URL\n"); }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter a URL:\n");
    yylex();
    return 0;
}

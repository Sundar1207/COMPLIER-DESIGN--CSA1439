%{
#include <stdio.h>
%}

%%

[aeiouAEIOU][a-zA-Z]*  { printf("Valid string: %s\n", yytext); }
[^aeiouAEIOU][a-zA-Z]*  { printf("Invalid string (not starting with vowel): %s\n", yytext); }
[^a-zA-Z]+              { /* Ignore non-alphabetical characters */ }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter a string:\n");
    yylex();
    return 0;
}

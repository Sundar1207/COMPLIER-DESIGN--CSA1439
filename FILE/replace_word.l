%{
#include <stdio.h>
#include <string.h>

char word_to_replace[] = "oldword";
char replacement_word[] = "newword";
%}

%%

oldword      { printf("%s", replacement_word); }
.            { printf("%s", yytext); }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter text with the word 'oldword':\n");
    yylex();
    return 0;
}

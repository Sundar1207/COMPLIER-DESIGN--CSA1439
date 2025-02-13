%{
#include <stdio.h>
#include <string.h>

int char_count = 0;
int line_count = 0;
int word_count = 0;

%}

%%

[ \t\n]+                { char_count += yyleng; }  
[A-Za-z0-9_]+           { word_count++; char_count += yyleng; }
\n                      { line_count++; char_count++; }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Processing the C Program:\n");
    yylex();
    printf("\nNumber of lines: %d\n", line_count);
    printf("Number of words: %d\n", word_count);
    printf("Number of characters: %d\n", char_count);
    return 0;
}

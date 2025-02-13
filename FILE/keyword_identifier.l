%{
#include <stdio.h>
#include <string.h>

int keyword_count = 0;
int identifier_count = 0;

char* keywords[] = {
    "auto", "break", "case", "char", "const", "continue", "default", "do", "double",
    "else", "enum", "extern", "float", "for", "goto", "if", "inline", "int", "long",
    "register", "restrict", "return", "short", "signed", "sizeof", "static", "struct",
    "switch", "typedef", "union", "unsigned", "void", "volatile", "while"
};

int is_keyword(char* str) {
    for (int i = 0; i < 32; i++) {
        if (strcmp(str, keywords[i]) == 0) {
            return 1;
        }
    }
    return 0;
}
%}

%%

[a-zA-Z_][a-zA-Z0-9_]*  {
    if (is_keyword(yytext)) {
        keyword_count++;
        printf("Keyword: %s\n", yytext);
    } else {
        identifier_count++;
        printf("Identifier: %s\n", yytext);
    }
}

[^a-zA-Z_0-9]+  { /* Ignore non-alphanumeric characters */ }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter a program code:\n");
    yylex();
    printf("\nTotal Keywords: %d\n", keyword_count);
    printf("Total Identifiers: %d\n", identifier_count);
    return 0;
}

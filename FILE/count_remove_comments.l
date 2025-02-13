%{
#include <stdio.h>

int comment_count = 0;
%}

%%

//.*\n             { comment_count++; }
\/\*.*\*\/        { comment_count++; }
[ \t\n]+          { }
.                 { printf("%s", yytext); }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Removing comments and counting comment lines:\n");
    yylex();
    printf("\nNumber of comment lines: %d\n", comment_count);
    return 0;
}

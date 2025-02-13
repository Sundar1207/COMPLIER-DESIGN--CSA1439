%{
#include <stdio.h>
#include <string.h>

int max_len = 0;
char longest_word[100];
%}

%%

[a-zA-Z]+    {
                    int len = strlen(yytext);
                    if (len > max_len) {
                        max_len = len;
                        strcpy

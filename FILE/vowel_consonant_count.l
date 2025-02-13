%{
#include <stdio.h>
#include <ctype.h>

int vowel_count = 0;
int consonant_count = 0;
%}

%%

[aeiouAEIOU]      { vowel_count++; }
[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z] { consonant_count++; }
[^a-zA-Z]          { }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter a sentence: ");
    yylex();
    printf("\nVowels: %d\n", vowel_count);
    printf("Consonants: %d\n", consonant_count);
    return 0;
}

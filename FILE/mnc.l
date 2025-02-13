%{
#include <stdio.h>
%}

VALID_MOBILE   [7-9][0-9]{9}

%%

{VALID_MOBILE}   { printf("The mobile number is valid.\n"); }
.                { printf("The mobile number is invalid.\n"); }

%%

int main() { yylex(); return 0; }

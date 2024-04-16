%{
#include "y.tab.h"
%}

%option noyywrap

DIGIT [0-9]

%%

{DIGIT}+ {
    yylval = atoi(yytext);
    return NUMBER;
}

[-+*/()] {
    return yytext[0];
}

[ \t\n] {
    // Ignore whitespace
}

. {
    fprintf(stderr, "Invalid character: %s\n", yytext);
}

%%


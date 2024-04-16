%{
#include <stdio.h>

int keywordCount = 0;
int identifierCount = 0;
int operatorCount = 0;
int symbolCount = 0;
int numberCount = 0;
int stringCount = 0;
%}

%%

int|float|char|double|void|if|else|while|for|return|break|continue|switch|case|default|sizeof|typedef|struct|union|enum|const   { printf("Keyword: %s\n", yytext); keywordCount++; }

[a-zA-Z_][a-zA-Z0-9_]*   { printf("Identifier: %s\n", yytext); identifierCount++; }

[+\-*/=<>!%&|^~]         { printf("Operator: %s\n", yytext); operatorCount++; }

[;:.,(){}[\]#$]          { printf("Symbol: %s\n", yytext); symbolCount++; }

[0-9]+(\.[0-9]+)?        { printf("Number: %s\n", yytext); numberCount++; }

\"(\\.|[^\"])*\"         { printf("String: %s\n", yytext); stringCount++; }

[ \t\n]                  ; // Skip whitespace and newline

.                        { printf("Unknown Token: %s\n", yytext); }

%%

int main() {
    FILE *file = fopen("myfile1.txt", "r");
    if (!file) {
        fprintf(stderr, "Error opening file\n");
        return 1;
    }

    yyin = file;
    yylex();

    fclose(file);

    printf("\nTotal Counts:\n");
    printf("Keywords: %d\n", keywordCount);
    printf("Identifiers: %d\n", identifierCount);
    printf("Operators: %d\n", operatorCount);
    printf("Symbols: %d\n", symbolCount);
    printf("Numbers: %d\n", numberCount);
    printf("Strings: %d\n", stringCount);

    return 0;
}

int yywrap() {
    return 1;
}

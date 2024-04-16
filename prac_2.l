%{
#include <stdio.h>

int questionCount = 0;
int wordCount = 0;
int lineCount = 0;
int lowercaseCount = 0;
int uppercaseCount = 0;
int digitCount = 0;
int specialCharCount = 0;
char dateOfExamination[20];
char semester[20];
%}

%%

([0-2][0-9]|3[0-1])\/(0[1-9]|1[0-2])\/[0-9]{4}  { sscanf(yytext, "%s", dateOfExamination); }
I|II|III|IV|V|VI|VII                            { strcpy(semester, yytext); }
"Question"                                      { questionCount++; }
[\t ' ']                                        { wordCount++; }
[0-9]                                           { digitCount++; }
[a-z]                                           { lowercaseCount++; }
[A-Z]                                           { uppercaseCount++; }
\n                                              { lineCount++; wordCount++; }
.                                               { specialCharCount++; }
%%

int main() {
    FILE *file = fopen("question_paper.txt", "r");
    if (!file) {
        fprintf(stderr, "Error opening file\n");
        return 1;
    }

    yyin = file;
    yylex();

    fclose(file);

    printf("\nStatistics:\n");
    printf("Date of Examination: %s\n", dateOfExamination);
    printf("Semester: %s\n", semester);
    printf("Number of Questions: %d\n", questionCount);
    printf("Number of Words: %d\n", wordCount);
    printf("Number of Lines: %d\n", lineCount);
    printf("Number of Lowercase Letters: %d\n", lowercaseCount);
    printf("Number of Uppercase Letters: %d\n", uppercaseCount);
    printf("Number of Digits: %d\n", digitCount);
    printf("Number of Special Characters: %d\n", specialCharCount);

    return 0;
}

int yywrap() {
    return 1;
}

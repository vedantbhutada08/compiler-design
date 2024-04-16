%{
#include <stdio.h>
%}



%{
int studentCount = 0;
int tcsCount = 0, infosysCount = 0, wiproCount = 0, accentureCount = 0, informaticaCount = 0;
int femaleCount = 0, maleCount = 0;
int cseCount = 0, itCount = 0, ecCount = 0;
%}

%%
[^\n]*\n {
    char name[50], company[20], gender[10], department[5], email[50];
    float cgpa, package;
    long long int mobile;
    sscanf(yytext, "%[^,], %[^,], %[^,], %f, %[^,], %f, %[^,], %lld", name, company, gender, &cgpa, department, &package, email, &mobile);


    printf("Name: %s\n", name);
    printf("companyname: %s\n", company);
    printf("gender: %s\n", gender);


   
    if (cgpa < 10)
        printf("CGPA: %.2f\n", cgpa);
    else
        printf("Invalid CGPA: %.2f\n", cgpa);

   
    printf("Package: %.2f\n", package);


    printf("Mail ID: %s\n", email);


    printf("Mobile Number: %lld\n", mobile);

  
    if (strcmp(company, "TCS") == 0)
        tcsCount++;
    else if (strcmp(company, "Infosys") == 0)
        infosysCount++;
    else if (strcmp(company, "Wipro") == 0)
        wiproCount++;
    else if (strcmp(company, "Accenture") == 0)
        accentureCount++;
    else if (strcmp(company, "Informatica") == 0)
        informaticaCount++;

    // Count female and male students
    if (strcmp(gender, "Female") == 0)
        femaleCount++;
    else if (strcmp(gender, "Male") == 0)
        maleCount++;

    // Count students in each department
    if (strcmp(department, "CSE") == 0)
        cseCount++;
    else if (strcmp(department, "IT") == 0)
        itCount++;
    else if (strcmp(department, "EC") == 0)
        ecCount++;

    studentCount++;
}


%%

int main() {
    yyin = fopen("E3.txt", "r");

    if (!yyin) {
        perror("Error opening file");
        return 1;
    }

    yylex();

    printf("\nStatistics:\n");
    printf("Total Students: %d\n", studentCount);
    printf("Students placed in TCS: %d\n", tcsCount);
    printf("Students placed in Infosys: %d\n", infosysCount);
    printf("Students placed in Wipro: %d\n", wiproCount);
    printf("Students placed in Accenture: %d\n", accentureCount);
    printf("Students placed in Informatica: %d\n", informaticaCount);
    printf("Female Students: %d\n", femaleCount);
    printf("Male Students: %d\n", maleCount);
    printf("CSE Students placed: %d\n", cseCount);
    printf("IT Students placed: %d\n", itCount);
    printf("EC Students placed: %d\n", ecCount);

    fclose(yyin);
    return 0;
}

int yywrap() {
    return 1;
}

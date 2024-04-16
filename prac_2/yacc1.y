%{
#include<stdio.h>
#include<stdlib.h>
int answer=0;
%}
%token NUMBER ID NL 
%left '+' '-'
%left '*' '/'



%%
stmt : exp NL { printf("\nValid expression & Answer: %d \n",$1); 
	exit(0);} 
|
exp1 NL { printf("\nValid Expression \nBut, Calculation Can Be Performed On Variables \n"); 
	exit(0);}
; 

exp : exp '+' exp  	{printf("+");$$=$1+$3;}
| exp '-' exp		{printf("-");$$=$1-$3;}
| exp '*' exp		{printf("*");$$=$1*$3;}
| exp '/' exp		{printf("/");$$=$1/$3;}
| '(' exp ')'		{$$=$2;}
| NUMBER 		{printf("%d",yylval);$$=$1;}

;

exp1 : exp1 '+' exp1  	{printf("+");}
| exp1 '-' exp1		{printf("-");}
| exp1 '*' exp1		{printf("*");}
| exp1 '/' exp1		{printf("/");}
| '(' exp1 ')'		
| ID 				{printf("%s",yylval);}
;

%%
int yyerror(char *msg)
{
	printf("Invalid Expression \n");
	exit(0);
}
main()
{
	printf("Enter the expression : \n");
	yyparse();
}
int yywrap(){return 1;}
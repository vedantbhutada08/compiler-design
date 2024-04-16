%{
#include<stdio.h>
#include<stdlib.h>
%}
%token DO WHILE EXP NUMBER NL STATEMENTS

%%
stmt : sexp { printf("\nValid expression\n",$1); 
	exit(0);}  

sexp : DO '\n' STATEMENTS cond
| DO STATEMENTS cond
;

cond : WHILE'(cond2)'';'
| WHILE'('cond2 '&''&' cond2')'';'
| WHILE'('cond2 '|''|' cond2')'';'
;
cond2 : stmt '>' stmt|
stmt '<' stmt|
stmt '>''=' stmt|
stmt '<''=' stmt|
stmt '!''=' stmt|
stmt '=''=' stmt
;
stmt : exp
| exp1
; 

exp : exp '+' exp  	
| exp '-' exp		
| exp '*' exp		
| exp '/' exp		
| '(' exp ')'		
| NUMBER 		

;

exp1 : exp1 '+' exp1  	
| exp1 '-' exp1		
| exp1 '*' exp1		
| exp1 '/' exp1		
| '(' exp1 ')'		
| EXP				
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
%{
#include<stdio.h>
#include<stdlib.h>
%}
%token IDA IDB IDC IDD NL

%%
stmt : s1 s2 NL { printf("\nValid expression\n",$1); 
	exit(0);}  

s1 : IDA IDB s1
| /* epsilon */
;
s2 : IDC IDD s2
| /* epsilon */
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
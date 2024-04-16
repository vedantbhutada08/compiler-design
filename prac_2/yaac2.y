%{
#include<stdio.h>
#include<stdlib.h>
%}
%token IDA IDB IDC NL

%%
stmt : exp IDC NL { printf("\nValid expression\n",$1); 
	exit(0);}  

exp : IDA exp IDB 
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
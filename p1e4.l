%{
#include<stdio.h>
%}

%%

\/\/(.*) { };					

\/\*(.*\n)*.*\*\/  { };			
%%



int main()
{
yyin=fopen("input.txt","r");
yyout=fopen("output.txt","w");
yylex();
return 0;
}
int yywrap()
{
return 1;
}
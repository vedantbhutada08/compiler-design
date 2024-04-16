%{
#include "y.tab.h"
%}
%%
"{".*"}" {return STATEMENTS;}
do|DO {return DO;}
while|While|WHILE {return WHILE;}
[a-zA-Z] {return EXP;}
[0-9]+ {return NUMBER;}
\n {return NL;}
. {return yytext[0];}
%%

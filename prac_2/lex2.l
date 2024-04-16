%{
#include "y.tab.h"
%}
%%
a {return IDA;}
b {return IDB;}
c {return IDC;}
\n {return NL;}
. {return yytext[0];}
%%
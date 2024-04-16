%{
#include "y.tab.h"
%}
%%
a {return IDA;}
b {return IDB;}
c {return IDC;}
d {return IDD;}
\n {return NL;}
. {return yytext[0];}
%%
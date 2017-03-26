%{
#include <stdio.h>
#include "y.tab.h"

int 
yywrap(void)
{
	return 1;
}
%}
%%
"たす"		return ADD;
"ひく"		return SUB;
"かける"	return MUL;
"わる"		return DIV;
"\n"		return CR;
[1-9][0-9]* {
	double temp;
	sscanf(yytext, "%lf", &temp);
	yylval.double_value = temp;
	return DOUBLE_LITERAL;
}
[0-9]*\.[0-9]* {
	double temp;
	sscanf(yytext, "%lf", &temp);
	yylval.double_value = temp;
	return DOUBLE_LITERAL;
}
%% 

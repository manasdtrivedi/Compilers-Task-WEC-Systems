%{
	#include<stdlib.h>
	void yyerror(char *);
	#include "y.tab.h"
%}

%%

\n				return NL;
[ \t]			;
"if"			return IF;
"then"			return THEN;
"else"			return ELSE;
"expr"			return EXPR;
"stmt-list"		return STMTLIST;
.				yyerror("Invalid character(s) encountered.");
%%

int yywrap(void){
	return 1;
}
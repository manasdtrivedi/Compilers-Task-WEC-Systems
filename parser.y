%token IF THEN ELSE STMTLIST EXPR NL
%{
	#include<stdio.h>
	#include<stdlib.h>
	void yyerror(char *);
	int yylex(void);
%}

%%

start:
	stmt NL		{
					printf("Input accepted!\n");
					exit(0);
				}
	|
	;
stmt:
	matched
	| unmatched
	;
matched:
	IF EXPR THEN matched ELSE matched
	| STMTLIST
	|
	;
unmatched:
	IF EXPR THEN stmt
	| IF EXPR THEN matched ELSE unmatched
	;

%%

void yyerror(char *s){
	fprintf(stderr, "%s\n", s);
}

int main(){
	yyparse();
	return 0;
}
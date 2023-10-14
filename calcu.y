%{
#include <stdio.h>
int yylex(void);
void yyerror(char *);


%}

%token INTEGER

%%
stmt: stmt expr '\n'
	|
	;
expr: INTEGER
	| expr '+' expr
	| expr '-' expr
	;

%%

void yyerror(char *s){
	fprintf(stderr, "%s\n", s);
}

int main(void){
	yyparse();
	return 0;
}

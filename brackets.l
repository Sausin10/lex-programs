%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[\(\)\{\}\[\]]   {if ("(" or "{" or "["){
			if (
			
			printf("Matched: %c\n", yytext[0]);}

\n         {}

.          {printf("Invalid character: %c\n", yytext[0]);
            exit(1);}


%%
int yywrap(){
return 1;}


int main() {
    yylex(); 
    return 0;
}

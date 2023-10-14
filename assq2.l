%{
#include <stdio.h>
%}


int line_number = 1; 

%%
\n      { line_number++; printf("%d: %s", line_number, yytext); }
.       { printf("%d: %s", line_number, yytext); }
%%
int yywrap(){} 
int main() {
    yyin = fopen("assignmentip","r");
    yylex();

    fclose(input);
    return 0;
}






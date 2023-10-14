/*begin with "T" strings to be replaced with * .Replace all the words that end with "e" with a # . ^ $ */ 
%{
#include <stdio.h>
%}

%{
int count=0;
%}


%%

if (strcmp(yytext, "word") == 0) {
                printf("*");
              } else {
                printf("%s", yytext);
              }
            }
.           printf("%s", yytext);


%%

int yywrap(){};
int main(){

yyin = fopen("astringfile.txt","r");
 
yylex();
}




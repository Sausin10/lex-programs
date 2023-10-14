%{
#include<stdio.h>
#include <string.h>
int word=0,character=0,space=0,lines=1;
%}


%%
[A-Za-z|0-9]+       {word++;
		     character=character+strlen(yytext);}
\n                  {lines++;
		     character++;
		     space++;}
[\t]                {space++;}
[" "]		    {space++;}
.                   {character++;}


%%


int yywrap() {
    return 1; 
}

int main(){

yyin=fopen("file1.txt","r");
yylex();
printf("word : %d\n",word);
printf("characters : %d\n",character);
printf("lines : %d\n",lines);
printf("spaces : %d\n",space);
}
%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int word=0,character=0,space=0,lines=1;
int linenum = 1; 

%}

%option noyywrap

%{
int isKeyword(char* str) {
    char* keywords[] = {"if", "else", "while", "int", "float", "return", "break", "continue", "void"};
    int numKeywords = sizeof(keywords) / sizeof(keywords[0]);
    for (int i = 0; i < numKeywords; i++) {
        if (strcmp(str, keywords[i]) == 0) {
            return 1;
        }
    }
    return 0;
}
%}
line .*\n
%%


[0-9]+                          		{ printf("Num: %s\n", yytext); }
\.?						{ printf("error: %s\n", yytext); }

[0-9]+\.[0-9]*                        		{ printf("num: %s\n", yytext); }
[0-9]+(\.[0-9]*)?([Ee][-+]?[0-9]+)?  		{ printf("num: %s\n", yytext); }

"!"                            			{ printf("NOT %s\n", yytext); }
[\)]					 	{ printf("(: %s\n", yytext); }
[\(]				 		{ printf("): %s\n", yytext); }
[\{]			    			{ printf("{: %s\n", yytext); }
\}				 		{ printf("}: %s\n", yytext); }
\[			   			{ printf("[: %s\n", yytext); }
\]				 		{ printf("]: %s\n", yytext); }
;                         			{ printf("; : %s\n", yytext); }

[-+]                          			{ printf("Addop: %s\n", yytext); }
[*\/]                         			{ printf("Mulop: %s\n", yytext); }
[><=>=<===]?                  			{ printf("Relop: %s\n", yytext); }
[\n]            	      			{lines++; character++;space++;}

&&                            			{ printf("AND %s\n", yytext); }
\|\|						{ printf("OR %s\n", yytext); }

[A-Za-z][A-Za-z0-9_]*         			{ if (isKeyword(yytext)) {
        						printf("Keyword: %s\n", yytext);
    						} else {
        						printf("Identifier: %s\n", yytext);
    							}
    							{word++;
		     character=character+strlen(yytext);}
						
						}

[\t]                {space++;}
[" "]		    {space++;}
{line} 			{ printf("%d %s", linenum++, yytext); } 
.                             			{ printf("Invalid token: %s\n", yytext); 
    						{character++;}
						}

%%


int main() {
    yyin = fopen("assignmentip.txt", "r");
    yylex();
printf("word : %d\n",word);
printf("characters : %d\n",character);
printf("lines : %d\n",lines);
printf("spaces : %d\n",space);
    fclose(yyin);
    return 0;
}

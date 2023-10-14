%{
#include <stdio.h>
#include <string.h>
%}

%option noyywrap

%{

int isKeyword(char* str) {
    char* keywords[] = {"if", "else", "while", "int", "float", "return","break","continue","void"};
    int numKeywords = sizeof(keywords) / sizeof(keywords[0]);
    for (int i = 0; i < numKeywords; i++) {
        if (strcmp(str, keywords[i]) == 0) {
            return 1;
        }
    }
    return 0;
}
%}

%%

"!"                            {printf("NOT %s\n", yytext);}
[\)]				 {printf("(: %s\n", yytext);}
[\(]				 {printf("): %s\n", yytext);}
[\{]			 {printf("{: %s\n", yytext);}
\}				 {printf("}: %s\n", yytext);}
\[			 {printf("[: %s\n", yytext);}
\]				 {printf("]: %s\n", yytext);}
;                         {printf  ("; %s\n",yytext);}
			    
[-+]                          { printf("Addop: %s\n", yytext); }
[*\/]                         { printf("Mulop: %s\n", yytext); }
[><=>=<===]?                  { printf("Relop: %s\n", yytext); }
[ \t\n]            	      {}

&&                            {printf("AND %s\n", yytext);}
\|\|				{printf("OR %s\n", yytext);}


[0-9][0-9]*             { printf("Integer: %s\n", yytext); }

[0-9]+\.[0-9]*([Ee][-+]?[0-9]+)? {
    printf("Num: %s\n", yytext);
}

\.[0-9]+([Ee][-+]?[0-9]+)? {
    printf("Num: %s\n", yytext);
}

[Ee][-+]?[0-9]+ {
    printf("Num: %s\n", yytext);
}


[A-Za-z][A-Za-z0-9_]*         {if (isKeyword(yytext)) {
				printf("Keyword: %s\n", yytext);} 
			      else {
        			printf("Identifier: %s\n", yytext);}  }
.                             { printf("Invalid token: %s\n", yytext); }
%%


int main() {
    yyin = fopen("assignmentip.txt","r");
    yylex();

    fclose(yyin);
    return 0;
}

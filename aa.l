%{
#include <stdio.h>
#include <string.h>

char longest[1000];
int maxi = 0;
int current = 0;
%}

%%
[a-zA-Z]+ {
    current = strlen(yytext);
    if (current > maxi) {
        maxi= current;
        strcpy(longest, yytext);
    }
}
. ; 

%%
int yywrap(){return 1;}

int main(int argc,char* argv[]){
	yyin = fopen("file1.txt", "r");
	yyin = fopen("file2.txt", "r");
	yylex();
	
	printf("Longest string: %s\n", longest);
    printf("Length: %d\n", maxi);

    return 0;

}
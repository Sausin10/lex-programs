%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int countt=0;
int i,j; int occurrence = 0;
%}

%%
[a-zA-Z]+      {
		int len = strlen(yytext);
    		for (i = 0; i < len - 1; i++) {
			for (j=i+1,j<len;j++){
        			if (yytext[i] == yytext[j]) {
            				occurrence = 1;
           				/*break;*/
        		}
    		}

    		if (occurrence) {
		countt++;
        	printf("%s\n", yytext); 
    		}
	}
}

.               {  }

%%

int yywrap() {
    return 1; 
}

int main() {
    yyin=fopen("fileoccurrence.txt","r");
    yylex(); 
    printf("Words with two or more same letters: %d\n", countt);
    return 0;
}

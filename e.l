%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[a-zA-Z]+[eE]   { printf("#");
                  printf("%s", yytext); // Print the matched word
}

.   {printf("%s", yytext); // Print it as is
}

%%

int main() {
    yyin = fopen("file1.txt","r"); 

    yylex(); 

    fclose(yyin);

    return 0;
}

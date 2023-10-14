%{
#include <stdio.h>
int shift = 0;
%}

%%
[0-9]+      { shift = atoi(yytext); }
[a-zA-Z]    { 
              int i;
              for (i = 0; i < strlen(yytext); i++) {
                  if (islower(yytext[i])) {
                      yytext[i] = (yytext[i] - 'a' + shift) % 26 + 'a';
                  } else if (isupper(yytext[i])) {
                      yytext[i] = (yytext[i] - 'A' + shift) % 26 + 'A';
                  }
              }
              printf("%s", yytext);
            }
.           { printf("%s", yytext); }
\n          { printf("\n"); }
%%

int main(int argc, char* argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <shift>\n", argv[0]);
        return 1;
    }
    shift = atoi(argv[1]);
    yylex();
    return 0;
}


/*Print the length of all words in a text file.*/


%%
[a-zA-Z]+  { printf("Length of '%s': %d\n", yytext, yyleng); }
.          { /* Ignore other characters */ }
%%

int yywrap(void){}
int main(){
yylex();

}
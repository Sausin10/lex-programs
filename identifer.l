%{
enum{INTEGER,FLOAT,IDENTIFIER,OPERATOR,COMMENT};
%}
digit [0-9]
letter[A-Za-z_]

%%
" " | "\t" ;
{digit}+   { return INTEGER; }
{digit}+\.{digit}+ { return FLOAT; }
'+' |
'-' |
'*' |
'/' { return OPERATOR; }

{letter}({letter}|{digit})* { return IDENTIFIER; }
"/*" { return COMMENT;}
%%
int main()
{
  int result;
  int running = 1;
 while(running)
 {
  result = yylex();
  switch(result)
                {
  case INTEGER: printf("integer"); break;
  case FLOAT: printf("float"); break;
  case OPERATOR: printf("operator"); break;
  case IDENTIFIER:printf("identifier"); break;
  case COMMENT: printf("comment"); break;
  }
 }
return 0;
}
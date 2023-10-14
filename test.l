%{ 
int linenum = 1; 
%} 
line .*\n	
%% 
{line} { printf("%d %s", linenum++, yytext); } 

%% 

int yywrap(){} 

int main(int argc, char*argv[]) 
{ 


yyin = fopen("assignmentip.txt","r"); 

yylex(); 

return 0; 
} 

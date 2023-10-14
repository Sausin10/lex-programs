%{
#include<stdio.h>
int ob=0;int cb=0;int oc=0;int cc=0;int os=0; int cs=0;


%}


%%
[(]  ob++;
[)] cb++;
[{] oc++;
[}] cc++;
[\[] os++;
[\]] cs++;
[a-zA-Z0-9]+ 
"n" check();

%%
int yywrap(){return 1;}

int main()
{
yylex();
}

check(){
if(ob-cb==0) printf("Equal");
else printf("missing bracket");

if(oc-cc==0) printf("Equal");
else printf("bracket missing");

if(os-cs==0) printf("Equal");
else printf("bracket missing");

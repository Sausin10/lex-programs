/*[a-z]   {char ch=yytext[0];
	 ch+=3;
	 if (ch='z')
		ch-=('z'+1-'a');
	 printf("%c", ch);
         }

[A-Z]   {char ch=yytext[0];
	 ch+=3;
	 if (ch='Z')
		ch-=('Z'+1-'A');
	 printf("%c", ch);
         }
*/

%%
[A-Wa-w] {printf("%c",yytext[0]+3);}
[X-Zx-z] {printf("%c",yytext[0]-23);}

%%



int main()
{
printf("enter string:\n");
yylex();
return 0;
}

int yywrap(){
return 1;
}
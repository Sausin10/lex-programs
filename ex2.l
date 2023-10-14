/* Lex Program to  */
%option noyywrap
%{	
	#include<iostream>
	#include<stdio.h>

	int count = 0;
%}

%%
[sakeena]	{count++; fprintf(yyout, "%d", count);}
%%
int main()
{	
	//yyin = fopen("input.txt", "r");
	yyout = fopen("output2.txt", "w");
	yylex();
	return 0;
}

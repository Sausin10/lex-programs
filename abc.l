/* Lex Program to count the appearance of numbers */
%option noyywrap
%{	
	#include<iostream>
	#include<stdio.h>

	int count = 0;
%}

%%

[+]?[0-9]+	{count++; fprintf(yyout, "%d", count);}

%%

int main()
{	
	yyin = fopen("input.txt", "r");
	yyout = fopen("output.txt", "w");
	yylex();
	return 0;
}

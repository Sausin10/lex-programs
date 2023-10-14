
/* Lex program to Identify and Count
Positive and Negative Numbers */
%{
int positive_no = 0, negative_no = 0;
%}

/* Rules for identifying and counting
positive and negative numbers*/
%%
[-][0-9]+ {negative_no++;
			

[0-9]+ {positive_no++;
		
%%

/*** use code section ***/

int yywrap(){}
int main()											
{

yylex();
printf ("number of positive numbers = %d,"
		"number of negative numbers = %d\n",
				positive_no, negative_no);

return 0;
}

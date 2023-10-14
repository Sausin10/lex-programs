
%{
#include <stdio.h>
#include <string.h>

char longest_string[1000] = ""; // Store the longest string
int longest_length = 0;        // Store the length of the longest string
%}

%%
[a-zA-Z]+ {
	
    int current_length = yyleng;
    if (current_length > longest_length) {
        longest_length = current_length;
        strncpy(longest_string, yytext, current_length);
        longest_string[current_length] = '\0';
    }
}

\n { /* Do nothing for newline characters */ }

. { /* Ignore all other characters */ }

%%

int yywrap() {
    return 1; // to indicate that we're done processing the current file
}

int main(int argc, char** argv[]) {
	yyin=fopen("file1.txt","r");
	yylex();
	yyin=fopen("file2.txt","r");
	yylex();
   



    // Print the longest string and its length
    printf("Longest String: %s\n", longest_string);
    printf("Length: %d\n", longest_length);

    return 0;
}

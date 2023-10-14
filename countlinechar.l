%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
\n  { /* Match newline character */
    lineCount++;
    charCount++;
}

[a-zA-Z]+   { /* Match words */
    wordCount++;
    charCount += yyleng;
}

.   { /* Match any other character */
    charCount++;
}

%%

int lineCount = 0;
int wordCount = 0;
int charCount = 0;

int main(int argc, char* argv[]) {
    if (argc != 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE* inputFile = fopen(argv[1], "r");
    if (!inputFile) {
        perror("Unable to open input file");
        return 1;
    }

    yyin = inputFile; // Set Flex input to the input file

    yylex(); // Start lexical analysis

    printf("Lines: %d\n", lineCount);
    printf("Words: %d\n", wordCount);
    printf("Characters: %d\n", charCount);

    fclose(inputFile);

    return 0;
}

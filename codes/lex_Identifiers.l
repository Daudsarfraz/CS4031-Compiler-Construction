
%{
	int count;
%}


digit 	[0-9]
letter	[a-zA-Z]
text	\"(.)*\"


%%
	/* match identifier */

{letter}({letter}|{digit})*	printf("\n(%s,%d)", yytext, ++count);
.				{}
\n				{}
{text}				{}


%%

int yywrap(void){
	return 1;
}


int main(int argc, char * argv[]){
	yyin = fopen(argv[1], "r");
	yylex();
	printf("\n\nnumber of identifiers = %d\n\n", count);
	fclose(yyin);
	return 0;
}

%{
	int nchar, nword, nline;
%}


%%
	
\n		{nline++; nchar++;}
[^ \t\n]+	{nword++, nchar += yyleng;}
.		{nchar++;}

%%

int yywrap(void){
	return 1;
}


int main(int argc, char * argv[]){
	yyin = fopen(argv[1], "r");
	yylex();
	printf("\nno of characters: %d\nno of words: %d\nno of lines: %d\n\n", nchar, nword, nline);
	fclose(yyin);
	return 0;
}


%%

	/* match everything except newline */
.	ECHO;

	/* match newline */
\n	ECHO;

%%

int yywrap(void){
	return 1;
}

int main(int argc, char * argv[]){

	yylex();
	
	return 0;
}
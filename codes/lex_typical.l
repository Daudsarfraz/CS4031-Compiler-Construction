
%{
	#define VARIABLE	257
	#define INTEGER 	258
	#define TEXT 		259
%}

comment			"//".*
whitespace		[ \t\n]+
letter			[a-zA-Z]
digit 			[0-9]
variable		{letter}({letter}|{digit})*
integer			{digit}+
text			\"(.)*\"


%%

{whitespace}		{}
{comment}		{}
{variable}		{printf("variable detected");mkname(); return INTEGER;}
{integer}		{mkval(); return INTEGER;}
{text}			{mktext(); return TEXT;}

%%

int mkname(){
	printf("saved variable name in a Symbol Table\n");
}

int mkval(){
	printf("calculated numerical value and save in Value table\n");
	return 1;
}

int mktext(){
	printf("saved string in the string Literal table\n");
	
}

int yywrap(void){
	return 1;
}

int main(int argc, char * argv[]){
	yyin = fopen(argv[1], "r");
	yylex();
	fclose(yyin);
	return 0;
}
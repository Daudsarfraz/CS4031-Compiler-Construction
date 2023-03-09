%{
	/* definitions of manifest constants
	LT, LE, EQ, NE, GT, GE, IF, THEN,
	ELSE, ID, NUMBER, RELOP */
%}

delim		[ \t\n]
ws		{delim}+
letter	 	[a-zA-Z]
digit 		[0-9]
id 		{letter}({letter}|{digit})*

%%

{ws}		{/* no action and no return /*}
if		{return (IF);}
then		{return (THEN);}
else		{return (ELSE);}
{id}		{yyval = (int) installID(); return(ID);}		
{digit}+	{yyval = (int) installNum(); return(NUMBER);}
"<"		{yyval = LT; return (RELOP);}
"<="		{yyval = LE; return (RELOP);}
"="		{yyval = EQ; return (RELOP);}
"<>"		{yyval = NE; return (RELOP);}
">"		{yyval = GE; return (RELOP);}
">="

%%




%{
	#include<stdio.h>
	#include "main.tab.h"
	#include<stdlib.h>
	extern int yylval;
%}



%%

[0-9]+	{ 
			yylval = atoi(yytext);
			return NUM;
		}

[a-z]	{
			yylval = *yytext - 'a';
			return	VAR;
		}

"if"	{ 
			return IF;
		}
"else"	{ 
			return ELSE;	
		}


[<>,(){}:] 	{
					yylval = yytext[0];
					return *yytext;
				}


"#"		{ return ';'		;}
"/"		{ return '/'		;}
"-"		{ return '-'		;}
"*"		{ return '*'		;}
"+"		{ return '+'		;}
"eq"	{ return '='		;}

"main"     { return(VOIDMAIN)  	;}

"print"  	{ return PRINT 		;}

"integer"    	{ return(INT)		;}

"float"  	{ return(FLOAT)		;}

"character"   	{ return(CHAR)		;}


"case"		{ return CASE  		;}

"default"        {return DEFAULT	;}

"switch"	{ return SWITCH 	;}

[ \t\n]*	;

.	{
		
		yyerror("Unknown Character.\n");
	}
%%

main(){
	yyin = freopen("in.txt","r",stdin);
	yyout = freopen("out.txt","w",stdout);
	yyparse();
}


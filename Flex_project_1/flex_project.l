%{
	#include <stdio.h>
%}

variable [var_][a-zA-Z0-9_]+
function [func_][a-zA-Z0-9_]+
called [goto_][a-zA-Z0-9_]+
HEADER []*[<][a-zA-Z0-9]+.[h][>]
IN [+,-]?[0-9]+
FL {IN}*"."{IN}+
CH [a-zA-Z]
STR [a-zA-Z0-9]+

SLC [#][]*+[a-zA-Z0-9 ]*
MLC [#][#][]*[a-zA-Z0-9 \n]*[]*[#][#]


%%

"IMPORT" 	{ fprintf(yyout," 'IMPORT' keyword is used for the header file\n"); }
{HEADER} 	{ fprintf(yyout," (%s) is a header file\n",yytext); }
"BODY" 	{fprintf(yyout," Program Started from here\n");}
"JODI" 	{fprintf(yyout," '%s' like 'if' keyword\n",yytext);}
"NAHOLE" 	{fprintf(yyout," '%s' like 'else' keyword\n",yytext);}
"OTHOBA" 	{fprintf(yyout," '%s' like 'else if' keyword\n",yytext);}
"FLOOP" 	{fprintf(yyout," '%s' like 'for' keyword\n",yytext);}
"WLOOP" 	{fprintf(yyout," '%s' like 'while' keyword\n",yytext);}
"CHNG" 	{fprintf(yyout," '%s' like 'switch' keyword\n",yytext);}
"CASE" 	{fprintf(yyout," '%s' like 'case' keyword\n",yytext);}
"INTEGER" 	{fprintf(yyout," 'INTEGER' like 'int' type \n");}
"END" 	{fprintf(yyout," 'END' denotes ending of a line\n");}
"KOLON" 	{fprintf(yyout," 'KOLON' denotes start of a line\n");}
"TAKE"	{fprintf(yyout," 'TAKE' denotes input value\n");}
"PRINT" 	{fprintf(yyout," 'PRINT' denotes show the line\n");}
"DEFINE" 	{fprintf(yyout," 'DEFINE' denotes 'def' keyword\n");}
"HEADER" 	{fprintf(yyout," 'HEADER' denotes 'header.h'\n");}
"ASSIGN" 	{fprintf(yyout," 'ASSIGN' denotes = keyword\n");}
"SINE" 	{fprintf(yyout," 'SINE' denotes 'sin' keyword\n");}
"COSINE" 	{fprintf(yyout," 'COSINE' denotes 'cos' keyword\n");}
"TANGENT" 	{fprintf(yyout," 'TANGENT' denotes 'tan' keyword\n");}
"LON" 	{fprintf(yyout," 'LON' denotes 'ln' keyword\n");}
"LB10" 	{fprintf(yyout," 'LB10' denotes 'log10' keyword\n");}
"GT" 		{fprintf(yyout," 'GT' denotes greater than > keyword\n");}
"LT" 		{fprintf(yyout," 'LT' denotes less than < keyword\n");}
"EQL" 	{fprintf(yyout," 'EQL' denotes equal == keyword\n");}
"GEQL" 	{fprintf(yyout," 'GEQL' denotes equal >= keyword\n");}
"LEQL" 	{fprintf(yyout," 'LEQL' denotes equal <= keyword\n");}
"AND" 	{fprintf(yyout," 'AND' denotes logical && keyword\n");}
"OR" 		{fprintf(yyout," 'OR' denotes logical || keyword\n");}
"NOT" 	{fprintf(yyout," 'NOT' denotes logical ! keyword\n");}
"INCR" 	{fprintf(yyout," 'INCR' denotes ++ keyword\n");}
"DECR" 	{fprintf(yyout," 'DECR' denotes -- keyword\n");}
"PLUS" 	{fprintf(yyout," 'PLUS' denotes + keyword\n");}
"MINUS" 	{fprintf(yyout," 'MINUS' denotes - keyword\n");}
"MUL" 	{fprintf(yyout," 'MUL' denotes * keyword\n");}
"DIV" 	{fprintf(yyout," 'DIV' denotes / keyword\n");}
"MOD" 	{fprintf(yyout," 'MOD' denotes % keyword\n");}
"POW" 	{fprintf(yyout," 'POW' denotes ** keyword\n");}
"BREAK" 	{fprintf(yyout," 'BREAK' denotes 'break' keyword in c\n");}
"DEFAULT" 	{fprintf(yyout," 'DEFAULT' denotes 'default' keyword in c\n");}
"FUNCTION" 	{fprintf(yyout," 'FUNCTION' denotes function\n");}
"(" 		{fprintf(yyout," Open first bracket\n");}
")" 		{fprintf(yyout," Close first bracket\n");}
"{" 		{fprintf(yyout," Open second bracket\n");}
"}" 		{fprintf(yyout," Close Second bracket\n");}
"[" 		{fprintf(yyout," Open third bracket\n");}
"]" 		{fprintf(yyout," Close third bracket\n");}
"," 		{fprintf(yyout," Koma keyword\n");}
{SLC} 	{fprintf(yyout," (%s) is single line comment\n",yytext);}
{MLC} 	{fprintf(yyout," (%s) is multiple line comment\n",yytext);}
{variable} 	{fprintf(yyout," (%s) is a variable\n",yytext);}
{function} 	{fprintf(yyout," (%s) is a function name\n",yytext);}
{called} 	{fprintf(yyout," (%s) function is called\n",yytext);}
"ENDP" 	{fprintf(yyout," 'ENDP' denotes ending of a program\n");}

{IN} 		{fprintf(yyout," %s is an INTEGER\n",yytext);}
"FLOAT" 	{fprintf(yyout," 'FLOAT' like 'float' type \n");}
{FL} 		{fprintf(yyout," %s is an FLOAT\n",yytext);}
"CHARACTER" {fprintf(yyout," 'CHARACTER' like 'char' type \n");}
{CH} 		{fprintf(yyout," '%s' is a CHARACTER\n",yytext);}
"STRING" 	{fprintf(yyout," 'STRING' like 'string' type \n");}
{STR} 	{fprintf(yyout," '%s' is a STRING\n",yytext);}


\n 

%%

int yywrap(){return 1;}

int main()
{
yyin = fopen( "input.txt", "r" );
yyout = fopen( "output.txt", "w" );
yylex();

}
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

"IMPORT" 	{ fprintf(yyout,"IMPORT"); }
{HEADER} 	{ fprintf(yyout,"%s\n",yytext); }
"BODY" 	{fprintf(yyout,"\n Program Started from here\n");}
"JODI" 	{fprintf(yyout,"if");}
"NAHOLE" 	{fprintf(yyout,"else");}
"OTHOBA" 	{fprintf(yyout,"else if");}
"FLOOP" 	{fprintf(yyout,"for");}
"WLOOP" 	{fprintf(yyout,"while");}
"CHNG" 	{fprintf(yyout,"switch");}
"CASE" 	{fprintf(yyout,"case");}
"INTEGER" 	{fprintf(yyout,"int");}
"END" 	{fprintf(yyout,";\n");}
"KOLON" 	{fprintf(yyout,":\n");}
"PRINT" 	{fprintf(yyout,"printf");}
"DEFINE" 	{fprintf(yyout,"#define");}
"HEADER" 	{fprintf(yyout,"%s",yytext);}
"ASSIGN" 	{fprintf(yyout,"=");}
"SINE" 	{fprintf(yyout,"sin");}
"COSINE" 	{fprintf(yyout,"cos");}
"TANGENT" 	{fprintf(yyout,"tan");}
"LON" 	{fprintf(yyout,"ln");}
"LB10" 	{fprintf(yyout,"log10");}
"GT" 		{fprintf(yyout,">");}
"LT" 		{fprintf(yyout,"<");}
"EQL" 	{fprintf(yyout,"==");}
"GEQL" 	{fprintf(yyout,">=");}
"LEQL" 	{fprintf(yyout,"<=");}
"AND" 	{fprintf(yyout,"&&");}
"OR" 		{fprintf(yyout,"||");}
"NOT" 	{fprintf(yyout,"!");}
"INCR" 	{fprintf(yyout,"++");}
"DECR" 	{fprintf(yyout,"--");}
"PLUS" 	{fprintf(yyout,"+");}
"MINUS" 	{fprintf(yyout,"-");}
"MUL" 	{fprintf(yyout,"*");}
"DIV" 	{fprintf(yyout,"/");}
"MOD" 	{fprintf(yyout,"%");}
"POW" 	{fprintf(yyout,"**");}
"BREAK" 	{fprintf(yyout,"break");}
"DEFAULT" 	{fprintf(yyout,"default");}
"FUNCTION" 	{fprintf(yyout,"FUNCTION ");}
"(" 		{fprintf(yyout,"(");}
")" 		{fprintf(yyout,")");}
"{" 		{fprintf(yyout,"{\n");}
"}" 		{fprintf(yyout,"}\n");}
"[" 		{fprintf(yyout,"[");}
"]" 		{fprintf(yyout,"]");}
"," 		{fprintf(yyout,", ");}
{SLC} 	{fprintf(yyout," (%s) is a single line comment \n",yytext);}
{MLC} 	{fprintf(yyout," (%s) is a multiple line comment \n",yytext);}
{variable} 	{fprintf(yyout," %s ",yytext);}
{function} 	{fprintf(yyout," %s",yytext);}
{called} 	{fprintf(yyout," %s",yytext);}
"ENDP" 	{fprintf(yyout," 'ENDP' denotes ending of a program\n");}

{IN} 		{fprintf(yyout," %s ",yytext);}
"FLOAT" 	{fprintf(yyout," float");}
{FL} 		{fprintf(yyout," %s",yytext);}
"CHARACTER" {fprintf(yyout,"char");}
{CH} 		{fprintf(yyout," '%s'",yytext);}
"STRING" 	{fprintf(yyout," string");}
{STR} 	{fprintf(yyout," %s ",yytext);}


\n 

%%

int yywrap(){return 1;}

int main()
{
yyin = fopen( "inp.txt", "r" );
yyout = fopen( "out.txt", "w" );
yylex();

}
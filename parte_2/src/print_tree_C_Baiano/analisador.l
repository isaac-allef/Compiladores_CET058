/* Escreva uma analisador capaz de extrair os tokens de uma expressão
 /* aritimética simples, incluindo parenteses.*/

%{

/* Código Global C que será copiado para o fonte */
/* #includes, variáveis globais e constantes vão aqui... */

#include "parser.tab.h"  

%}

/* Definições */
VERDADEIRO "VERDADEIRO"
FALSO "FALSO"
VETOR "VETOR"
INT "INTEIRO"
FLOAT "BARRIL"
DOUBLE "BARRIL DOBRADO"
CHAR "MIGUEZIN"
STRING "MIGUE"
IF "SE"
ELSE "SE DER MERDA"
WHILE "ENQUANTO"
ATRIBUICAO "RECEBE"
MENOR "MENOR"
MAIOR "MAIOR"
MENOR_IGUAL "MENOR IGUAL"
MAIOR_IGUAL "MAIOR IGUAL"
IGUAL "IGUAL"
DIFERENTE "DIFERENTE"
MAIS "MAIS"
MENOS "MENOS"
VEZES "VEZES"
DIVIDIDO "DIVIDIDO"
RETURN "TOME DE VOLTA"
PRINT "BOTE NA TELA"
VALOR_STRING \"(\\.|[^"\\])*\"
VALOR_CHAR \'(\\.|[^"\\])\'
IDENTIFICADOR [a-z_][a-z_0-9]*
VALOR_FLOAT [0-9]+.[0-9]+b
VALOR_DOUBLE [0-9]+.[0-9]+d
VALOR_INT [0-9]+
ABRE_PARENTESES "("
FECHA_PARENTESES ")"
ABRE_CHAVE "{"
FECHA_CHAVE "}"
VIRGULA ","
ABRE_COLCHETE "["
FECHA_COLCHETE "]"
E "E"
OU "OU"
NAO "NAO"

/* Início das Regras */
%%

{VERDADEIRO}         {return VERDADEIRO;}
{FALSO}              {return FALSO;}
{VETOR}              {}
{STRING}             {}
{CHAR}               {}
{VALOR_STRING}       {}
{VALOR_CHAR}         {}
{IF}                 {return SE;}
{ELSE}               {}
{WHILE}              {}
{ATRIBUICAO}         {return RECEBE;}
{MENOR}              {return MENOR;}
{MAIOR}              {return MAIOR;}
{MENOR_IGUAL}        {return MENOR_IGUAL;}
{MAIOR_IGUAL}        {return MAIOR_IGUAL;}
{IGUAL}              {}
{DIFERENTE}          {}
{MAIS}               {return ADD;}
{MENOS}              {return SUB;}
{VEZES}              {return MUL;}
{DIVIDIDO}           {return DIV;}
{RETURN}             {}
{PRINT}              {}
{IDENTIFICADOR}      {strcpy(yylval.simbolo,yytext); return IDENTIFICADOR;}
{VALOR_FLOAT}        {}
{VALOR_DOUBLE}       {}
{VALOR_INT}          {yylval.number = atoi(yytext); return NUM;}
{FLOAT}              {}
{DOUBLE}             {}
{INT}                {strcpy(yylval.simbolo,yytext); return INTEIRO;}
{ABRE_PARENTESES}    {}
{FECHA_PARENTESES}   {}
{ABRE_CHAVE}         {return ABRE_CHAVE;}
{FECHA_CHAVE}        {return FECHA_CHAVE;}
{VIRGULA}            {}
{ABRE_COLCHETE}      {}
{FECHA_COLCHETE}     {}
{E}                  {}
{OU}                 {}
{NAO}                {}
"\n"         {return EOL;}

%%
/* Fim das Regras */
/* Código C abaixo será incluído nos fontes. */

int yywrap() {}

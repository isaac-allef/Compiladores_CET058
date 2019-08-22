/*

- Para gerar o fonte digite
$ lex ex01.l

- Para compilar o fonte me C gerado digite
$ gcc ex01.yy.c

- Para executar
$ ./a.out

*/   


/* SEÇÃO DE DEFINIÇÕES */

%{

    #include "parser.tab.h"  

%}

/* Definições de Nomes */
MAIS "MAIS"
VALOR_INT [0-9]+

/* FIM DA SEÇÃO DE DEFINIÇÕES */

%%
    /* SEÇAO DE REGRAS 
        Uma entrada por linha no formato:
        
        padrão  ação

    */

{MAIS} {return ADD;}
{VALOR_INT}     { 
    yylval.number = atoi(yytext); 
    return NUM;
}
"\n"         {return EOL;}
    
%%

/*
Seção de Código do Usuário
*/

int yywrap() {}
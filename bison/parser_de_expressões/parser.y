%{

/* Código C, use para #include, variáveis globais e constantes
 * este código ser adicionado no início do arquivo fonte em C
 * que será gerado.
 */

#include <stdio.h>
%}

/* Declaração de Tokens no formato %token NOME_DO_TOKEN */
%token NUM
%token ADD
%token SUB
%token MUL
%token DIV
%token APAR
%token FPAR
%token EOL

%%
/* Regras de Sintaxe */

calc: 
    | calc exp EOL {printf("= %d\n",$2);};

exp: fator 
    | exp ADD fator {$$ = $1 + $3;}
    | exp SUB fator {$$ = $1 - $3;};
 
fator: termo
    | fator MUL termo {$$ = $1 * $3;}
    | fator DIV termo {$$ = $1 / $3;};

termo: NUM
    | APAR termo FPAR {$$ = $2;}
    | APAR exp FPAR  {$$ = $2;};

%%

/* Código C geral, será adicionado ao final do código fonte 
 * C gerado.
 */

int main(int argc, char** argv){
    yyparse();
}

yyerror(char* s){
    fprintf(stderr,"error: %s\n" , s);
}
%{

/* Código C, use para #include, variáveis globais e constantes
 * este código ser adicionado no início do arquivo fonte em C
 * que será gerado.
 */

#include <stdio.h>
#include <stdlib.h>


typedef struct No {
    char token[50];
    struct No* direita;
    struct No* esquerda;
} No;


No* allocar_no();
void liberar_no(void* no);
void imprimir_arvore(No* raiz);
No* novo_no(char[50], No*, No*);

extern FILE *yyin;
//int yylval;

%}

/* Declaração de Tokens no formato %token NOME_DO_TOKEN */
%union 
{
    int number;
    char simbolo[50];
    struct No* no;
}
%token NUM
%token ADD
%token SUB
%token MUL
%token DIV

%token VERDADEIRO
%token FALSO
%token MAIOR
%token MAIOR_IGUAL
%token MENOR
%token MENOR_IGUAL
%token SE
%token ABRE_CHAVE
%token FECHA_CHAVE
%token RECEBE
%token IDENTIFICADOR
%token INTEIRO

%token EOL

%type<no> calc
%type<no> termo
%type<no> fator
%type<no> exp
%type<number> NUM
%type<simbolo> MUL
%type<simbolo> DIV
%type<simbolo> SUB
%type<simbolo> ADD


%type<no> exp_bool
%type<no> statement
%type<no> corpo
%type<no> valor
%type<no> atribuicao
%type<no> tipo_variavel
%type<simbolo> VERDADEIRO
%type<simbolo> FALSO
%type<simbolo> MAIOR
%type<simbolo> MAIOR_IGUAL
%type<simbolo> MENOR
%type<simbolo> MENOR_IGUAL
%type<simbolo> SE
%type<simbolo> ABRE_CHAVE
%type<simbolo> FECHA_CHAVE
%type<simbolo> RECEBE
%type<simbolo> IDENTIFICADOR
%type<simbolo> INTEIRO


%%
/* Regras de Sintaxe */

calc:
    |calc exp EOL       { imprimir_arvore($2); } 
    |calc statement EOL      { imprimir_arvore($2); }
    ;

statement: SE exp_bool corpo    {$$ = novo_no("SE",$2,$3);}
    | atribuicao { $$ = $1; }
    | tipo_variavel IDENTIFICADOR { $$ = novo_no("",$1, novo_no($2,NULL,NULL)); }
    | tipo_variavel atribuicao {$$ = novo_no("",$1,$2);}
    ;

tipo_variavel : INTEIRO {$$ = novo_no($1,NULL,NULL);}
    ;

atribuicao: IDENTIFICADOR RECEBE IDENTIFICADOR {$$ = novo_no("RECEBE",novo_no($1,NULL,NULL),novo_no($3,NULL,NULL));}
    ;

corpo: ABRE_CHAVE FECHA_CHAVE   { $$ = NULL;}
    | ABRE_CHAVE statement FECHA_CHAVE  {$$ = novo_no("",$2,NULL);}
    ;

exp_bool: VERDADEIRO    {$$ = novo_no("VERDADEIRO",NULL,NULL); }
    | FALSO             {$$ = novo_no("FALSO",NULL,NULL); }
    | exp MAIOR exp     {$$ = novo_no("MAIOR",$1,$3); }
    | exp MENOR exp     {$$ = novo_no("MENOR",$1,$3); }
    | exp MAIOR_IGUAL exp   {$$ = novo_no("MAIOR_IGUAL",$1,$3); }
    | exp MENOR_IGUAL exp   {$$ = novo_no("MENOR_IGUAL",$1,$3); }
    ;

exp: fator                
   | exp ADD fator       { $$ = novo_no("MAIS",$1,$3); }
   | exp SUB fator       { $$ = novo_no("MENOS",$1,$3); }
   ;

fator: termo            
     | fator MUL termo  { $$ = novo_no("VEZES",$1,$3); }
     | fator DIV termo  { $$ = novo_no("DIVIDIDO",$1,$3); }
     ;

termo: NUM {
        char str[12];
        sprintf(str, "%d", $1);
        $$ = novo_no(str,NULL,NULL);
    }

%%

/* Código C geral, será adicionado ao final do código fonte 
 * C gerado.
 */

No* allocar_no() {
    return (No*) malloc(sizeof(No));
}

void liberar_no(void* no) {
    free(no);
}

No* novo_no(char token[50], No* direita, No* esquerda) {
    

   No* no = allocar_no();
   snprintf(no->token, 50, "%s", token);
   no->direita = direita;
   no->esquerda = esquerda;

    //printf("%s\n",token);

   return no;
}

void imprimir_arvore(No* raiz) {
    //if(raiz == NULL) { return; }
    if(raiz->direita == NULL && raiz->esquerda == NULL){
        printf("%s", raiz->token);
    }else if(raiz->direita == NULL){
        printf("(");
        imprimir_arvore(raiz->esquerda);
        if(strcmp(raiz->token,"") != 0){
            printf(",");
            printf("%s", raiz->token);
        }
        printf(")");
    }else if(raiz->esquerda == NULL){
        printf("(");
        if(strcmp(raiz->token,"") != 0){
            printf("%s", raiz->token);
            printf(",");
        }
        imprimir_arvore(raiz->direita);
        printf(")");
    }else {
        printf("(");
        imprimir_arvore(raiz->direita);
        if(strcmp(raiz->token,"") != 0){
            printf(",");
            printf("%s", raiz->token);
        }
        printf(",");
        imprimir_arvore(raiz->esquerda);
        printf(")");
    }

}


int main(int argc, char** argv) {
    FILE *myfile = fopen("entrada.in", "r");
    // make sure it is valid:
    if (!myfile) {
        return -1;
    }
    // Set flex to read from it instead of defaulting to STDIN:
    yyin = myfile;

    yyparse();
    return 1;
}

int yyerror(char *s) {
    fprintf(stderr, "error: %s\n", s);
    return 1;
}


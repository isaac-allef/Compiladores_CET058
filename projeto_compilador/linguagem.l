
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
    /*
        Definições que estarão disponíveis 
            - variáveis
            - constantes
        O que for aqui será copiado para o arquivo *.yy.c
    
        Variáveis declaradas aqui estarão acessível nas funções yylex() e 
        main().
    */
    int contador = 0;
%}

/* Definições de Nomes */
PALAVRAS_RESEVADAS "INTEIRO"|"BARRIL"|"BARRIL DOBRADO"|"MIGUEZIN"|"MIGUE"|"SE"|"SE DER MERDA"|"ENQUANTO"|"RECEBE"|"MENOR"|"MAIOR"|"MENOR IGUAL"|"MAIOR IGUAL"|"MAIS"|"MENOS"
MIGUE \"(\\.|[^"\\])*\"
MIGUEZIN \'(\\.|[^"\\])\'
identificador [a-z_][a-z_0-9]*
BARRIL [0-9]+.[0-9]+b
BARRIL_DOBRADO [0-9]+.[0-9]+d
INTEIRO [0-9]+

/* FIM DA SEÇÃO DE DEFINIÇÕES */

%%
    /* SEÇAO DE REGRAS 
        Uma entrada por linha no formato:
        
        padrão  ação

    */

{MIGUE}     {printf("<MIGUE, %s>", yytext); contador++;}
{MIGUEZIN}     {printf("<MIGUEZIN, %s>", yytext); contador++;}
{PALAVRAS_RESEVADAS}     {printf("<PALAVRAS_RESEVADAS, %s>", yytext); contador++;}
{identificador}     {printf("<identificador, %s>", yytext); contador++;}
{BARRIL}     {printf("<BARRIL, %s>", yytext); contador++;}
{BARRIL_DOBRADO}     {printf("<BARRIL_DOBRADO, %s>", yytext); contador++;}
{INTEIRO}     {printf("<INTEIRO, %s>", yytext); contador++;}
<<EOF>>                return 0;
    
%%

/*
Seção de Código do Usuário
*/

int yywrap() {}
int main() {
    printf("Iniciando Análise Léxica...\n---\n");
    yylex();
    printf("Foram encontradas %d ocorrências de identificadores.\n", contador);
    printf("---\nÁnalise Finalizada!\n");
    
    return 0;
}

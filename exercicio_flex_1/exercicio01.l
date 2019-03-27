/* 
Crie um Analisador Léxico utilizando Flex que consiga gerar os tokens
do arquivo de entrada "exercicio01.in" que consiste em um código na
linguagem C. O analisador deverá identificar todos os tokens referentes a:

1. Identificadores
2. Números Inteiros
3. Números de Ponto Flutuante
4. Palavras reservadas
5. Operadores Matemáticos e Relacionais
6. Chaves, Colchetes e Chaves

utilize os exemplos no diretório "flex" como ponto de partida.
*/

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
PALAVRAS_RESERVADAS "int"|"float"|"unsigned"|"if"
IDENTIFICADOR       [_a-zA-Z][_a-zA-Z0-9]*  
OPERADOR_MATEMATICO "**"|"+"|"\/"|"*"|"-"
NUMERO_INTEIRO              [0-9]+
NUMERO_FLOAT		[0-9]+.[0-9]+
OPERADOR_REALACIONAL "=="|">"|">="|"<"|"<="
OPERADOR_ATRIBUICAO "="
PARENTESES_OPEN "("
PARENTESES_CLOSE ")"
CHAVES_OPEN "{"
CHAVES_CLOSE "}"
COCHETE_OPEN "["
COCHETE_CLOSE "]"

/* FIM DA SEÇÃO DE DEFINIÇÕES */

%%
    /* SEÇAO DE REGRAS 
        Uma entrada por linha no formato:
        
        padrão  ação

    */
{PALAVRAS_RESERVADAS}               {printf("<PALAVRAS_RESERVADAS, %s>", yytext); contador++;}
{IDENTIFICADOR}        {printf("<IDENTIFICADOR, %s>", yytext); contador++;}
{OPERADOR_MATEMATICO}  {printf("<OPERADOR_MATEMATICO, %s>", yytext); contador++;}
{NUMERO_INTEIRO}               {printf("<NUMERO_INTEIRO, %s>", yytext); contador++;}
{NUMERO_FLOAT}               {printf("<NUMERO_FLOAT, %s>", yytext); contador++;}
{OPERADOR_REALACIONAL}               {printf("<OPERADOR_REALACIONAL, %s>", yytext); contador++;}
{OPERADOR_ATRIBUICAO}               {printf("<OPERADOR_ATRIBUICAO, %s>", yytext); contador++;}

{PARENTESES_OPEN}               {printf("<PARENTESES_OPEN, %s>", yytext); contador++;}
{PARENTESES_CLOSE}               {printf("<PARENTESES_CLOSE, %s>", yytext); contador++;}
{CHAVES_OPEN}               {printf("<CHAVES_OPEN, %s>", yytext); contador++;}
{CHAVES_CLOSE}               {printf("<CHAVES_CLOSE, %s>", yytext); contador++;}
{COCHETE_OPEN}               {printf("<COCHETE_OPEN, %s>", yytext); contador++;}
{COCHETE_CLOSE}               {printf("<COCHETE_CLOSE, %s>", yytext); contador++;}
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

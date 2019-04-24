
# Compiladores

## Descrição

<p>C-Baiano é uma linguagem de programação simples que se baseia em duas linguagens. A primeira é a linguagem C, herdando assim uma estrutura conhecida pela maioria dos programadores, como o uso de chaves para delimitar o escopo de funções e o uso de parênteses para colocar os argumentos de funções. A segunda linguagem é a SQL, tendo assim características mais próximas do português assim como o SQl se parece com o inglês. Ela utiliza letras maiúsculas para palavras reservadas e o restante obrigatoriamente minúsculas exceto as strings, os comandos são em português, utilizando o mínimo de caracteres especiais.<p>

## Tipos Reconhecidos Pela Linguagem

```
inteiro = INTEIRO
float = BARRIL
double = BARRIL DOBRADO
char = MIGUEZIN
string = MIGUE
```

## Declaração de Variáveis

```
INTEIRO var_inteiro1 RECEBE 10
BARRIL var_flutuante RECEBE 10.5b
BARRIL DOBRADO var_dobrado RECEBE 1000.7d
MIGUEZIN var_letra RECEBE 'a'
MIGUE var_letras RECEBE "aaa"
```

## Estrutura Condicional 

```
SE <condição>{
	<faz>
}SE DER MERDA{
	<faz>
}
```

## Estrutura De Repetição

```
ENQUANTO <condição>{
    <faz>
}
```

## Função

```
INTEIRO <nome da função>(<argumento 1>, <argumento 2>, ...){
	<faz>
	TOME DE VOLTA <valor de retorno>
}
```


## Print

```
BOTE NA TELA ( <valor à ser exibido> )
```

## Declaração De Vetor

```
<tipo do vetor> VETOR <nome do vetor> RECEBE [<valor 1>, <valor 2>, ...]
```


## Utilização Do Vetor

```
<nome do vetor>[<índice>]
```

## Exemplo

```
INTEIRO var_inteiro1 RECEBE 10
INTEIRO var_inteiro2 RECEBE 9
BARRIL var_flutuante RECEBE 10.5b
BARRIL DOBRADO var_dobrado RECEBE 1000.7d
MIGUEZIN var_letra RECEBE 'a'
MIGUE var_letras RECEBE "aaa"
INTEIRO contador RECEBE 0

INTEIRO VETOR numeros RECEBE [0,1,2,3,4,5,6,7,8,9]

INTEIRO menor (INTEIRO int1, INTEIRO int2){
	SE int1 MENOR int2{
		BOTE NA TELA ( int1 )
	}SE DER MERDA{
		BOTE NA TELA ( int2 )
	}
	TOME DE VOLTA 0
}
ENQUANTO contador MENOR IGUAL 10{
	SE numeros[contador] IGUAL 5{
		BOTE NA TELA ( numeros[contador] )
	}
	contador RECEBE contador MAIS 1
}
```

compile: parser.y linguagem.l
	bison -d parser.y
	flex linguagem.l
	gcc -o parser.x parser.tab.c lex.yy.c -ll
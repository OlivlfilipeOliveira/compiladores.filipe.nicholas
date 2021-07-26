package src;
%%

%{

/*-*
	* funcoes e variaveis
	*/

private void imprimir(String descricao, String lexema) {
	System.out.println(String.format("%-25s", lexema)+ descricao);
	
}

%}

/*-*
	* classe gerada
	*/
	
%public
%class AnalisadorLexico
%unicode
%type void


/*-*
	* definicoes regulares
	*/
ESPACO = [\n|\s|\t]
LETRA = [A-Za-z]
DIGITO = [0-9]
INTEIRO = {DIGITO}+
ID = ({LETRA}|_)+({LETRA}|{INTEIRO}_)*

%%

"import"					{ imprimir("Palavra reservada import", yytext()); }
"input"						{ imprimir("Palavra reservada input", yytext()); }
"print"						{ imprimir("Palavra reservada print", yytext()); }
"range"						{ imprimir("Palavra reservada range", yytext()); }
":"                    		{ imprimir("Palavra reservada then (Entуo)", yytext()); }
"for"						{ imprimir("Palavra reservada for", yytext()); }
"in"						{ imprimir("Palavra reservada in", yytext()); }
"int"						{ imprimir("Palavra reservada int", yytext()); }
"("							{ imprimir("Delimitador Inicial (", yytext()); }
")"							{ imprimir("Delimitador Final )", yytext()); }
","							{ imprimir("Separador de variavel", yytext()); }
"."							{ imprimir("Referъncia", yytext()); }
"="							{ imprimir("Atribuiчуo", yytext()); }
"+"							{ imprimir("Operador de Adição", yytext()); }
\'(.)*\'	{ imprimir("String", yytext()); }
{ESPACO} 					{  }		
{ID} 						{ imprimir("Identificador", yytext()); }
{INTEIRO} 					{ imprimir("Numero Inteiro", yytext()); }
\#(.)*						{ imprimir("Comentário", yytext()); }
\'\'\'({DIGITO}|{LETRA}|{ID}|{ESPACO})*\'\'\' { imprimir("Comentários multi linha", yytext()); }
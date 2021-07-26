package src;

import java.io.IOException;
import java.io.StringReader;

public class TesteAnalisador{
	public static void main(String[] args) throws IOException {
		//código para calcular a soma de n inteiros.
		String codigo = "print('____ Soma de n inteiros ____')\n"
				+ "n = int(input('Digite a quantidade de números a somar: '))\n"
				+ "soma = 0\n"
				+ "for i in range(n):\n"
				+ "\tnum = int(input('Digite o valor a somar: '))\n"
				+ "\tsoma = soma + num\n"
				+ "\n"
				+ "print(soma)";
		AnalisadorLexico lexical = new AnalisadorLexico(new StringReader(codigo));
		lexical.yylex();
	}


}
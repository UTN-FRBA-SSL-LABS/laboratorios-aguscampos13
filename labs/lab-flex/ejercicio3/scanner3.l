%pointer
%option noyywrap

%{
#include <stdio.h>
#include "misfunciones.h"

 /* Variable global para contar los tokens reconocidos */
int contadorTokens = 0;
%}

digito        [0-9]
letra         [a-zA-Z_]
identificador {letra}({letra}|{digito})*

%%

{identificador} {
    contadorTokens++;
    printf("identificador: %s\n", yytext);
}

[ \t\n]         { }
.               { }           

%%

int main(void) {
   yylex();
   printf("Tokens totales: %d\n", contadorTokens);
   printf("El doble es: %d\n", duplicar(contadorTokens));
   return 0;
}
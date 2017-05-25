%option noyywrap

%{
   #include <stdlib.h>
   #include <iostream>
   #include "parser.tab.h"

   double angle2double(const char *) {
     return 0;
   }
%}

%%

[0-9]+(\.[0-9]+)? {
  yylval.number = std::stod(yytext);
  return NUMBER;
}

[\(\)\=\+\-\*\/] return yytext[0];
sin return SIN;
cos return COS;

M[0-6] {
  yylval.memoryCell = std::stoul(yytext + 1);
  return MEM;
}

"<-" return ASSIGEMENT;

[0-5]?[0-9](\.[0-9]+)?s {
  yylval.number = angle2double(yytext);
  return NUMBER;
}

([0-9]+d)?([0-5]?[0-9]m([0-5]?[0-9](\.[0-9]+)?s)?)? {
  yylval.number = angle2double(yytext);
  return NUMBER;
}

##.*
\r?\n
" "
. return INVALID_SYMBOL;
%%

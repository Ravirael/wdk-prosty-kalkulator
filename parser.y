%{
	#include <stdlib.h>
	#include <stdio.h>
	#include <cmath>
	#include <iostream>
	#include <array>
	#include <vector>

	void yyerror(const char *s);
	int yylex();
	extern FILE* yyin;

	std::array<double, 6> memory;
%}

%verbose

%union
{
 double number;
 unsigned memoryCell;
};

%token SIN COS ASSIGEMENT INVALID_SYMBOL
%token<number> NUMBER
%token<memoryCell> MEM
%type<number> expressionBody
%left '+' '-'
%left '*' '/'
%right NEGATION
%right SIN COS
%%

head : expression
		| head expression

expression: expressionBody '=' { std::cout << "expression = " << $1 << std::endl;}
					| assigementExpression '='
					| error '=' { std::cout << "Error" << std::endl;}

expressionBody: NUMBER {$$ = $1;}
							| '(' expressionBody ')' {$$ = $2;}
							| '-' expressionBody {$$ = - $2;} %prec NEGATION
							| expressionBody '*' expressionBody {$$ = $1 * $3;}
							| expressionBody '/' expressionBody {$$ = $1 / $3;}
							| expressionBody '+' expressionBody {$$ = $1 + $3;}
							| expressionBody '-' expressionBody {$$ = $1 - $3;}
							| COS expressionBody {$$ = std::cos($2);}
							| SIN expressionBody {$$ = std::sin($2);}
							| MEM {$$ = memory[$1];}

assigementExpression: MEM ASSIGEMENT expressionBody {
	memory[$1] = $3;
	std::cout << "M" << $1 << " = " << $3 << std::endl;
}

%%

void yyerror(const char *s) {

}

int main(int argc, char **argv)
{
		if (argc > 1) {
			yyin = fopen(argv[1], "r");
		}
    std::ios_base::sync_with_stdio (true);
    yyparse();
		if (argc > 1) {
			fclose(yyin);
		}
    return 0;
}

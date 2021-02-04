%{

%}
lettre [a-zA-Z]
str [a-zA-Z\s\t]*
%x LEGEND
%%
" " {;}

\<table(.)*\> {printf("debut de tableau : %s \n",yytext);}
\<\/table(.)*\> {printf("fin de tableau : %s \n",yytext);}

\<tr\> {printf("debut de ligne : %s \n",yytext);}
\<\/tr\> {printf("fin de ligne  : %s \n",yytext);}

\<td\> {printf("debut de cellule  : %s \n",yytext);}
\<\/td\> {printf("fin de cellule  : %s \n",yytext);}

\<th\> {printf("debut de cellule d en tete  : %s \n",yytext);}
\<\/th\> {printf("fin de cellule d en tete  : %s \n",yytext);}

\<thead\> {printf("debut de bloc d en tete  : %s \n",yytext);}
\<\/thead\> {printf("fin de bloc d en tetes  : %s \n",yytext);}

\<tbody\> {printf("debut de bloc de corps  : %s \n",yytext);}
\<\/tbody\> {printf("fin de bloc de corps : %s \n",yytext);}

\<caption\> {printf("debut legende  : %s \n",yytext); BEGIN(LEGEND);}
\<\/caption\> {printf("fin de legende  : %s \n",yytext);}


<LEGEND>{str} {printf("contenu %s \n", yytext); BEGIN(INITIAL);}

. {;}
\n {}


%%
void main()
{ 
  yylex();
  return;
}
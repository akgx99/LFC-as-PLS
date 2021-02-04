ok : projet

projet: projet.lex
	flex -oprojet.c projet.lex
	gcc -o projet projet.c -lfl -lc
	./projet < Exemple3.html

clean : 
	rm -f projet projet.c projet.o

all: mit chicken guile chibi larceny mosh picrin gambitc gauche racket cyclone

clean:
	rm -f *.log errors.csv

mit:
	./coverage mit
chicken:
	./coverage chicken
guile:
	./coverage guile
chibi:
	./coverage chibi
larceny:
	./coverage larceny
mosh:
	./coverage mosh
picrin:
	./coverage picrin
gambitc:
	./coverage gambitc
gauche:
	./coverage gauche
racket:
	./coverage racket
cyclone:
	./coverage cyclone

all: mit chicken guile chibi larceny mosh picrin gambitc gauche racket

clean:
	rm -f *.log

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

html: errors.csv
	mit-scheme --load stats.scm --eval '(begin (format-stats) (%exit 0))'

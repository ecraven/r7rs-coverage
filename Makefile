all: mit chicken guile chibi larceny mosh

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

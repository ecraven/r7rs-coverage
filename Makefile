.PHONY: all html clean

all: errors.csv

errors.csv: gerbil mit chicken guile chibi larceny gauche racket cyclone

mit: mit.log Makefile
mit.log:
	./coverage mit
gerbil: gerbil.log Makefile
gerbil.log:
	./coverage gerbil
chicken: chicken.log Makefile
chicken.log:
	./coverage chicken
guile: guile.log Makefile
guile.log:
	./coverage guile
chibi: chibi.log Makefile
chibi.log:
	./coverage chibi
larceny: larceny.log Makefile
larceny.log:
	./coverage larceny
kawa: kawa.log Makefile
kawa.log:
	./coverage kawa
picrin: picrin.log Makefile
picrin.log:
	./coverage picrin
gauche: gauche.log Makefile
gauche.log:
	./coverage gauche
racket: racket.log Makefile
racket.log:
	./coverage racket
cyclone: cyclone.log Makefile
cyclone.log:
	./coverage cyclone

html: index.html

index.html: errors.csv stats.scm
	mit-scheme --load stats.scm --eval '(begin (format-stats) (%exit 0))'

clean:
	rm -f *.log errors.csv


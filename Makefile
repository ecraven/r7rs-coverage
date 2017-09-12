.PHONY: all html clean

all: errors.csv

errors.csv: mit chicken guile chibi larceny mosh picrin gambitc gauche racket cyclone

mit: mit.log
mit.log:
	./coverage mit
chicken: chicken.log
chicken.log:
	./coverage chicken
guile: guile.log
guile.log:
	./coverage guile
chibi: chibi.log
chibi.log:
	./coverage chibi
larceny: larceny.log
larceny.log:
	./coverage larceny
mosh: mosh.log
mosh.log:
	./coverage mosh
picrin: picrin.log
picrin.log:
	./coverage picrin
gambitc: gambitc.log
gambitc.log:
	./coverage gambitc
gauche: gauche.log
gauche.log:
	./coverage gauche
racket: racket.log
racket.log:
	./coverage racket
cyclone: cyclone.log
cyclone.log:
	./coverage cyclone

html: index.html

index.html: errors.csv
	mit-scheme --load stats.scm --eval '(begin (format-stats) (%exit 0))'

clean:
	rm -f *.log errors.csv


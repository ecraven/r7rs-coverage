.PHONY: all html clean

all: chibi chicken cyclone foment gauche gerbil guile kawa loko mit racket sagittarius # chez larceny

chez: chez.log Makefile
chez.log:
	./coverage chez
chibi: chibi.log Makefile
chibi.log:
	./coverage chibi
chicken: chicken.log Makefile
chicken.log:
	./coverage chicken
cyclone: cyclone.log Makefile
cyclone.log:
	./coverage cyclone
foment: foment.log Makefile
foment.log:
	./coverage foment
gauche: gauche.log Makefile
gauche.log:
	./coverage gauche
gerbil: gerbil.log Makefile
gerbil.log:
	./coverage gerbil
guile: guile.log Makefile
guile.log:
	./coverage guile
kawa: kawa.log Makefile
kawa.log:
	./coverage kawa
larceny: larceny.log Makefile
larceny.log:
	./coverage larceny
loko: loko.log Makefile
loko.log:
	./coverage loko
mit: mit.log Makefile
mit.log:
	./coverage mit
picrin: picrin.log Makefile
picrin.log:
	./coverage picrin
racket: racket.log Makefile
racket.log:
	./coverage racket
sagittarius: sagittarius.log Makefile
sagittarius.log:
	./coverage sagittarius

html: index.html

index.html: errors.csv stats.scm
	mit-scheme --load stats.scm --eval '(begin (format-stats) (%exit 0))'

clean:
	rm -f *.log errors.csv

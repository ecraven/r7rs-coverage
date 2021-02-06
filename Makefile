.PHONY: all html clean

# slowest first
all: sagittarius kawa racket mit chibi chicken cyclone foment gauche gerbil guile husk loko owllisp  # chez larceny picrin

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
husk: husk.log Makefile
husk.log:
	./coverage husk
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
owllisp: owllisp.log Makefile
owllisp.log:
	./coverage owllisp
picrin: picrin.log Makefile
picrin.log:
	./coverage picrin
racket: racket.log Makefile
racket.log:
	./coverage racket
sagittarius: sagittarius.log Makefile
sagittarius.log:
	./coverage sagittarius
tinyscheme: tinyscheme.log Makefile
tinyscheme.log:
	./coverage tinyscheme

html: index.html

index.html: errors.csv stats.scm
	mit-scheme --load stats.scm --eval '(begin (format-stats) (%exit 0))'

clean:
	rm -f *.log errors.csv

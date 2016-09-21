all: mit chicken guile chibi

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

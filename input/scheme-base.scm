;; TEST * no parameters
(assert (= 1 (*)))
;; TEST * one parameter
(assert (= 5 (* 5)))
;; TEST * more than two parameters
(assert (= 24 (* 1 2 3 4)))
;; TEST + no parameters
(assert (= 0 (+)))
;; TEST + one parameter
(assert (= 5 (+ 5)))
;; TEST + more than two parameters
(assert (= 10 (+ 1 2 3 4)))
;; TEST - one parameter
(assert (= -5 (- 5)))
;; TEST - more than two parameters
(assert (= -3 (- 1 2 2)))
;; ... is missing here..
;; TEST / one parameter
(assert (= 1/5 (/ 5)))
;; TEST / more than two parameters
(assert (= 1/6 (/ 1 2 3)))
;; TEST < two parameters
(assert (< 1 2))
;; TEST < more than two parameters
(assert (< 1 2 3 4))
;; TEST <= two parameters
(assert (<= 1 1))
;; TEST <= more than two parameters
(assert (<= 1 1 2 2))
;; TEST = two parameters
(assert (= 1 1))
;; TEST = more than two parameters
(assert (= 1 1 1 1))
;; => is missing here
;; TEST > two parameters
(assert (> 4 3))
;; TEST > more than two parameters
(assert (> 4 3 2 1))
;; TEST >= two parameters
(assert (>= 2 2))
;; TEST >= more than two parameters
(assert (>= 2 2 1 1))
;; _ is missing here
;; TEST abs
(assert (= 5 (abs -5)))
;; TEST and no forms
(assert (and))
;; TEST and short-circuit
(assert (not (and #t #f (/ 1 0))))
;; TEST append
(assert (equal? '(1 2 3 4) (append '(1 2) '(3 4))))
(assert (equal? '(1 2 3 4) (append '() '(1 2) '(3 4) '())))
;; TEST append improper list
(assert (equal? '(a b c . d) (append '(a b) '(c . d))))
;; TEST append not list
(assert (eq? 'a (append '() 'a)))
;; TEST apply
(assert (= 3 (apply + '(1 2))))
(assert (= 10 (apply + 1 2 3 '(4))))
;; TEST assoc
(assert (equal? '(a 1) (assoc 'a '((a 1) (b 2) (c 3)))))
;; TEST assoc comparator
(assert (equal? '(1 a) (assoc 1 '((1 a) (2 b) (3 c)) =)))
;; TEST assq
(assert (equal? '(a 1) (assq 'a '((a 1) (b 2) (c 3)))))
;; TEST assv
(assert (equal? '(a 1) (assv 'a '((a 1) (b 2) (c 3)))))
;; TEST begin
(assert (= 3 (begin 1 2 3)))
;; TEST binary-port?
(list binary-port?)
;; TEST boolean=?
(assert (boolean=? #t #t))
(assert (boolean=? #f #f))
(assert (not (boolean=? #t #f)))
;; TEST boolean?
(assert (boolean? #t))
(assert (boolean? #f))
(assert (not (boolean? 3)))
(assert (not (boolean? 'a)))
;; TEST bytevector
(assert (let ((b (bytevector 1 2 3))) b))
;; TEST bytevector-append
(assert (equal? (bytevector 1 2 3 4 5 6) (bytevector-append (bytevector 1 2) (bytevector 3 4) (bytevector 5 6))))
;; TEST bytevector-copy 3 args
(assert (let ((b (bytevector 1 2 3))) (and (equal? b (bytevector-copy b)) (not (eq? b (bytevector-copy b))))))
;; TEST bytevector-copy 4 args
(assert (let ((b (bytevector 5 1 2 3))) (equal? (bytevector 1 2 3) (bytevector-copy b 1))))
;; TEST bytevector-copy 5 args
(assert (let ((b (bytevector 5 1 2 3 5))) (equal? (bytevector 1 2 3) (bytevector-copy b 1 4))))
;; TEST bytevector-copy! 3 args
(define b (make-bytevector 3)) (bytevector-copy! b 0 (bytevector 1 2 3)) (assert (equal? (bytevector 1 2 3) b))
;; TEST bytevector-copy! 4 args
(define b (make-bytevector 3 0)) (bytevector-copy! b 0 (bytevector 5 1 2 3) 1) (assert (equal? (bytevector 1 2 3) b))
;; TEST bytevector-copy! 5 args
(define b (make-bytevector 3 0)) (bytevector-copy! b 0 (bytevector 5 1 2 3 4) 1 4) (assert (equal? (bytevector 1 2 3) b))
;; TEST bytevector-length
(assert (= 3 (bytevector-length (bytevector 1 2 3))))
;; TEST bytevector-u8-ref
(assert (= 3 (bytevector-u8-ref (bytevector 1 2 3) 2)))
;; TEST bytevector-u8-set!
(define b (make-bytevector 5 3)) (bytevector-u8-set! b 0 5) (assert (= 5 (bytevector-u8-ref b 0)))
;; TEST bytevector?
(assert (bytevector? (bytevector 1 2 3)))
;; TEST caar
(assert (= 1 (caar '((1)))))
;; TEST cadr
(assert (= 2 (cadr (cons 1 '(2)))))
;; TEST call-with-current-continuation
(assert (= -3 (call-with-current-continuation (lambda (exit) (for-each (lambda (x) (if (negative? x) (exit x))) '(54 0 37 -3 245 19)) #t))))
;; TEST call-with-port
(list call-with-port)
;; TEST call-with-values
(assert (= 5 (call-with-values (lambda () (values 4 5)) (lambda (a b) b))))
;; TEST call/cc
(assert (= -3 (call/cc (lambda (exit) (for-each (lambda (x) (if (negative? x) (exit x))) '(54 0 37 -3 245 19)) #t))))
;; TEST car
(assert (= 1 (car (cons 1 2))))
;; TEST case else
(assert (= 1 (case 'a ((b) 3) ((a f) 1) (else 2))))
;; TEST case =>
(assert (eq? 'c (case (car '(c d)) ((a e i o y) 'vowel) ((w y) 'semivowel) (else => (lambda (x) x)))))
;; TEST cdar
(assert (= 2 (cdar (list '(1 . 2)))))
;; TEST cddr
(assert (= 2 (cddr (cons 'a '(1 . 2)))))
;; TEST cdr
(assert (= 2 (cdr (cons 1 2))))
;; TEST ceiling
(assert (= 6 (ceiling 5.3)))
;; TEST char->integer
(assert (= 97 (char->integer #\a)))
;; char-ready? is missing
;; TEST char<=?
(assert (char<=? #\a #\a #\b #\b))
;; TEST char<?
(assert (char<? #\a #\b #\c))
;; TEST char=?
(assert (char=? #\a #\a #\a))
;; TEST char>=?
(assert (char>=? #\b #\b #\a #\a))
;; TEST char>?
(assert (char>? #\c #\b #\a))
;; TEST char?
(assert (char? #\a))
(assert (not (char? 3)))
;; close-input-port is missing
;; close-output-port is missing
;; close-port is missing
;; complex? is missing
;; TEST cond else
(assert (= 1 (cond ((= 0 1) 0) (else 1))))
;; TEST cond =>
(assert (= 2 (cond ((assq 'b '((a 1) (b 2))) => cadr) (else #f))))
;; cond-expand is missing
;; TEST cons
(assert (equal? '(1 . 2) (cons 1 2)))
;; current-error-port is missing
;; current-input-port is missing
;; current-output-port is missing
;; TEST define value
(define x 3) (assert (= 3 x))
;; TEST define function, 1 parameter
(define (f x) 3) (assert (= 3 (f 3)))
;; TEST define function, 3 parameters
(define (f a b c) 3) (assert (= 3 (f 1 2 3)))
;; TEST define function, rest parameter
(define (f a b . c) c) (assert (equal? '(3 4 5) (f 1 2 3 4 5)))
;; TEST define function, only rest parameter
(define (f . c) c) (assert (equal? '(1 2 3) (f 1 2 3)))
;; define-record-type is missing
;; define-syntax is missing
;; define-values is missing
;; TEST denominator
(assert (= 17 (denominator 5/17)))
;; TEST do
(assert (= 25 (let ((x '(1 3 5 7 9))) (do ((x x (cdr x)) (sum 0 (+ sum (car x)))) ((null? x) sum)))))
;; dynamic-wind is missing
;; else is missing
;; eof-object is missing
;; eof-object? is missing
;; TEST eq? symbols
(assert (eq? 'a 'a))
;; TEST eq? different lists
(assert (not (eq? (list 'a) (list 'a))))
;; TEST eq? null
(assert (eq? '() '()))
;; TEST eq? function
(assert (eq? car car))
;; TEST eq? vector
(let ((x (make-vector 3))) (assert (eq? x x)))
;; TEST eq? same function
(let ((x (lambda (x) (+ x 1)))) (assert (eq? x x)))
;; equal? is missing
;; TEST eqv? true
(assert (eqv? #t #t))
;; TEST eqv? false
(assert (eqv? #f #f))
;; TEST eqv? symbol
(assert (eqv? 'a 'a))
;; TEST eqv? integer
(assert (eqv? 3 3))
;; TEST eqv? real
(assert (eqv? 3.0 3.0))
;; TEST eqv? char
(assert (eqv? #\a #\a))
;; TEST eqv? null
(assert (eqv? '() '()))
;; TEST eqv? pair
(let ((x (cons 1 2))) (assert (eqv? x x)))
;; TEST eqv? vector
(let ((x (make-vector 5))) (assert (eqv? x x)))
;; TEST eqv? string
(let ((x (make-string 4))) (assert (eqv? x x)))
;; TEST eqv? bytevector
(let ((x (make-bytevector 4))) (assert (eqv? x x)))
;; TEST eqv? function
(assert (eqv? + +))
;; TEST eqv? different booleans
(assert (not (eqv? #t #f)))
;; TEST eqv? different symbols
(assert (not (eqv? 'a 'b)))
;; TEST eqv? integer and real
(assert (not (eqv? 3 3.0)))
;; TEST eqv? different integers
(assert (not (eqv? 3 4)))
;; TEST eqv? different chars
(assert (not (eqv? #\a #\b)))
;; TEST eqv? different list literals
(assert (not (eqv? '() '(1))))
;; TEST eqv? different lists
(let ((a (make-list 3)) (b (make-list 3))) (assert (not (eqv? a b))))
;; TEST eqv? different vectors
(let ((a (make-vector 3)) (b (make-vector 3))) (assert (not (eqv? a b))))
;; TEST eqv? different strings
(let ((a (make-string 3)) (b (make-string 3))) (assert (not (eqv? a b))))
;; TEST eqv? different bytevectors
(let ((a (make-bytevector 3)) (b (make-bytevector 3))) (assert (not (eqv? a b))))
;; error is missing
;; error-object-irritants is missing
;; error-object-message is missing
;; error-object? is missing
;; TEST even?
(assert (even? 2))
;; TEST exact
(assert (exact? (exact 3.0)))
;; TEST exact-integer-sqrt
(assert (call-with-values (lambda () (exact-integer-sqrt 17)) (lambda (a b) (and (= a 4) (= b 1)))))
;; TEST exact-integer?
(assert (exact-integer? 32))
;; TEST exact?
(assert (exact? 3))
;; TEST expt
(assert (= 8 (expt 2 3)))
;; TEST expt 0^0
(assert (= 1 (expt 0 0)))
;; TEST expt 0^1
(assert (= 0 (expt 0 1)))
;; features is missing
;; file-error? is missing
;; TEST floor
(assert (= 5 (floor 5.3)))
;; TEST floor-quotient
(assert (= -4 (floor-quotient 10 -3)))
;; TEST floor-remainder
(assert (= -2 (floor-remainder 10 -3)))
;; TEST floor/
(assert (call-with-values (lambda () (floor/ 5 2)) (lambda (a b) (and (= a 2) (= b 1)))))
(assert (call-with-values (lambda () (floor/ -5 2)) (lambda (a b) (and (= a -3) (= b 1)))))
(assert (call-with-values (lambda () (floor/ 5 -2)) (lambda (a b) (and (= a -3) (= b -1)))))
(assert (call-with-values (lambda () (floor/ -5 -2)) (lambda (a b) (and (= a 2) (= b -1)))))
;; flush-output-port is missing
;; TEST for-each 1 list
(define x 0) (for-each (lambda (o) (set! x (+ x o))) '(1 2 3 4)) (assert (= x 10))
;; TEST for-each 2 lists, different length
(define x 0) (for-each (lambda (a b c) (set! x (+ x (+ a b c)))) '(1 2 3 4) '(1 2) '(1 2 3)) (assert (= x 9))
;; TEST gcd
(assert (= 782 (gcd 72726 17986)))
;; get-output-bytevector is missing
;; get-output-string is missing
;; guard is missing
;; TEST if
(assert (= 0 (if #t 0 1)))
(assert (= 1 (if #f 0 1)))
;; TEST if no else
(assert (= 1 (if #t 1)))
;; include is missing
;; include-ci is missing
;; TEST inexact
(assert (inexact? (inexact 3)))
;; TEST inexact?
(assert (inexact? 3.0))
;; input-port-open? is missing
;; input-port? is missing
;; TEST integer->char
(assert (char=? #\a (integer->char 97)))
;; TEST integer?
(assert (integer? 123))
;; TEST lambda
(assert (= 5 ((lambda (x) x) 5)))
;; TEST lambda rest
(assert (equal? '(5) ((lambda (x . y) y) 3 5)))
;; TEST lambda only rest
(assert (equal? '(3 5) ((lambda x x) 3 5)))
;; TEST lcm
(assert (= 1672698 (lcm 72726 17986)))
;; TEST length
(assert (= 3 (length '(1 2 3))))
(assert (= 0 (length '())))
;; TEST let forms
(assert (= 6 (let ((x 2) (y 3)) (* x y))))
;; TEST let no bindings
(assert (= 1 (let () 1)))
;; TEST let named
(assert (= 10 (let loop ((lst '(1 2 3 4)) (sum 0)) (if (null? lst) sum (loop (cdr lst) (+ sum (car lst)))))))
;; TEST let*
(assert (= 6 (let* ((x 2) (y (+ x 1))) (* x y))))
;; TEST let*-values
(assert (equal? '(x y x y) (let ((a 'a) (b 'b) (x 'x) (y 'y)) (let*-values (((a b) (values x y)) ((x y) (values a b))) (list a b x y)))))
;; let-syntax is missing
;; TEST let-values
(assert (= 35 (let-values (((a b) (values 7 5))) (* a b))))
;; TEST letrec
(assert (letrec ((even? (lambda (n) (if (zero? n) #t (odd? (- n 1))))) (odd? (lambda (n) (if (zero? n) #f (even? (- n 1)))))) (even? 88)))
;; TEST letrec*
(assert (= 5 (letrec* ((p (lambda (x) (+ 1 (q (- x 1))))) (q (lambda (y) (if (zero? y) 0 (+ 1 (p (- y 1)))))) (x (p 5)) (y x)) y)))
;; letrec-syntax is missing
;; TEST list
(assert (equal? '(1 2 3) (list 1 2 3)))
(assert (equal? '() (list)))
;; TEST list->string
(assert (string=? "foo" (list->string '(#\f #\o #\o))))
;; TEST list->vector
(assert (equal? #(1 2 3) (list->vector '(1 2 3))))
;; TEST list-copy
(assert (let ((l '(1 2 3))) (and (not (eq? l (list-copy l))) (equal? l (list-copy l)))))
;; TEST list-ref
(assert (= 5 (list-ref '(1 3 5) 2)))
;; TEST list-set!
(define l (list 1 2 3)) (list-set! l 1 5) (assert (= 5 (list-ref l 1)))
;; TEST list-tail
(assert (let ((l (list 1 2 3 4))) (eq? (cddr l) (list-tail l 2))))
;; TEST list?
(assert (list? '(1 2 3)))
(assert (not (list? '(1 2 3 . 4))))
;; TEST make-bytevector
(assert (let ((b (make-bytevector 3 5))) (and (= 3 (bytevector-length b)) (= 5 (bytevector-u8-ref b 2)))))
;; TEST make-list
(assert (= 5 (length (make-list 5))))
(assert (equal? '(5 5 5) (make-list 3 5)))
;; TEST make-parameter
(define p (make-parameter 3)) (assert (= (p) 3))
;; TEST make-parameter converter
(define p (make-parameter 3 (lambda (x) (+ x 1)))) (assert (= (p) 4))
;; TEST make-string
(assert (= 10 (string-length (make-string 10))))
;; TEST make-string fill
(assert (char=? #\a (string-ref (make-string 10 #\a) 9)))
;; TEST make-vector
(assert (= 2 (vector-length (make-vector 2))))
;; TEST make-vector fill
(assert (= 3 (vector-ref (make-vector 5 3) 0)))
;; TEST map 1 list
(assert (equal? '(1 2 3) (map (lambda (x) (+ x 1)) '(0 1 2))))
;; TEST map 2 lists
(assert (equal? '(0 2 4) (map + '(0 1 2) '(0 1 2))))
;; TEST map 3 lists, different length
(assert (equal? '(0 3 6) (map + '(0 1 2) '(0 1 2) '(0 1 2 3))))
;; TEST max
(assert (= 5 (max 1 2 3 4 5)))
;; TEST member
(assert (equal? '(b c) (member 'b '(a b c))))
;; TEST member comparator
(assert (equal? '(2 3) (member '2 '(1 2 3) =)))
;; TEST memq
(assert (equal? '(b c) (memq 'b '(a b c))))
;; TEST memv
(assert (equal? '(b c) (memv 'b '(a b c))))
;; TEST min
(assert (= 1 (min 1 2 3 4 5)))
;; modulo is missing
;; TEST negative?
(assert (negative? -1))
;; newline is missing
;; TEST not
(assert (not #f))
(assert (not (not #t)))
;; TEST null?
(assert (null? '()))
(assert (not (null? '(1 2 3))))
;; TEST number->string
(assert (string=? "123" (number->string 123)))
(assert (string=? "1111011" (number->string 123 2)))
(assert (string=? "173" (number->string 123 8)))
(assert (string=? "7b" (number->string 123 16)))
(assert (string=? "123" (number->string 123 10)))
;; TEST number?
(assert (number? 3))
(assert (not (number? 'a)))
;; TEST numerator
(assert (= 5 (numerator 5/17)))
;; TEST odd?
(assert (odd? 3))
;; open-input-bytevector is missing
;; open-input-string is missing
;; open-output-bytevector is missing
;; open-output-string is missing
;; TEST or no forms
(assert (not (or)))
;; TEST or short-circuit
(assert (or #f #t (/ 1 0)))
;; output-port-open? is missing
;; output-port? is missing
;; TEST pair?
(assert (pair? '(1 . 2)))
(assert (not (pair? 'b)))
;; TEST parameterize
(define p (make-parameter 0)) (assert (= (p) 0)) (parameterize ((p 5)) (assert (= (p) 5)))
(define p (make-parameter 0)) (assert (= (p) 0)) (parameterize ((p 5)) (parameterize ((p 7)) (assert (= (p) 7))))
;; peek-char is missing
;; peek-u8 is missing
;; port? is missing
;; TEST positive?
(assert (positive? 1))
;; TEST procedure?
(assert (procedure? procedure?))
;; quasiquote is missing
;; TEST quote
(assert (eq? 'foo (quote foo)))
;; quotient is missing
;; raise is missing
;; raise-continuable is missing
;; TEST rational?
(assert (rational? 3/4))
;; TEST rationalize
(assert (= 1/3 (rationalize (exact .3) 1/10)))
(assert (= #i1/3 (rationalize .3 1/10)))
;; read-bytevector is missing
;; read-bytevector! is missing
;; read-char is missing
;; read-error? is missing
;; read-line is missing
;; read-string is missing
;; read-u8 is missing
;; TEST real?
(assert (real? 3.14))
;; remainder is missing
;; TEST reverse
(assert (equal? '(4 3 2 1) (reverse '(1 2 3 4))))
;; TEST round
(assert (= 3 (round 2.7)))
(assert (= -3 (round -2.7)))
;; TEST set!
(define x 3) (set! x 5) (assert (= x 5))
;; TEST set-car!
(define x (cons 1 2)) (set-car! x 5) (assert (= 5 (car x)))
;; TEST set-cdr!
(define x (cons 1 2)) (set-cdr! x 5) (assert (= 5 (cdr x)))
;; TEST square
(assert (= 25 (square 5)))
;; TEST string
(assert (string=? "foo" (string #\f #\o #\o)))
;; TEST string->list
(assert (equal? '(#\f #\o #\o) (string->list "foo")))
;; TEST string->list start
(assert (equal? '(#\f #\o #\o) (string->list "xfoo" 1)))
;; TEST string->list start and end
(assert (equal? '(#\f #\o #\o) (string->list "xfoox" 1 4)))
;; TEST string->number
(assert (= 123 (string->number "123")))
(assert (= 123 (string->number "7b" 16)))
(assert (= 123 (string->number "173" 8)))
(assert (= 123 (string->number "1111011" 2)))
(assert (eq? #f (string->number "abcd")))
;; TEST string->symbol
(assert (eq? 'a (string->symbol "a")))
;; Test string->utf8
(assert (equal? (bytevector #xce #xbb) (string->utf8 "λ")))
;; TEST string->vector
(assert (equal? #(#\f #\o #\o) (string->vector "foo")))
;; TEST string->vector start
(assert (equal? #(#\f #\o #\o) (string->vector "xfoo" 1)))
;; TEST string->vector start and end
(assert (equal? #(#\f #\o #\o) (string->vector "xfoox" 1 4)))
;; TEST string-append
(assert (string=? "foobar" (string-append "foo" "bar")))
;; TEST string-copy
(assert (let ((s "foo")) (and (not (eq? s (string-copy s))) (string=? s (string-copy s)))))
;; TEST string-copy start
(assert (string=? "foo" (string-copy "xfoo" 1)))
;; TEST string-copy start and end
(assert (string=? "foo" (string-copy "xfoox" 1 4)))
;; TEST string-copy!
(define s (make-string 5)) (string-copy! s 0 "foo") (assert (string=? "foo" (substring s 0 3)))
;; TEST string-copy! start
(define s (make-string 5 #\x)) (string-copy! s 0 "xfoo" 1) (assert (string=? "foo" (substring s 0 3)))
;; TEST string-copy! start and end
(define s (make-string 5 #\x)) (string-copy! s 0 "xfoo" 1 3) (assert (string=? "fo" (substring s 0 2)))
;; TEST string-fill!
(define s (make-string 3 #\x)) (string-fill! s #\a) (assert (string=? "aaa" s))
;; TEST string-fill! start
(define s (make-string 3 #\x)) (string-fill! s #\a 1) (assert (string=? "xaa" s))
;; TEST string-fill! start and end
(define s (make-string 3 #\x)) (string-fill! s #\a 1 2) (assert (string=? "xax" s))
;; TEST string-for-each 2 strings, different length
(let ((v '())) (string-for-each (lambda (c x) (set! v (cons (char->integer c) v))) "abcde" "abcdef") (assert (equal? '(101 100 99 98 97) v)))
;; TEST string-length
(assert (= 3 (string-length "foo")))
;; TEST string-map 1 string
(assert (string=? "ABC" (string-map char-upcase "abc")))
;; TEST string-map 2 strings, different length
(assert (string=? "StUdLyCaPs" (string-map (lambda (c k) ((if (eqv? k #\u) char-upcase char-downcase) c)) "studlycaps xxx" "ululululul")))
;; TEST string-ref
(assert (char=? #\o (string-ref "foo" 2)))
;; TEST string-set!
(define s (make-string 5)) (string-set! s 3 #\x) (assert (char=? #\x (string-ref s 3)))
;; TEST string<=?
(assert (string<=? "a" "a" "b" "b"))
;; TEST string<?
(assert (string<? "a" "b" "c"))
;; TEST string=?
(assert (string=? "foo" "foo" (string #\f #\o #\o)))
;; TEST string>=?
(assert (string>=? "b" "b" "a" "a"))
;; TEST string>?
(assert (string>? "c" "b" "a"))
;; TEST string?
(assert (string? "foo"))
;; TEST substring
(assert (string=? "foo" (substring "foobar" 0 3)))
;; TEST symbol->string
(assert (string=? "a" (symbol->string 'a)))
;; TEST symbol=?
(assert (symbol=? 'a 'a (string->symbol "a")))
;; TEST symbol?
(assert (symbol? 'a))
;; syntax-error is missing
;; syntax-rules is missing
;; textual-port? is missing
;; TEST truncate
(assert (= -2 (truncate -2.5)))
(assert (= 2 (truncate 2.5)))
;; TEST truncate-quotient
(assert (= -3 (truncate-quotient 10 -3)))
;; TEST truncate-remainder
(assert (= 1 (truncate-remainder 10 -3)))
;; TEST truncate/
(assert (call-with-values (lambda () (truncate/ 5 2)) (lambda (a b) (and (= a 2) (= b 1)))))
(assert (call-with-values (lambda () (truncate/ -5 2)) (lambda (a b) (and (= a -2) (= b -1)))))
(assert (call-with-values (lambda () (truncate/ 5 -2)) (lambda (a b) (and (= a -2) (= b 1)))))
(assert (call-with-values (lambda () (truncate/ -5 -2)) (lambda (a b) (and (= a 2) (= b -1)))))
(assert (call-with-values (lambda () (truncate/ -5.0 -2)) (lambda (a b) (and (= a 2.0) (= b -1.0)))))
;; u8-ready? is missing
;; TEST unless
(unless #f "foo" 'ok)
;; unquote is missing
;; unquote-splicing is missing
;; TEST utf8->string
(assert (equal? "A" (utf8->string (bytevector #x41))))
;; TEST vector
(assert (equal? #(1 2 3) (vector 1 2 3)))
;; TEST vector->list
(assert (equal? '(1 2 3) (vector->list #(1 2 3))))
;; TEST vector->list start
(assert (equal? '(1 2 3) (vector->list #(5 1 2 3) 1)))
;; TEST vector->list start and end
(assert (equal? '(1 2 3) (vector->list #(5 1 2 3 6) 1 4)))
;; TEST vector->string
(assert (string=? "foo" (vector->string #(#\f #\o #\o))))
;; TEST vector->string start
(assert (string=? "foo" (vector->string #(#\x #\f #\o #\o) 1)))
;; TEST vector->string start and end
(assert (string=? "foo" (vector->string #(#\x #\f #\o #\o #\x) 1 4)))
;; TEST vector-append
(assert (equal? #(1 2 3 4) (vector-append #(1 2) #(3 4))))
;; TEST vector-copy
(assert (let ((v #(1 2 3))) (and (equal? v (vector-copy v)) (not (eq? v (vector-copy v))))))
;; TEST vector-copy start
(assert (let ((v #(5 1 2 3))) (equal? #(1 2 3) (vector-copy v 1))))
;; TEST vector-copy start and end
(assert (let ((v #(5 1 2 3 5))) (equal? #(1 2 3) (vector-copy v 1 4))))
;; TEST vector-copy!
(define v (make-vector 3)) (vector-copy! v 0 #(1 2 3)) (assert (equal? #(1 2 3) v))
;; TEST vector-copy! start
(define v (make-vector 3 #\x)) (vector-copy! v 0 #(5 1 2 3) 1) (assert (equal? #(1 2 3) v))
;; TEST vector-copy! start and end
(define v (make-vector 3 #\x)) (vector-copy! v 0 #(5 1 2 3 4) 1 4) (assert (equal? #(1 2 3) v))
;; TEST vector-fill!
(define v (make-vector 3 0)) (vector-fill! v 1) (assert (equal? #(1 1 1) v))
;; TEST vector-fill! start
(define v (make-vector 3 0)) (vector-fill! v 1 1) (assert (equal? #(0 1 1) v))
;; TEST vector-fill! start and end
(define v (make-vector 3 0)) (vector-fill! v 1 1 2) (assert (equal? #(0 1 0) v))
;; TEST vector-for-each 2 vectors, different length
(let ((v '())) (vector-for-each (lambda (a b) (set! v (cons (+ a b) v))) #(1 2 3 4 5) #(1 2 3 4 5 6)) (assert (equal? '(10 8 6 4 2) v)))
;; TEST vector-length
(assert (= 5 (vector-length #(1 2 3 4 5))))
;; TEST vector-map 1 vector
(assert (equal? #(1 2 3) (vector-map (lambda (x) (+ x 1)) #(0 1 2))))
;; TEST vector-map 2 vectors, different length
(assert (equal? #(5 7 9) (vector-map + #(1 2 3) #(4 5 6 7))))
;; TEST vector-ref
(assert (= 3 (vector-ref #(1 2 3 4 5) 2)))
;; TEST vector-set!
(define v (vector 1 2 3)) (vector-set! v 0 5) (assert (= 5 (vector-ref v 0)))
;; TEST vector?
(assert (vector? #(1 2 3)))
;; TEST when
(when #f (assert #f))
(when #t (assert #t))
;; with-exception-handler is missing
;; write-bytevector is missing
;; write-char is missing
;; write-string is missing
;; write-u8 is missing
;; TEST zero?
(assert (zero? 0))
;; TEST literals cons
(assert '(1 . 2))
;; TEST literals list
(assert '(1 2 3 4 5))
;; TEST literals chars
(assert (list #\alarm #\backspace #\delete #\escape #\newline #\null #\return #\space #\tab))
;; TEST literal string
(assert "foobar\a\b\t\n\r\"\\\|\x12;")
;; TEST literals boolean
(assert (eq? #t #true))
(assert (eq? #f #false))

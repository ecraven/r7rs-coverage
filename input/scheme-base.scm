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
;; ... is missing here
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
(assert (eq? 'c (case (car '(c d)) ((a e i o y) 'vowel) ((w j) 'semivowel) (else => (lambda (x) x)))))
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
;; TEST char-ready?
(let ((x (open-input-string "foobar"))) (assert (char-ready? x)))
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
;; TEST close-input-port
(let ((p (open-input-string "foobar"))) (assert (eq? (read p) 'foobar)) (close-input-port p))
;; TEST close-output-port
(let ((p (open-output-string))) (write "foobar" p) (close-output-port p))
;; TEST close-port
(let ((p (open-output-string))) (write "foobar" p) (close-port p))
;; TEST complex?
(assert (not (complex? 'a))) (assert (complex? 3))
(assert (complex? 3+1i))
;; TEST cond else
(assert (= 1 (cond ((= 0 1) 0) (else 1))))
;; TEST cond =>
(assert (= 2 (cond ((assq 'b '((a 1) (b 2))) => cadr) (else #f))))
;; TEST cond-expand else
(cond-expand (else (assert #t)))
;; TEST cond-expand r7rs
(cond-expand (r7rs (assert #t)))
;; TEST cond-expand library scheme base
(cond-expand ((library (scheme base)) (assert #t)))
;; TEST cond-expand or
(cond-expand ((or (library (scheme base))) (assert #t)) (else (assert #f)))
;; TEST cond-expand and
(cond-expand ((and (library (scheme base))) (assert #t)) (else (assert #f)))
;; TEST cond-expand not
(cond-expand ((not (library (lets-hope-no-one-defines-a-library-like-this))) (assert #t)) (else (assert #f)))
;; TEST cons
(assert (equal? '(1 . 2) (cons 1 2)))
;; TEST current-error-port
(assert (current-error-port))
;; TEST current-input-port
(assert (current-input-port))
;; TEST current-output-port
(assert (current-output-port))
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
;; TEST define-record-type
(define-record-type <pare> (kons x y) pare? (x kar set-kar!) (y kdr))
(define p (kons 1 2)) (assert p) (assert (pare? p)) (assert (= 1 (kar p))) (assert (= 2 (kdr p))) (set-kar! p 3) (assert (= 3 (kar p)))
;; TEST define-syntax
(define-syntax push! (syntax-rules () ((push! el lst) (set! lst (cons el lst))))) (define l '(1 2 3)) (push! 'a l) (assert (eq? (car l) 'a))
;; TEST define-values
(define-values (x y) (values 1 2)) (assert (= x 1)) (assert (= y 2))
;; TEST denominator
(assert (= 17 (denominator 5/17)))
;; TEST do
(assert (= 25 (let ((x '(1 3 5 7 9))) (do ((x x (cdr x)) (sum 0 (+ sum (car x)))) ((null? x) sum)))))
;; TEST dynamic-wind
(let ((o '())) (assert (equal? '(3 2 1) (begin (dynamic-wind (lambda () (set! o (cons 1 o))) (lambda () (set! o (cons 2 o))) (lambda () (set! o (cons 3 o)))) o))))
;; else is missing here
;; TEST eof-object
(assert (eof-object)) (assert (eof-object? (eof-object)))
;; TEST eof-object?
(assert (eof-object? (read-char (open-input-string ""))))
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
;; TEST equal? symbols
(assert (equal? 'a 'a))
;; TEST equal? lists
(assert (equal? '(a) '(a)))
(assert (equal? '(a b c) '(a b c)))
;; TEST equals? strings
(assert (equal? "abc" "abc"))
;; TEST equals? vectors
(assert (equal? (make-vector 5 'a) (make-vector 5 'a)))
;; TEST equals? cyclic list with set-cdr
(define l0 (cons 'a 'b)) (set-cdr! l0 l0)
(define l1 (cons 'a 'b)) (set-cdr! l1 l1)
(assert (equal? l0 l1))
;; TEST equals? cyclic list literal
(assert (equal? '#1=(a b . #1#) '#2= (a b a b . #2#)))
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
;; TEST error
(assert (error-object? (call/cc (lambda (k) (with-exception-handler (lambda (c) (k c)) (lambda () (error "foo")))))))
;; TEST error-object-irritants
(assert (equal? (list "bar" "baaz") (error-object-irritants (call/cc (lambda (k) (with-exception-handler (lambda (c) (k c)) (lambda () (error "foo" "bar" "baaz"))))))))
;; TEST error-object-message
(assert (string=? "foo" (error-object-message (call/cc (lambda (k) (with-exception-handler (lambda (c) (k c)) (lambda () (error "foo" "bar" "baaz"))))))))
;; TEST error-object?
(assert (error-object? (call/cc (lambda (k) (with-exception-handler (lambda (c) (k c)) (lambda () (error "foo")))))))
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
;; TEST features
(assert (memq 'r7rs (features)))
;; TEST file-error?
(list file-error?)
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
;; TEST flush-output-port
(list flush-output-port)
;; TEST for-each 1 list
(define x 0) (for-each (lambda (o) (set! x (+ x o))) '(1 2 3 4)) (assert (= x 10))
;; TEST for-each 2 lists, different length
(define x 0) (for-each (lambda (a b c) (set! x (+ x (+ a b c)))) '(1 2 3 4) '(1 2) '(1 2 3)) (assert (= x 9))
;; TEST gcd
(assert (= 782 (gcd 72726 17986)))
;; TEST get-output-bytevector
(assert (equal? (bytevector) (let ((o (open-output-bytevector))) (get-output-bytevector o))))
;; TEST get-output-string
(assert (string=? "" (let ((o (open-output-string))) (get-output-string o)))) ;; cannot (display "foo" o), no write/display without (scheme write)
;; TEST guard
(assert (= 42 (guard (condition ((assq 'a condition) => cdr) ((assq 'b condition))) (raise (list (cons 'a 42))))))
(assert (equal? '(b . 23) (guard (condition ((assq 'a condition) => cdr) ((assq 'b condition))) (raise (list (cons 'b 23))))))
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
;; TEST input-port-open?
(let ((p (open-input-string "foo"))) (assert (input-port-open? p)) (close-input-port p) (assert (not (input-port-open? p))))
;; TEST input-port?
(let ((p (open-input-string "foo"))) (assert (input-port? p)))
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
;; TEST let-syntax
(assert (eq? 'now (let-syntax ((given-that (syntax-rules () ((given-that test stmt1 stmt2 ...) (if test (begin stmt1 stmt2 ...))))))
                    (let ((if #t))
                      (given-that if (set! if 'now))
                      if))))
(assert (eq? 'outer (let ((x 'outer)) (let-syntax ((m (syntax-rules () ((m) x)))) (let ((x 'inner)) (m))))))
;; TEST let-values multiple values
(assert (= 35 (let-values (((a b) (values 7 5))) (* a b))))
;; TEST let-values single list
(let-values ((x (values 7 5))) (assert (equal? '(7 5) x)))
;; TEST letrec
(assert (letrec ((even? (lambda (n) (if (zero? n) #t (odd? (- n 1))))) (odd? (lambda (n) (if (zero? n) #f (even? (- n 1)))))) (even? 88)))
;; TEST letrec*
(assert (= 5 (letrec* ((p (lambda (x) (+ 1 (q (- x 1))))) (q (lambda (y) (if (zero? y) 0 (+ 1 (p (- y 1)))))) (x (p 5)) (y x)) y)))
;; TEST letrec-syntax
(assert (= 7 (letrec-syntax ((my-or (syntax-rules () ((my-or) #f) ((my-or e) e) ((my-or e1 e2 ...) (let ((temp e1)) (if temp temp (my-or e2 ...)))))))
               (let ((x #f) (y 7) (temp 8) (let odd?) (if even?)) (my-or x (let temp) (if y) y)))))
;; TEST list
(assert (equal? '(1 2 3) (list 1 2 3)))
(assert (equal? '() (list)))
;; TEST list->string
(assert (string=? "foo" (list->string '(#\f #\o #\o))))
;; TEST list->vector
(assert (equal? (vector 1 2 3) (list->vector '(1 2 3))))
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
;; TEST modulo
(assert (= -2 (modulo 10 -3)))
;; TEST negative?
(assert (negative? -1))
;; TEST newline
(assert (string=? "\n" (let ((p (open-output-string))) (newline p) (get-output-string p))))
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
(assert (string=? "89" (number->string 137 16))) ;; don't generate letters, A vs. a
(assert (string=? "123" (number->string 123 10)))
;; TEST number?
(assert (number? 3))
(assert (not (number? 'a)))
;; TEST numerator
(assert (= 5 (numerator 5/17)))
;; TEST odd?
(assert (odd? 3))
;; TEST open-input-bytevector
(let ((p (open-input-bytevector (bytevector 1 2 3)))) (assert (input-port? p)))
;; TEST open-input-string
(let ((p (open-input-string "foo"))) (assert (input-port? p)))
;; TEST open-output-bytevector
(let ((p (open-output-bytevector))) (assert (output-port? p)))
;; TEST open-output-string
(let ((p (open-output-string))) (assert (output-port? p)))
;; TEST or no forms
(assert (not (or)))
;; TEST or short-circuit
(assert (or #f #t (/ 1 0)))
;; TEST output-port-open?
(let ((p (open-output-string))) (assert (output-port-open? p)) (close-output-port p) (assert (not (output-port-open? p))))
;; TEST output-port?
(let ((p (open-output-string))) (assert (output-port? p)))
;; TEST pair?
(assert (pair? '(1 . 2)))
(assert (not (pair? 'b)))
;; TEST parameterize simple
(define p (make-parameter 0)) (assert (= (p) 0)) (parameterize ((p 5)) (assert (= (p) 5)))
;; TEST parameterize nested
(define p (make-parameter 0)) (assert (= (p) 0)) (parameterize ((p 5)) (parameterize ((p 7)) (assert (= (p) 7))))
;; TEST peek-char
(assert (char=? #\a (peek-char (open-input-string "abc"))))
;; TEST peek-u8
(assert (= 123 (peek-u8 (open-input-bytevector (bytevector 123 234 34)))))
;; TEST port?
(assert (port? (current-output-port)))
;; TEST positive?
(assert (positive? 1))
;; TEST procedure?
(assert (procedure? procedure?))
;; TEST quasiquote
(assert (equal? (quasiquote (1 2 3)) `(1 2 3)))
(assert (equal? '(1 2 3) `(1 ,(+ 1 1) ,(+ 1 2))))
;; TEST quote
(assert (eq? 'foo (quote foo)))
;; TEST quotient
(assert (= -3 (quotient 10 -3)))
;; TEST raise
(assert (= 42 (guard (condition ((assq 'a condition) => cdr) ((assq 'b condition))) (raise (list (cons 'a 42))))))
;; TEST raise-continuable
(define p (open-output-string)) (assert (= 65 (with-exception-handler (lambda (con) (cond ((string? con) (display con p)) (else (display "a warning has been issued" p))) 42) (lambda () (+ (raise-continuable "should be a number") 23))))) (assert (string=? "should be a number" (get-output-string p)))
;; TEST rational?
(assert (rational? 3/4))
;; TEST rationalize
(assert (= 1/3 (rationalize (exact .3) 1/10)))
(assert (= #i1/3 (rationalize .3 1/10)))
;; read-bytevector one argument
(assert (equal? (bytevector 1 2 3) (parameterize ((current-input-port (open-input-bytevector (bytevector 1 2 3 4 5)))) (read-bytevector 3))))
;; read-bytevector two arguments
(assert (equal? (bytevector 1 2 3) (read-bytevector 3 (open-input-bytevector (bytevector 1 2 3 4 5)))))
;; TEST read-bytevector! one parameter
(define bv (make-bytevector 3 0))
(assert (= 3 (parameterize ((current-input-port (open-input-bytevector (bytevector 1 2 3)))) (read-bytevector! bv))))
(assert (equal? (bytevector 1 2 3) bv))
;; TEST read-bytevector! two parameters
(define bv (make-bytevector 3 0))
(assert (= 3 (read-bytevector! bv (open-input-bytevector (bytevector 1 2 3)))))
(assert (equal? (bytevector 1 2 3) bv))
;; TEST read-bytevector! three parameters
(define bv (make-bytevector 3 0))
(assert (= 2 (read-bytevector! bv (open-input-bytevector (bytevector 1 2 3)) 1)))
(assert (equal? (bytevector 0 1 2) bv))
;; TEST read-bytevector! four parameters
(define bv (make-bytevector 3 0))
(assert (= 1 (read-bytevector! bv (open-input-bytevector (bytevector 1 2 3)) 1 2)))
(assert (equal? (bytevector 0 1 0) bv))
;; TEST read-char no arguments
(assert (char=? #\f (parameterize ((current-input-port (open-input-string "foobar"))) (read-char))))
;; TEST read-char one argument
(assert (char=? #\f (read-char (open-input-string "foobar"))))
;; TEST read-error?
(list read-error?)
;; TEST read-line no arguments
(assert (string=? "foobar" (parameterize ((current-input-port (open-input-string "foobar\nbaaz\n"))) (read-line))))
;; TEST read-line one argument
(assert (string=? "foobar" (read-line (open-input-string "foobar\nbaaz\n"))))
;; read-string one argument
(assert (equal? "foo" (parameterize ((current-input-port (open-input-string "foobar"))) (read-string 3))))
;; read-string two arguments
(assert (equal? "foo" (read-string 3 (open-input-string "foobar"))))
;; TEST read-u8 no arguments
(assert (= 1 (parameterize ((current-input-port (open-input-bytevector (bytevector 1 2 3)))) (read-u8))))
;; TEST read-u8 one argument
(assert (= 2 (read-u8 (open-input-bytevector (bytevector 2 3 4)))))
;; TEST real?
(assert (real? 3.14))
;; TEST remainder
(assert (= 1 (remainder 10 -3)))
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
(assert (equal? (vector #\f #\o #\o) (string->vector "foo")))
;; TEST string->vector start
(assert (equal? (vector #\f #\o #\o) (string->vector "xfoo" 1)))
;; TEST string->vector start and end
(assert (equal? (vector #\f #\o #\o) (string->vector "xfoox" 1 4)))
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
;; TEST syntax-rules
(define-syntax push! (syntax-rules () ((push! el lst) (set! lst (cons el lst))))) (define l '(1 2 3)) (push! 'a l) (assert (eq? (car l) 'a))
;; TEST textual-port?
(list textual-port?)
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
;; TEST u8-ready?
(let ((x (open-input-bytevector (bytevector 1 2 3)))) (assert (u8-ready? x)))
;; TEST unless
(unless #f "foo" 'ok)
;; TEST unquote
(assert (equal? '(1 2 3) (quasiquote (1 (unquote (+ 1 1)) ,(+ 1 2)))))
;; TEST unquote-splicing
(assert (equal? '(1 + 1 1 1 2) (quasiquote (1 (unquote-splicing '(+ 1 1)) ,@(list 1 2)))))
;; TEST utf8->string
(assert (equal? "A" (utf8->string (bytevector #x41))))
;; TEST vector
(assert (equal? (vector 1 2 3) (vector 1 2 3)))
;; TEST vector->list
(assert (equal? '(1 2 3) (vector->list (vector 1 2 3))))
;; TEST vector->list start
(assert (equal? '(1 2 3) (vector->list (vector 5 1 2 3) 1)))
;; TEST vector->list start and end
(assert (equal? '(1 2 3) (vector->list (vector 5 1 2 3 6) 1 4)))
;; TEST vector->string
(assert (string=? "foo" (vector->string (vector #\f #\o #\o))))
;; TEST vector->string start
(assert (string=? "foo" (vector->string (vector #\x #\f #\o #\o) 1)))
;; TEST vector->string start and end
(assert (string=? "foo" (vector->string (vector #\x #\f #\o #\o #\x) 1 4)))
;; TEST vector-append
(assert (equal? (vector 1 2 3 4) (vector-append (vector 1 2) (vector 3 4))))
;; TEST vector-copy
(assert (let ((v (vector 1 2 3))) (and (equal? v (vector-copy v)) (not (eq? v (vector-copy v))))))
;; TEST vector-copy start
(assert (let ((v (vector 5 1 2 3))) (equal? (vector 1 2 3) (vector-copy v 1))))
;; TEST vector-copy start and end
(assert (let ((v (vector 5 1 2 3 5))) (equal? (vector 1 2 3) (vector-copy v 1 4))))
;; TEST vector-copy!
(define v (make-vector 3)) (vector-copy! v 0 (vector 1 2 3)) (assert (equal? (vector 1 2 3) v))
;; TEST vector-copy! start
(define v (make-vector 3 #\x)) (vector-copy! v 0 (vector 5 1 2 3) 1) (assert (equal? (vector 1 2 3) v))
;; TEST vector-copy! start and end
(define v (make-vector 3 #\x)) (vector-copy! v 0 (vector 5 1 2 3 4) 1 4) (assert (equal? (vector 1 2 3) v))
;; TEST vector-fill!
(define v (make-vector 3 0)) (vector-fill! v 1) (assert (equal? (vector 1 1 1) v))
;; TEST vector-fill! start
(define v (make-vector 3 0)) (vector-fill! v 1 1) (assert (equal? (vector 0 1 1) v))
;; TEST vector-fill! start and end
(define v (make-vector 3 0)) (vector-fill! v 1 1 2) (assert (equal? (vector 0 1 0) v))
;; TEST vector-for-each 2 vectors, different length
(let ((v '())) (vector-for-each (lambda (a b) (set! v (cons (+ a b) v))) (vector 1 2 3 4 5) (vector 1 2 3 4 5 6)) (assert (equal? '(10 8 6 4 2) v)))
;; TEST vector-length
(assert (= 5 (vector-length (vector 1 2 3 4 5))))
;; TEST vector-map 1 vector
(assert (equal? (vector 1 2 3) (vector-map (lambda (x) (+ x 1)) (vector 0 1 2))))
;; TEST vector-map 2 vectors, different length
(assert (equal? (vector 5 7 9) (vector-map + (vector 1 2 3) (vector 4 5 6 7))))
;; TEST vector-ref
(assert (= 3 (vector-ref (vector 1 2 3 4 5) 2)))
;; TEST vector-set!
(define v (vector 1 2 3)) (vector-set! v 0 5) (assert (= 5 (vector-ref v 0)))
;; TEST vector?
(assert (vector? (vector 1 2 3)))
;; TEST when
(when #f (assert #f))
(when #t (assert #t))
;; TEST with-exception-handler
(assert (call/cc (lambda (k) (with-exception-handler (lambda (c) (k c)) (lambda () (error 3))))))
;; TEST write-bytevector one parameter
(assert (equal? (bytevector 1 2 3) (let ((p (open-output-bytevector))) (parameterize ((current-output-port p)) (write-bytevector (bytevector 1 2 3))) (get-output-bytevector p))))
;; TEST write-bytevector two parameters
(assert (equal? (bytevector 1 2 3) (let ((p (open-output-bytevector))) (write-bytevector (bytevector 1 2 3) p) (get-output-bytevector p))))
;; TEST write-bytevector three parameters
(assert (equal? (bytevector 2 3) (let ((p (open-output-bytevector))) (write-bytevector (bytevector 1 2 3) p 1) (get-output-bytevector p))))
;; TEST write-bytevector four parameters
(assert (equal? (bytevector 2) (let ((p (open-output-bytevector))) (write-bytevector (bytevector 1 2 3) p 1 2) (get-output-bytevector p))))
;; TEST write-char
(let ((p (open-output-string))) (write-char #\x p) (assert (char=? #\x (string-ref (get-output-string p) 0))))
;; TEST write-string one parameter
(assert (equal? "foo" (let ((p (open-output-string))) (parameterize ((current-output-port p)) (write-string "foo")) (get-output-string p))))
;; TEST write-string two parameters
(assert (equal? "foo" (let ((p (open-output-string))) (write-string "foo" p) (get-output-string p))))
;; TEST write-string three parameters
(assert (equal? "oo" (let ((p (open-output-string))) (write-string "foo" p 1) (get-output-string p))))
;; TEST write-string four parameters
(assert (equal? "o" (let ((p (open-output-string))) (write-string "foo" p 1 2) (get-output-string p))))
;; TEST write-u8
(let ((p (open-output-bytevector))) (write-u8 123 p) (assert (= 123 (bytevector-u8-ref (get-output-bytevector p) 0))))
;; TEST zero?
(assert (zero? 0))

;; TEST literals pair
(assert (equal? (cons 1 2) '(1 . 2)))
;; TEST literals list
(assert (equal? (list 1 2 3 4 5) '(1 2 3 4 5)))
;; TEST literals improper list
(assert '(1 2 3 4 . 5))
;; TEST literals unquoted bytevector
(assert #u8(1 2 3 4 5))
;; TEST literals quoted bytevector
(assert '#u8(1 2 3 4 5))
;; TEST literals unquoted vector
(assert #(1 2 3 4 5))
;; TEST literals quoted vector
(assert '#(1 2 3 4 5))
;; TEST literals cyclic list
(assert (eq? 'a (car '#1=(a b . #1#))))
;; TEST literals named char alarm
(assert (list #\alarm))
;; TEST literals named char backspace
(assert (list #\backspace))
;; TEST literals named char delete
(assert (list #\delete))
;; TEST literals named char escape
(assert (list #\escape))
;; TEST literals named char newline
(assert (list #\newline))
;; TEST literals named char null
(assert (list #\null))
;; TEST literals named char return
(assert (list #\return))
;; TEST literals named char space
(assert (list #\space))
;; TEST literals named char tab
(assert (list #\tab))
;; TEST literals basic chars
(assert (list #\a #\0 #\-))
;; TEST literal string
(assert "foobar")
;; TEST literal string escape alarm
(assert "\a")
;; TEST literal string escape backspace
(assert "\b")
;; TEST literal string escape tab
(assert "\t")
;; TEST literal string escape linefeed
(assert "\n")
;; TEST literal string escape return
(assert "\r")
;; TEST literal string escape double quote
(assert "\"")
;; TEST literal string escape backslash
(assert "\\")
;; TEST literal string escape vertical line 
(assert "\|")
;; TEST literal string with char hex escape
(assert "\x12;")
;; TEST literals boolean #t and #f
(assert #t)
(assert (not #f))
;; TEST literals boolean #true and #false
(assert #true)
(assert (not #false))

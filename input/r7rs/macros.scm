(assert (= 1 (cond ((= 0 1) 0) (else 1))))
;; TEST
(assert (= 2 (cond ((assq 'b '((a 1) (b 2))) => cadr) (else #f))))
;; TEST
(assert (= 1 (case 'a ((b) 3) ((a f) 1) (else 2))))
;; TEST
(assert (eq? 'c (case (car '(c d)) ((a e i o y) 'vowel) ((w y) 'semivowel) (else => (lambda (x) x)))))
;; TEST
(assert (and))
;; TEST
(assert (not (and #t #f (/ 1 0))))
;; TEST
(assert (not (or)))
;; TEST
(assert (or #f #t (/ 1 0)))
;; TEST
(when #t "foo" 'ok)
;; TEST
(unless #f "foo" 'ok)
;; TEST
(assert (= 6 (let ((x 2) (y 3)) (* x y))))
;; TEST
(assert (= 1 (let () 1)))
;; TEST
(assert (= 6 (let* ((x 2) (y (+ x 1))) (* x y))))
;; TEST
(assert (letrec ((even? (lambda (n) (if (zero? n) #t (odd? (- n 1))))) (odd? (lambda (n) (if (zero? n) #f (even? (- n 1)))))) (even? 88)))
;; TEST
(assert (= 5 (letrec* ((p (lambda (x) (+ 1 (q (- x 1))))) (q (lambda (y) (if (zero? y) 0 (+ 1 (p (- y 1)))))) (x (p 5)) (y x)) y)))
;; TEST
(assert (= 35 (let-values (((a b) (values 7 5))) (* a b))))
;; TEST
(assert (equal? '(x y x y) (let ((a 'a) (b 'b) (x 'x) (y 'y)) (let*-values (((a b) (values x y)) ((x y) (values a b))) (list a b x y)))))
;; TEST
(assert (= 5 (begin 3 5)))
;; TEST
(assert (= 25 (let ((x '(1 3 5 7 9))) (do ((x x (cdr x)) (sum 0 (+ sum (car x)))) ((null? x) sum)))))
;; TEST
(assert (= 10 (let loop ((lst '(1 2 3 4)) (sum 0)) (if (null? lst) sum (loop (cdr lst) (+ sum (car lst)))))))

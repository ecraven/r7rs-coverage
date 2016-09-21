(define x 3) (assert (= 3 x))
;; TEST
(define (f x) 3) (assert (= 3 (f 3)))
;; TEST
(define (f a b c) 3) (assert (= 3 (f 1 2 3)))
;; TEST
(define (f a b . c) c) (assert (equal? '(3 4 5) (f 1 2 3 4 5)))
;; TEST
(define (f . c) c) (assert (equal? '(1 2 3) (f 1 2 3)))

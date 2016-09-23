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

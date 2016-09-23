;; TEST set!
(define x 3) (set! x 5) (assert (= x 5))
;; TEST lambda
(assert (= 5 ((lambda (x) x) 5)))
;; TEST lambda rest
(assert (equal? '(5) ((lambda (x . y) y) 3 5)))
;; TEST lambda only rest
(assert (equal? '(3 5) ((lambda x x) 3 5)))
;; TEST if
(assert (= 0 (if #t 0 1)))
(assert (= 1 (if #f 0 1)))
;; TEST if no else
(assert (= 1 (if #t 1)))

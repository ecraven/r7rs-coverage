(define x 3) (set! x 5) (assert (= x 5))
;; TEST
(assert (= 5 ((lambda (x) x) 5)))
;; TEST
(assert (equal? '(5) ((lambda (x . y) y) 3 5)))
;; TEST
(assert (equal? '(3 5) ((lambda x x) 3 5)))
;; TEST
(assert (= 0 (if #t 0 1)))
;; TEST
(assert (= 1 (if #f 0 1)))
;; TEST
(assert (= 1 (if #t 1)))


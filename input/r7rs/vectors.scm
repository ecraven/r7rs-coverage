(assert (vector? #(1 2 3)))
;; TEST
(assert (= 2 (vector-length (make-vector 2))))
;; TEST
(assert (= 3 (vector-ref (make-vector 5 3) 0)))
;; TEST
(assert (equal? #(1 2 3) (vector 1 2 3)))
;; TEST
(assert (= 5 (vector-length #(1 2 3 4 5))))
;; TEST
(assert (= 3 (vector-ref #(1 2 3 4 5) 2)))
;; TEST
(define v (vector 1 2 3)) (vector-set! v 0 5) (assert (= 5 (vector-ref v 0)))
;; TEST
(assert (equal? '(1 2 3) (vector->list #(1 2 3))))
;; TEST
(assert (equal? '(1 2 3) (vector->list #(5 1 2 3) 1)))
;; TEST
(assert (equal? '(1 2 3) (vector->list #(5 1 2 3 6) 1 4)))
;; TEST
(assert (equal? #(1 2 3) (list->vector '(1 2 3))))
;; TEST
(assert (string=? "foo" (vector->string #(#\f #\o #\o))))
;; TEST
(assert (string=? "foo" (vector->string #(#\x #\f #\o #\o) 1)))
;; TEST
(assert (string=? "foo" (vector->string #(#\x #\f #\o #\o #\x) 1 4)))
;; TEST
(assert (equal? #(#\f #\o #\o) (string->vector "foo")))
;; TEST
(assert (equal? #(#\f #\o #\o) (string->vector "xfoo" 1)))
;; TEST
(assert (equal? #(#\f #\o #\o) (string->vector "xfoox" 1 4)))

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
;; TEST
(assert (let ((v #(1 2 3))) (and (equal? v (vector-copy v)) (not (eq? v (vector-copy v))))))
;; TEST
(assert (let ((v #(5 1 2 3))) (equal? #(1 2 3) (vector-copy v 1))))
;; TEST
(assert (let ((v #(5 1 2 3 5))) (equal? #(1 2 3) (vector-copy v 1 4))))
;; TEST
(define v (make-vector 3)) (vector-copy! v 0 #(1 2 3)) (assert (equal? #(1 2 3) v))
;; TEST
(define v (make-vector 3 #\x)) (vector-copy! v 0 #(5 1 2 3) 1) (assert (equal? #(1 2 3) v))
;; TEST
(define v (make-vector 3 #\x)) (vector-copy! v 0 #(5 1 2 3 4) 1 4) (assert (equal? #(1 2 3) v))
;; TEST
(assert (equal? #(1 2 3 4) (vector-append #(1 2) #(3 4))))
;; TEST
(define v (make-vector 3 0)) (vector-fill! v 1) (assert (equal? #(1 1 1) v))
;; TEST
(define v (make-vector 3 0)) (vector-fill! v 1 1) (assert (equal? #(0 1 1) v))
;; TEST
(define v (make-vector 3 0)) (vector-fill! v 1 1 2) (assert (equal? #(0 1 0) v))

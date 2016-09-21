(assert (eqv? #t #t))
;; TEST
(assert (eqv? #f #f))
;; TEST
(assert (eqv? 'a 'a))
;; TEST
(assert (eqv? 3 3))
;; TEST
(assert (eqv? 3.0 3.0))
;; TEST
(assert (eqv? #\a #\a))
;; TEST
(assert (eqv? '() '()))
;; TEST
(let ((x (cons 1 2))) (assert (eqv? x x)))
;; TEST
(let ((x (make-vector 5))) (assert (eqv? x x)))
;; TEST
(let ((x (make-string 4))) (assert (eqv? x x)))
;; TEST
(let ((x (make-bytevector 4))) (assert (eqv? x x)))
;; TEST
(assert (eqv? + +))
;; TEST
(assert (not (eqv? #t #f)))
;; TEST
(assert (not (eqv? 'a 'b)))
;; TEST
(assert (not (eqv? 3 3.0)))
;; TEST
(assert (not (eqv? 3 4)))
;; TEST
(assert (not (eqv? #\a #\b)))
;; TEST
(assert (not (eqv? '() '(1))))
;; TEST
(let ((a (make-list 3)) (b (make-list 3))) (assert (not (eqv? a b))))
;; TEST
(let ((a (make-vector 3)) (b (make-vector 3))) (assert (not (eqv? a b))))
;; TEST
(let ((a (make-string 3)) (b (make-string 3))) (assert (not (eqv? a b))))
;; TEST
(let ((a (make-bytevector 3)) (b (make-bytevector 3))) (assert (not (eqv? a b))))
;; TEST
(assert (eq? 'a 'a))
;; TEST
(assert (not (eq? (list 'a) (list 'a))))
;; TEST
(assert (eq? '() '()))
;; TEST
(assert (eq? car car))
;; TEST
(let ((x (make-vector 3))) (eq? x x))
;; TEST
(let ((x (lambda (x) (+ x 1)))) (eq? x x))

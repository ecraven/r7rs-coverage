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
;; TEST eq? symbols
(assert (eq? 'a 'a))
;; TEST eq? different lists
(assert (not (eq? (list 'a) (list 'a))))
;; TEST eq? null
(assert (eq? '() '()))
;; TEST eq? function
(assert (eq? car car))
;; TEST eq? vector
(let ((x (make-vector 3))) (eq? x x))
;; TEST eq? same function
(let ((x (lambda (x) (+ x 1)))) (eq? x x))

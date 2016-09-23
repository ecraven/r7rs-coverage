;; TEST delay
(assert (= (force (delay (+ 1 2))) 3))
;; TEST force
(assert (equal? '(3 3) (let ((p (delay (+ 1 2)))) (list (force p) (force p)))))
(define integers (letrec ((next (lambda (n) (delay (cons n (next (+ n 1))))))) (next 0))) (define head (lambda (stream) (car (force stream)))) (define tail (lambda (stream) (cdr (force stream)))) (assert (= 2 (head (tail (tail integers)))))
;; TEST promise?
(assert (promise? (delay 3)))
;; TEST make-promise
(assert (promise? (make-promise 3)))
(assert (= 3 (force (make-promise 3))))
;; TEST delay-force
(assert (promise? (delay-force 3)))

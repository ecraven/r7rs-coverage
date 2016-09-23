;; TEST make-parameter
(define p (make-parameter 3))
;; TEST make-parameter converter
(define p (make-parameter 3 (lambda (x) (+ x 1)))) (assert (= (p) 4))
;; TEST parameterize
(define p (make-parameter 0)) (assert (= (p) 0)) (parameterize ((p 5)) (assert (= (p) 5)))
(define p (make-parameter 0)) (assert (= (p) 0)) (parameterize ((p 5)) (parameterize ((p 7)) (assert (= (p) 7))))

(assert (procedure? procedure?))
;; TEST
(assert (= 3 (apply + '(1 2))))
(assert (= 10 (apply + 1 2 3 '(4))))
;; TEST
(assert (equal? '(1 2 3) (map (lambda (x) (+ x 1)) '(0 1 2))))
;; TEST
(assert (equal? '(0 2 4) (map + '(0 1 2) '(0 1 2))))
;; TEST
(assert (equal? '(0 3 6) (map + '(0 1 2) '(0 1 2) '(0 1 2))))
;; TEST
(assert (string=? "ABC" (string-map char-upcase "abc")))
;; TEST
(assert (string=? "StUdLyCaPs" (string-map (lambda (c k) ((if (eqv? k #\u) char-upcase char-downcase) c)) "studlycaps xxx" "ululululul")))
;; TEST
(assert (equal? #(1 2 3) (vector-map (lambda (x) (+ x 1)) #(0 1 2))))
;; TEST
(assert (equal? #(5 7 9) (vector-map + #(1 2 3) #(4 5 6 7))))
;; TEST
(define x 0) (for-each (lambda (o) (set! x (+ x o))) '(1 2 3 4)) (assert (= x 10))
;; TEST
(define x 0) (for-each (lambda (a b c) (set! x (+ x (+ a b c)))) '(1 2 3 4) '(1 2) '(1 2 3)) (assert (= x 9))
;; TEST
(let ((v '())) (string-for-each (lambda (c x) (set! v (cons (char->integer c) v))) "abcde" "abcdef") (assert (equal? '(101 100 99 98 97) v)))
;; TEST
(let ((v '())) (vector-for-each (lambda (a b) (set! v (cons (+ a b) v))) #(1 2 3 4 5) #(1 2 3 4 5 6)) (assert (equal? '(10 8 6 4 2) v)))
;; TEST
(assert (= -3 (call-with-current-continuation (lambda (exit) (for-each (lambda (x) (if (negative? x) (exit x))) '(54 0 37 -3 245 19)) #t))))
;; TEST
(call/cc (lambda (k) k))
;; TEST
(assert (= 5 (call-with-values (lambda () (values 4 5)) (lambda (a b) b))))
;; TODO: dynamic wind

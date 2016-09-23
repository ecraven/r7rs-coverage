;; TEST procedure?
(assert (procedure? procedure?))
;; TEST apply
(assert (= 3 (apply + '(1 2))))
(assert (= 10 (apply + 1 2 3 '(4))))
;; TEST map 1 list
(assert (equal? '(1 2 3) (map (lambda (x) (+ x 1)) '(0 1 2))))
;; TEST map 2 lists
(assert (equal? '(0 2 4) (map + '(0 1 2) '(0 1 2))))
;; TEST map 3 lists, different length
(assert (equal? '(0 3 6) (map + '(0 1 2) '(0 1 2) '(0 1 2 3))))
;; TEST string-map 1 string
(assert (string=? "ABC" (string-map char-upcase "abc")))
;; TEST string-map 2 strings, different length
(assert (string=? "StUdLyCaPs" (string-map (lambda (c k) ((if (eqv? k #\u) char-upcase char-downcase) c)) "studlycaps xxx" "ululululul")))
;; TEST vector-map 1 vector
(assert (equal? #(1 2 3) (vector-map (lambda (x) (+ x 1)) #(0 1 2))))
;; TEST vector-map 2 vectors, different length
(assert (equal? #(5 7 9) (vector-map + #(1 2 3) #(4 5 6 7))))
;; TEST for-each 1 list
(define x 0) (for-each (lambda (o) (set! x (+ x o))) '(1 2 3 4)) (assert (= x 10))
;; TEST for-each 2 lists, different length
(define x 0) (for-each (lambda (a b c) (set! x (+ x (+ a b c)))) '(1 2 3 4) '(1 2) '(1 2 3)) (assert (= x 9))
;; TEST string-for-each 2 strings, different length
(let ((v '())) (string-for-each (lambda (c x) (set! v (cons (char->integer c) v))) "abcde" "abcdef") (assert (equal? '(101 100 99 98 97) v)))
;; TEST vector-for-each 2 vectors, different length
(let ((v '())) (vector-for-each (lambda (a b) (set! v (cons (+ a b) v))) #(1 2 3 4 5) #(1 2 3 4 5 6)) (assert (equal? '(10 8 6 4 2) v)))
;; TEST call-with-current-continuation
(assert (= -3 (call-with-current-continuation (lambda (exit) (for-each (lambda (x) (if (negative? x) (exit x))) '(54 0 37 -3 245 19)) #t))))
;; TEST call/cc
(call/cc (lambda (k) k))
;; TEST call-with-values
(assert (= 5 (call-with-values (lambda () (values 4 5)) (lambda (a b) b))))
;; TODO: dynamic wind

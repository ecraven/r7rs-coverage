(assert (equal? '(1 . 2) (cons 1 2)))
;; TEST
(assert (equal? '(1 2 3) (list 1 2 3)))
;; TEST
(assert (equal? '() (list)))
;; TEST
(assert (equal? '(2 . 1) (xcons 1 2)))
;; TEST
(assert (equal? '(1 2 3 . 4) (cons* 1 2 3 4)))
;; TEST
(assert (= 1 (cons* 1)))
;; TEST
(assert (equal? '(1 3 5) (filter odd? '(1 2 3 4 5))))
;; TEST
(assert (equal? '(#t #t #t) (filter-map odd? '(1 2 3 4 5))))

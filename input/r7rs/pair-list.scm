;; TEST literals
'(1 . 2)
'(1 2 3 4 5)
;; TEST pair?
(assert (pair? '(1 . 2)))
(assert (not (pair? 'b)))
;; TEST cons
(assert (equal? '(1 . 2) (cons 1 2)))
;; TEST car
(assert (= 1 (car (cons 1 2))))
;; TEST cdr
(assert (= 2 (cdr (cons 1 2))))
;; TEST set-car!
(define x (cons 1 2)) (set-car! x 5) (assert (= 5 (car x)))
;; TEST set-cdr!
(define x (cons 1 2)) (set-cdr! x 5) (assert (= 5 (cdr x)))
;; TEST caar-cadr-cdar-...
(list caar cadr cdar cddr) ; ...
;; TEST null?
(assert (null? '()))
(assert (not (null? '(1 2 3))))
;; TEST list?
(assert (list? '(1 2 3)))
(assert (not (list? '(1 2 3 . 4))))
;; TEST make-list
(assert (= 5 (length (make-list 5))))
(assert (equal? '(5 5 5) (make-list 3 5)))
;; TEST list
(assert (equal? '(1 2 3) (list 1 2 3)))
(assert (equal? '() (list)))
;; TEST length
(assert (= 3 (length '(1 2 3))))
(assert (= 0 (length '())))
;; TEST append
(assert (equal? '(1 2 3 4) (append '(1 2) '(3 4))))
(assert (equal? '(1 2 3 4) (append '() '(1 2) '(3 4) '())))
;; TEST append improper list
(assert (equal? '(a b c . d) (append '(a b) '(c . d))))
;; TEST append not list
(assert (eq? 'a (append '() 'a)))
;; TEST reverse
(assert (equal? '(4 3 2 1) (reverse '(1 2 3 4))))
;; TEST list-tail
(assert (let ((l (list 1 2 3 4))) (eq? (cddr l) (list-tail l 2))))
;; TEST list-ref
(assert (= 5 (list-ref '(1 3 5) 2)))
;; TEST list-set!
(define l (list 1 2 3)) (list-set! l 1 5) (assert (= 5 (list-ref l 1)))
;; TEST memq
(assert (equal? '(b c) (memq 'b '(a b c))))
;; TEST memv
(assert (equal? '(b c) (memv 'b '(a b c))))
;; TEST member
(assert (equal? '(b c) (member 'b '(a b c))))
;; TEST member comparator
(assert (equal? '(2 3) (member '2 '(1 2 3) =)))
;; TEST assq
(assert (equal? '(a 1) (assq 'a '((a 1) (b 2) (c 3)))))
;; TEST assv
(assert (equal? '(a 1) (assv 'a '((a 1) (b 2) (c 3)))))
;; TEST assoc
(assert (equal? '(a 1) (assoc 'a '((a 1) (b 2) (c 3)))))
;; TEST assoc comparator
(assert (equal? '(1 a) (assoc 1 '((1 a) (2 b) (3 c)) =)))
;; TEST list-copy
(assert (let ((l '(1 2 3))) (and (not (eq? l (list-copy l))) (equal? l (list-copy l)))))

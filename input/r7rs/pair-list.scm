(assert (pair? '(1 . 2)))
(assert (not (pair? 'b)))
;; TEST
(assert (equal? '(1 . 2) (cons 1 2)))
;; TEST
(assert (= 1 (car (cons 1 2))))
;; TEST
(assert (= 2 (cdr (cons 1 2))))
;; TEST
(define x (cons 1 2)) (set-car! x 5) (assert (= 5 (car x)))
;; TEST
(define x (cons 1 2)) (set-cdr! x 5) (assert (= 5 (cdr x)))
;; TEST
(list caar cadr cdar cddr) ; ...
;; TEST
(assert (null? '()))
(assert (not (null? '(1 2 3))))
;; TEST
(assert (list? '(1 2 3)))
(assert (not (list? '(1 2 3 . 4))))
;; TEST
(assert (= 5 (length (make-list 5))))
(assert (equal? '(5 5 5) (make-list 3 5)))
;; TEST
(assert (equal? '(1 2 3) (list 1 2 3)))
(assert (equal? '() (list)))
;; TEST
(assert (= 3 (length '(1 2 3))))
(assert (= 0 (length '())))
;; TEST
(assert (equal? '(1 2 3 4) (append '(1 2) '(3 4))))
;; TEST
(assert (equal? '(1 2 3 4) (append '() '(1 2) '(3 4) '())))
;; TEST
(assert (equal? '(a b c . d) (append '(a b) '(c . d))))
;; TEST
(assert (eq? 'a (append '() 'a)))
;; TEST
(assert (equal? '(4 3 2 1) (reverse '(1 2 3 4))))
;; TEST
(assert (let ((l (list 1 2 3 4))) (eq? (cddr l) (list-tail l 2))))
;; TEST
(assert (= 5 (list-ref '(1 3 5) 2)))
;; TEST
(define l (list 1 2 3)) (list-set! l 1 5) (assert (= 5 (list-ref l 1)))
;; TEST
(assert (equal? '(b c) (memq 'b '(a b c))))
;; TEST
(assert (equal? '(b c) (memv 'b '(a b c))))
;; TEST
(assert (equal? '(b c) (member 'b '(a b c))))
;; TEST
(assert (equal? '(2 3) (member '2 '(1 2 3) =)))
;; TEST
(assert (equal? '(a 1) (assq 'a '((a 1) (b 2) (c 3)))))
;; TEST
(assert (equal? '(a 1) (assv 'a '((a 1) (b 2) (c 3)))))
;; TEST
(assert (equal? '(a 1) (assoc 'a '((a 1) (b 2) (c 3)))))
;; TEST
(assert (equal? '(1 a) (assoc 1 '((1 a) (2 b) (3 c)) =)))
;; TEST
(assert (let ((l '(1 2 3))) (and (not (eq? l (list-copy l))) (equal? l (list-copy l)))))

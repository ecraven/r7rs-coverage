(assert (bytevector? (bytevector 1 2 3)))
;; TEST
(assert (let ((b (make-bytevector 3 5))) (and (= 3 (bytevector-length b)) (= 5 (bytevector-u8-ref b 2)))))
;; TEST
(assert (= 3 (bytevector-length (bytevector 1 2 3))))
;; TEST
(assert (= 3 (bytevector-u8-ref (bytevector 1 2 3) 2)))
;; TEST
(define b (make-bytevector 5 3)) (bytevector-u8-set! b 0 5) (assert (= 5 (bytevector-u8-ref b 0)))
;; TEST
(assert (let ((b (bytevector 1 2 3))) (and (equal? b (bytevector-copy b)) (not (eq? b (bytevector-copy b))))))
;; TEST
(assert (let ((b (bytevector 5 1 2 3))) (equal? (bytevector 1 2 3) (bytevector-copy b 1))))
;; TEST
(assert (let ((b (bytevector 5 1 2 3 5))) (equal? (bytevector 1 2 3) (bytevector-copy b 1 4))))
;; TEST
(define b (make-bytevector 3)) (bytevector-copy! b 0 (bytevector 1 2 3)) (assert (equal? (bytevector 1 2 3) b))
;; TEST
(define b (make-bytevector 3 0)) (bytevector-copy! b 0 (bytevector 5 1 2 3) 1) (assert (equal? (bytevector 1 2 3) b))
;; TEST
(define b (make-bytevector 3 0)) (bytevector-copy! b 0 (bytevector 5 1 2 3 4) 1 4) (assert (equal? (bytevector 1 2 3) b))
;; TEST
(assert (equal? (bytevector 1 2 3 4 5 6) (bytevector-append (bytevector 1 2) (bytevector 3 4) (bytevector 5 6))))
;; TEST
(assert (equal? "A" (utf8->string (bytevector #x41))))
;; Test
(assert (equal? (bytevector #xce #xbb) (string->utf8 "λ")))

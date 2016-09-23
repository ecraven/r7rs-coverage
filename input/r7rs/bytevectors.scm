;; TEST bytevector?
(assert (bytevector? (bytevector 1 2 3)))
;; TEST make-bytevector
(assert (let ((b (make-bytevector 3 5))) (and (= 3 (bytevector-length b)) (= 5 (bytevector-u8-ref b 2)))))
;; TEST bytevector-length
(assert (= 3 (bytevector-length (bytevector 1 2 3))))
;; TEST bytevector-u8-ref
(assert (= 3 (bytevector-u8-ref (bytevector 1 2 3) 2)))
;; TEST bytevector-u8-set!
(define b (make-bytevector 5 3)) (bytevector-u8-set! b 0 5) (assert (= 5 (bytevector-u8-ref b 0)))
;; TEST bytevector-copy 3 args
(assert (let ((b (bytevector 1 2 3))) (and (equal? b (bytevector-copy b)) (not (eq? b (bytevector-copy b))))))
;; TEST bytevector-copy 4 args
(assert (let ((b (bytevector 5 1 2 3))) (equal? (bytevector 1 2 3) (bytevector-copy b 1))))
;; TEST bytevector-copy 5 args
(assert (let ((b (bytevector 5 1 2 3 5))) (equal? (bytevector 1 2 3) (bytevector-copy b 1 4))))
;; TEST bytevector-copy! 3 args
(define b (make-bytevector 3)) (bytevector-copy! b 0 (bytevector 1 2 3)) (assert (equal? (bytevector 1 2 3) b))
;; TEST bytevector-copy! 4 args
(define b (make-bytevector 3 0)) (bytevector-copy! b 0 (bytevector 5 1 2 3) 1) (assert (equal? (bytevector 1 2 3) b))
;; TEST bytevector-copy! 5 args
(define b (make-bytevector 3 0)) (bytevector-copy! b 0 (bytevector 5 1 2 3 4) 1 4) (assert (equal? (bytevector 1 2 3) b))
;; TEST bytevector-append
(assert (equal? (bytevector 1 2 3 4 5 6) (bytevector-append (bytevector 1 2) (bytevector 3 4) (bytevector 5 6))))
;; TEST utf8->string
(assert (equal? "A" (utf8->string (bytevector #x41))))
;; Test string->utf8
(assert (equal? (bytevector #xce #xbb) (string->utf8 "λ")))

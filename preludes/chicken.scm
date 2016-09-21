(use r7rs)
(define (assert x)
  (unless x
    (error "assertion failed")))

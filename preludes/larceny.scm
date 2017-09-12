(import (scheme base) (scheme char))
(define (assert x)
  (unless x
    (error "assertion failed")))

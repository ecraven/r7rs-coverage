(import (scheme base))
(define (assert x)
  (unless x
    (error "assertion failed")))

(use r7rs)
(import (scheme complex))
(define (assert x)
  (unless x
    (error "assertion failed")))

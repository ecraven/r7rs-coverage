(import (scheme base) (scheme inexact) (scheme lazy) (scheme char) (scheme complex))
(define (assert x)
  (unless x
    (error "assertion failed")))

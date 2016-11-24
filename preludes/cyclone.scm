(import (scheme base) (scheme inexact) (scheme lazy) (scheme char) (scheme complex) (srfi 1))
(define (assert x)
  (unless x
    (error "assertion failed")))

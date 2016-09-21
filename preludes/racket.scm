#lang r7rs
(import (scheme base))
(define (assert x)
  (if (not x)
    (error "assertion failed")))


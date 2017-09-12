(define-macro (import . rest)
  #t)

(define-macro (unless a . rest)
  `(if (not ,a)
       (begin ,@rest)))

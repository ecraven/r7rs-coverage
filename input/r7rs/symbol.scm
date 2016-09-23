;; TEST symbol?
(assert (symbol? 'a))
;; TEST symbol=?
(assert (symbol=? 'a 'a (string->symbol "a")))
;; TEST symbol->string
(assert (string=? "a" (symbol->string 'a)))
;; TEST string->symbol
(assert (eq? 'a (string->symbol "a")))

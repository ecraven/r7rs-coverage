(assert (symbol? 'a))
;; TEST
(assert (symbol=? 'a 'a (string->symbol "a")))
;; TEST
(assert (string=? "a" (symbol->string 'a)))
;; TEST
(assert (eq? 'a (string->symbol "a")))

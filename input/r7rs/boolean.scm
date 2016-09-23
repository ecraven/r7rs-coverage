;; TEST literals
(assert (eq? #t (not #f)))
;; TEST boolean?
(assert (boolean? #t))
(assert (boolean? #f))
(assert (not (boolean? 3)))
(assert (not (boolean? 'a)))
;; TEST boolean=?
(assert (boolean=? #t #t))
(assert (boolean=? #f #f))
(assert (not (boolean=? #t #f)))

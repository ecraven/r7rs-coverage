;; TEST caaar
(assert (= 2 (caaar '(((2))))))
;; TEST caadr
(assert (= 2 (caadr '(3 . ((2))))))
;; TEST cadar
(assert (= 2 (cadar '((3 . (2))))))
;; TEST caddr
(assert (= 2 (caddr '(3 . (3 . (2))))))
;; TEST cdaar
(assert (= 2 (cdaar '(((3 . 2))))))
;; TEST cdadr
(assert (= 2 (cdadr '(3 . ((3 . 2))))))
;; TEST cddar
(assert (= 2 (cddar '((3 . (3 . 2))))))
;; TEST cdddr
(assert (= 2 (cdddr '(3 . (3 . (3 . 2))))))
;; TEST cXr
(list caaar
      caadr
      cadar
      caddr
      cdaar
      cdadr
      cddar
      cdddr
      caaaar
      caaadr
      caadar
      caaddr
      cadaar
      cadadr
      caddar
      cadddr
      cdaaar
      cdaadr
      cdadar
      cdaddr
      cddaar
      cddadr
      cdddar
      cddddr)

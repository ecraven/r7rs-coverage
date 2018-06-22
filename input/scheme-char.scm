;; TEST char-alphabetic?
(assert (char-alphabetic? #\a))
;; TEST char-ci<=?
(assert (char-ci<=? #\a #\A #\b #\B))
;; TEST char-ci<?
(assert (char-ci<? #\a #\B #\c))
;; TEST char-ci=?
(assert (char-ci=? #\a #\A #\a))
;; TEST char-ci>=?
(assert (char-ci>=? #\b #\B #\a #\A))
;; TEST char-ci>?
(assert (char-ci>? #\c #\B #\a))
;; TEST char-downcase
(assert (char=? #\a (char-downcase #\A)))
;; TEST char-foldcase
(assert (char=? (char-foldcase #\a) (char-foldcase #\A)))
;; TEST char-lower-case?
(assert (char-lower-case? #\a))
;; TEST char-numeric?
(assert (char-numeric? #\1))
;; TEST char-upcase
(assert (char=? #\A (char-upcase #\a)))
;; TEST char-upper-case?
(assert (char-upper-case? #\A))
;; TEST char-whitespace?
(assert (char-whitespace? #\space))
;; TEST digit-value,ascii
(assert (eq? #f (digit-value #\.)))
(assert (= 3 (digit-value #\3)))
;; TEST digit-value,unicode ٤ and ૦
(assert (= 4 (digit-value #\x0664)))
(assert (= 0 (digit-value #\x0ae6)))
;; TEST string-ci<=?
(assert (string-ci<=? "a" "A" "b" "B"))
;; TEST string-ci<?
(assert (string-ci<? "a" "B" "c"))
;; TEST string-ci=?
(assert (string-ci=? "foo" "FOO" (string #\f #\o #\o)))
;; TEST string-ci>=?
(assert (string-ci>=? "b" "B" "a" "A"))
;; TEST string-ci>?
(assert (string-ci>? "c" "B" "a"))
;; TEST string-downcase
(assert (string=? "foo" (string-downcase "FOO")))
;; TEST string-foldcase
(assert (string=? (string-foldcase "foo") (string-foldcase "FOO")))
;; TEST string-upcase
(assert (string=? "FOO" (string-upcase "foo")))

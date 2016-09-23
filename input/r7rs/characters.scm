;; TEST literals
(list #\alarm #\backspace #\delete #\escape #\newline #\null #\return #\space #\tab)
;; TEST char?
(assert (char? #\a))
(assert (not (char? 3)))
;; TEST char=?
(assert (char=? #\a #\a #\a))
;; TEST char<?
(assert (char<? #\a #\b #\c))
;; TEST char>?
(assert (char>? #\c #\b #\a))
;; TEST char<=?
(assert (char<=? #\a #\a #\b #\b))
;; TEST char>=?
(assert (char>=? #\b #\b #\a #\a))
;; TEST char-ci=?
(assert (char-ci=? #\a #\A #\a))
;; TEST char-ci<?
(assert (char-ci<? #\a #\B #\c))
;; TEST char-ci>?
(assert (char-ci>? #\c #\B #\a))
;; TEST char-ci<=?
(assert (char-ci<=? #\a #\A #\b #\B))
;; TEST char-ci>=?
(assert (char-ci>=? #\b #\B #\a #\A))
;; TEST char-alphabetic?
(assert (char-alphabetic? #\a))
;; TEST char-numeric?
(assert (char-numeric? #\1))
;; TEST char-whitespace?
(assert (char-whitespace? #\space))
;; TEST char-upper-case?
(assert (char-upper-case? #\A))
;; TEST char-lower-case?
(assert (char-lower-case? #\a))
;; TEST digit-value
(assert (= 3 (digit-value #\3)))
;; TEST char->integer
(assert (= 97 (char->integer #\a)))
;; TEST integer->char
(assert (char=? #\a (integer->char 97)))
;; TEST char-upcase
(assert (char=? #\A (char-upcase #\a)))
;; TEST char-downcase
(assert (char=? #\a (char-downcase #\A)))
;; TEST char-foldcase
(assert (char=? (char-foldcase #\a) (char-foldcase #\A)))

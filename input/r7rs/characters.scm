(list #\alarm #\backspace #\delete #\escape #\newline #\null #\return #\space #\tab)
;; TEST
(assert (char? #\a))
(assert (not (char? 3)))
;; TEST
(assert (char=? #\a #\a #\a))
;; TEST
(assert (char<? #\a #\b #\c))
;; TEST
(assert (char>? #\c #\b #\a))
;; TEST
(assert (char<=? #\a #\a #\b #\b))
;; TEST
(assert (char>=? #\b #\b #\a #\a))
;; TEST
(assert (char-ci=? #\a #\A #\a))
;; TEST
(assert (char-ci<? #\a #\B #\c))
;; TEST
(assert (char-ci>? #\c #\B #\a))
;; TEST
(assert (char-ci<=? #\a #\A #\b #\B))
;; TEST
(assert (char-ci>=? #\b #\B #\a #\A))
;; TEST
(assert (char-alphabetic? #\a))
;; TEST
(assert (char-numeric? #\1))
;; TEST
(assert (char-whitespace? #\space))
;; TEST
(assert (char-upper-case? #\A))
;; TEST
(assert (char-lower-case? #\a))
;; TEST
(assert (= 3 (digit-value #\3)))
;; TEST
(assert (= 97 (char->integer #\a)))
;; TEST
(assert (char=? #\a (integer->char 97)))
;; TEST
(assert (char=? #\A (char-upcase #\a)))
;; TEST
(assert (char=? #\a (char-downcase #\A)))
;; TEST
(assert (char=? (char-foldcase #\a) (char-foldcase #\A)))

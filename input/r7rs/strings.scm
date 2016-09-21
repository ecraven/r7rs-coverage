"\a\b\t\n\r\"\\\|\
  \x12;"
;; TEST
(assert (string? "foo"))
;; TEST
(assert (= 10 (string-length (make-string 10))))
;; TEST
(assert (char=? #\a (string-ref (make-string 10 #\a) 9)))
;; TEST
(assert (string=? "foo" (string #\f #\o #\o)))
;; TEST
(assert (= 3 (string-length "foo")))
;; TEST
(assert (char=? #\o (string-ref "foo" 2)))
;; TEST
(define s (make-string 5)) (string-set! s 3 #\x) (assert (char=? #\x (string-ref s 3)))
;; TEST
(assert (string=? "foo" "foo" (string #\f #\o #\o)))
;; TEST
(assert (string-ci=? "foo" "FOO" (string #\f #\o #\o)))
;; TEST
(assert (string<? "a" "b" "c"))
;; TEST
(assert (string-ci<? "a" "B" "c"))
;; TEST
(assert (string>? "c" "b" "a"))
;; TEST
(assert (string-ci>? "c" "B" "a"))
;; TEST
(assert (string<=? "a" "a" "b" "b"))
;; TEST
(assert (string-ci<=? "a" "A" "b" "B"))
;; TEST
(assert (string>=? "b" "b" "a" "a"))
;; TEST
(assert (string-ci>=? "b" "B" "a" "A"))
;; TEST
(assert (string=? "FOO" (string-upcase "foo")))
;; TEST
(assert (string=? "foo" (string-downcase "FOO")))
;; TEST
(assert (string=? (string-foldcase "foo") (string-foldcase "FOO")))
;; TEST
(assert (string=? "foo" (substring "foobar" 0 3)))
;; TEST
(assert (string=? "foobar" (string-append "foo" "bar")))
;; TEST
(assert (equal? '(#\f #\o #\o) (string->list "foo")))
;; TEST
(assert (equal? '(#\f #\o #\o) (string->list "xfoo" 1)))
;; TEST
(assert (equal? '(#\f #\o #\o) (string->list "xfoox" 1 4)))
;; TEST
(assert (string=? "foo" (list->string '(#\f #\o #\o))))
;; TEST
(assert (let ((s "foo")) (and (not (eq? s (string-copy s))) (string=? s (string-copy s)))))
;; TEST
(assert (string=? "foo" (string-copy "xfoo" 1)))
;; TEST
(assert (string=? "foo" (string-copy "xfoox" 1 4)))
;; TEST
(define s (make-string 5)) (string-copy! s 0 "foo") (assert (string=? "foo" (substring s 0 3)))
;; TEST
(define s (make-string 5 #\x)) (string-copy! s 0 "xfoo" 1) (assert (string=? "foo" (substring s 0 3)))
;; TEST
(define s (make-string 5 #\x)) (string-copy! s 0 "xfoo" 1 3) (assert (string=? "fo" (substring s 0 2)))
;; TEST
(define s (make-string 3 #\x)) (string-fill! s #\a) (assert (string=? "aaa" s))
;; TEST
(define s (make-string 3 #\x)) (string-fill! s #\a 1) (assert (string=? "xaa" s))
;; TEST
(define s (make-string 3 #\x)) (string-fill! s #\a 1 2) (assert (string=? "xax" s))

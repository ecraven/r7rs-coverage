;; TEST literal
"\a\b\t\n\r\"\\\|\x12;"
;; TEST string?
(assert (string? "foo"))
;; TEST make-string
(assert (= 10 (string-length (make-string 10))))
;; TEST make-string fill
(assert (char=? #\a (string-ref (make-string 10 #\a) 9)))
;; TEST string
(assert (string=? "foo" (string #\f #\o #\o)))
;; TEST string-length
(assert (= 3 (string-length "foo")))
;; TEST string-ref
(assert (char=? #\o (string-ref "foo" 2)))
;; TEST string-set!
(define s (make-string 5)) (string-set! s 3 #\x) (assert (char=? #\x (string-ref s 3)))
;; TEST string=?
(assert (string=? "foo" "foo" (string #\f #\o #\o)))
;; TEST string-ci=?
(assert (string-ci=? "foo" "FOO" (string #\f #\o #\o)))
;; TEST string<?
(assert (string<? "a" "b" "c"))
;; TEST string-ci<?
(assert (string-ci<? "a" "B" "c"))
;; TEST string>?
(assert (string>? "c" "b" "a"))
;; TEST string-ci>?
(assert (string-ci>? "c" "B" "a"))
;; TEST string<=?
(assert (string<=? "a" "a" "b" "b"))
;; TEST string-ci<=?
(assert (string-ci<=? "a" "A" "b" "B"))
;; TEST string>=?
(assert (string>=? "b" "b" "a" "a"))
;; TEST string-ci>=?
(assert (string-ci>=? "b" "B" "a" "A"))
;; TEST string-upcase
(assert (string=? "FOO" (string-upcase "foo")))
;; TEST string-downcase
(assert (string=? "foo" (string-downcase "FOO")))
;; TEST string-foldcase
(assert (string=? (string-foldcase "foo") (string-foldcase "FOO")))
;; TEST substring
(assert (string=? "foo" (substring "foobar" 0 3)))
;; TEST string-append
(assert (string=? "foobar" (string-append "foo" "bar")))
;; TEST string->list
(assert (equal? '(#\f #\o #\o) (string->list "foo")))
;; TEST string->list start
(assert (equal? '(#\f #\o #\o) (string->list "xfoo" 1)))
;; TEST string->list start and end
(assert (equal? '(#\f #\o #\o) (string->list "xfoox" 1 4)))
;; TEST list->string
(assert (string=? "foo" (list->string '(#\f #\o #\o))))
;; TEST string-copy
(assert (let ((s "foo")) (and (not (eq? s (string-copy s))) (string=? s (string-copy s)))))
;; TEST string-copy start
(assert (string=? "foo" (string-copy "xfoo" 1)))
;; TEST string-copy start and end
(assert (string=? "foo" (string-copy "xfoox" 1 4)))
;; TEST string-copy!
(define s (make-string 5)) (string-copy! s 0 "foo") (assert (string=? "foo" (substring s 0 3)))
;; TEST string-copy! start
(define s (make-string 5 #\x)) (string-copy! s 0 "xfoo" 1) (assert (string=? "foo" (substring s 0 3)))
;; TEST string-copy! start and end
(define s (make-string 5 #\x)) (string-copy! s 0 "xfoo" 1 3) (assert (string=? "fo" (substring s 0 2)))
;; TEST string-fill!
(define s (make-string 3 #\x)) (string-fill! s #\a) (assert (string=? "aaa" s))
;; TEST string-fill! start
(define s (make-string 3 #\x)) (string-fill! s #\a 1) (assert (string=? "xaa" s))
;; TEST string-fill! start and end
(define s (make-string 3 #\x)) (string-fill! s #\a 1 2) (assert (string=? "xax" s))

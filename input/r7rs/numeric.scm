;; TEST number?
(assert (number? 3))
(assert (not (number? 'a)))
;; TEST real?
(assert (real? 3.14))
;; TEST rational?
(assert (rational? 3/4))
;; TEST integer?
(assert (integer? 123))
;; TEST exact?
(assert (exact? 3))
;; TEST inexact?
(assert (inexact? 3.0))
;; TEST exact-integer?
(assert (exact-integer? 32))
;; TEST finite?
(assert (finite? 123))
;; TEST infinite?
(assert (infinite? +inf.0))
;; TEST nan?
(assert (nan? +nan.0))
;; TEST = two parameters
(assert (= 1 1))
;; TEST = more than two parameters
(assert (= 1 1 1 1))
;; TEST < two parameters
(assert (< 1 2))
;; TEST < more than two parameters
(assert (< 1 2 3 4))
;; TEST > two parameters
(assert (> 4 3))
;; TEST > more than two parameters
(assert (> 4 3 2 1))
;; TEST <= two parameters
(assert (<= 1 1))
;; TEST <= more than two parameters
(assert (<= 1 1 2 2))
;; TEST >= two parameters
(assert (>= 2 2))
;; TEST >= more than two parameters
(assert (>= 2 2 1 1))
;; TEST zero?
(assert (zero? 0))
;; TEST positive?
(assert (positive? 1))
;; TEST negative?
(assert (negative? -1))
;; TEST odd?
(assert (odd? 3))
;; TEST even?
(assert (even? 2))
;; TEST max
(assert (= 5 (max 1 2 3 4 5)))
;; TEST min
(assert (= 1 (min 1 2 3 4 5)))
;; TEST + no parameters
(assert (= 0 (+)))
;; TEST + one parameter
(assert (= 5 (+ 5)))
;; TEST + more than two parameters
(assert (= 10 (+ 1 2 3 4)))
;; TEST * no parameters
(assert (= 1 (*)))
;; TEST * one parameter
(assert (= 5 (* 5)))
;; TEST * more than two parameters
(assert (= 24 (* 1 2 3 4)))
;; TEST / one parameter
(assert (= 1/5 (/ 5)))
;; TEST / more than two parameters
(assert (= 1/6 (/ 1 2 3)))
;; TEST abs
(assert (= 5 (abs -5)))
;; TEST floor-quotient
(assert (= -4 (floor-quotient 10 -3)))
;; TEST floor-remainder
(assert (= -2 (floor-remainder 10 -3)))
;; TEST truncate-quotient
(assert (= -3 (truncate-quotient 10 -3)))
;; TEST truncate-remainder
(assert (= 1 (truncate-remainder 10 -3)))
;; TEST floor/
(assert (call-with-values (lambda () (floor/ 5 2)) (lambda (a b) (and (= a 2) (= b 1)))))
(assert (call-with-values (lambda () (floor/ -5 2)) (lambda (a b) (and (= a -3) (= b 1)))))
(assert (call-with-values (lambda () (floor/ 5 -2)) (lambda (a b) (and (= a -3) (= b -1)))))
(assert (call-with-values (lambda () (floor/ -5 -2)) (lambda (a b) (and (= a 2) (= b -1)))))
;; TEST truncate/
(assert (call-with-values (lambda () (truncate/ 5 2)) (lambda (a b) (and (= a 2) (= b 1)))))
(assert (call-with-values (lambda () (truncate/ -5 2)) (lambda (a b) (and (= a -2) (= b -1)))))
(assert (call-with-values (lambda () (truncate/ 5 -2)) (lambda (a b) (and (= a -2) (= b 1)))))
(assert (call-with-values (lambda () (truncate/ -5 -2)) (lambda (a b) (and (= a 2) (= b -1)))))
(assert (call-with-values (lambda () (truncate/ -5.0 -2)) (lambda (a b) (and (= a 2.0) (= b -1.0)))))
;; TEST gcd
(assert (= 782 (gcd 72726 17986)))
;; TEST lcm
(assert (= 1672698 (lcm 72726 17986)))
;; TEST numerator
(assert (= 5 (numerator 5/17)))
;; TEST denominator
(assert (= 17 (denominator 5/17)))
;; TEST floor
(assert (= 5 (floor 5.3)))
;; TEST ceiling
(assert (= 6 (ceiling 5.3)))
;; TEST truncate
(assert (= -2 (truncate -2.5)))
(assert (= 2 (truncate 2.5)))
;; TEST round
(assert (= 3 (round 2.7)))
(assert (= -3 (round -2.7)))
;; TEST rationalize
(assert (= 1/3 (rationalize (exact .3) 1/10)))
(assert (= #i1/3 (rationalize .3 1/10)))
;; TEST exp
(assert (and (> (exp 3) 20.085) (< (exp 3) 20.086)))
;; TEST log one parameter
(assert (and (> (log 15) 2.70) (< (log 15) 2.71)))
;; TEST log two parameters
(assert (and (> (log 10 4) 1.660) (< (log 10 4) 1.661)))
;; TEST sin
(assert (and (> (sin 3) 0.141) (< (sin 3) 0.142)))
;; TEST cos
(assert (and (> (cos 5) 0.283) (< (cos 3) 0.284)))
;; TEST tan
(assert (and (> (tan 1) 1.557) (< (tan 1) 1.558)))
;; TEST asin
(assert (and (> (asin 0.5) 0.523) (< (asin 0.5) 0.524)))
;; TEST acos
(assert (and (> (acos 0.5) 1.047) (< (acos 0.5) 1.048)))
;; TEST atan one parameter
(assert (and (> (atan 0.5) 0.463) (< (atan 0.5) 0.464)))
;; TEST atan two parameters
(assert (and (> (atan 2 1) 1.107) (< (atan 2 1) 1.108)))
;; TEST square
(assert (= 25 (square 5)))
;; TEST sqrt
(assert (and (> (sqrt 17) 4.123) (< (sqrt 17) 4.124)))
;; TEST exact-integer-sqrt
(assert (call-with-values (lambda () (exact-integer-sqrt 17)) (lambda (a b) (and (= a 4) (= b 1)))))
;; TEST expt
(assert (= 8 (expt 2 3)))
;; TEST expt 0^0
(assert (= 1 (expt 0 0)))
;; TEST expt 0^1
(assert (= 0 (expt 0 1)))
;; TEST make-rectangular
(assert (= 1+2i (make-rectangular 1 2)))
;; TEST real-part
(assert (= 1 (real-part (make-rectangular 1 2))))
;; TEST imag-part
(assert (= 2 (imag-part (make-rectangular 1 2))))
;; TEST make-polar
(assert (= 3 (magnitude (make-polar 3 1))))
;; TEST magnitude
(assert (= 3 (magnitude (make-polar 3 1))))
;; TEST angle
(assert (< (abs (- (angle (make-polar 3 1)) 1)) 0.000001))
;; TEST inexact
(assert (inexact? (inexact 3)))
;; TEST exact
(assert (exact? (exact 3.0)))
;; TEST number->string
(assert (string=? "123" (number->string 123)))
(assert (string=? "1111011" (number->string 123 2)))
(assert (string=? "173" (number->string 123 8)))
(assert (string=? "7b" (number->string 123 16)))
(assert (string=? "123" (number->string 123 10)))
;; TEST string->number
(assert (= 123 (string->number "123")))
(assert (= 123 (string->number "7b" 16)))
(assert (= 123 (string->number "173" 8)))
(assert (= 123 (string->number "1111011" 2)))
(assert (eq? #f (string->number "abcd")))

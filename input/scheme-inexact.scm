;; TEST acos
(assert (and (> (acos 0.5) 1.047) (< (acos 0.5) 1.048)))
;; TEST asin
(assert (and (> (asin 0.5) 0.523) (< (asin 0.5) 0.524)))
;; TEST atan one parameter
(assert (and (> (atan 0.5) 0.463) (< (atan 0.5) 0.464)))
;; TEST atan two parameters
(assert (and (> (atan 2 1) 1.107) (< (atan 2 1) 1.108)))
;; TEST cos
(assert (and (> (cos 5) 0.283) (< (cos 3) 0.284)))
;; TEST exp
(assert (and (> (exp 3) 20.085) (< (exp 3) 20.086)))
;; TEST finite?
(assert (finite? 123))
;; TEST infinite?
(assert (infinite? +inf.0))
;; TEST log one parameter
(assert (and (> (log 15) 2.70) (< (log 15) 2.71)))
;; TEST log two parameters
(assert (and (> (log 10 4) 1.660) (< (log 10 4) 1.661)))
;; TEST nan?
(assert (nan? +nan.0))
;; TEST sin
(assert (and (> (sin 3) 0.141) (< (sin 3) 0.142)))
;; TEST sqrt
(assert (and (> (sqrt 17) 4.123) (< (sqrt 17) 4.124)))
;; TEST tan
(assert (and (> (tan 1) 1.557) (< (tan 1) 1.558)))

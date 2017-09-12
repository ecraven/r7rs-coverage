;; TEST angle
(assert (< (abs (- (angle (make-polar 3 1)) 1)) 0.000001))
;; TEST imag-part
(assert (= 2 (imag-part (make-rectangular 1 2))))
;; TEST magnitude
(assert (= 3 (magnitude (make-polar 3 1))))
;; TEST make-polar
(assert (= 3 (magnitude (make-polar 3 1))))
;; TEST make-rectangular
(assert (= 1+2i (make-rectangular 1 2)))
;; TEST real-part
(assert (= 1 (real-part (make-rectangular 1 2))))

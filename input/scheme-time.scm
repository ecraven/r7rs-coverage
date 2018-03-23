;; TEST current-jiffy
(let ((t (current-jiffy))) (assert (number? t)) (assert (exact? t)) (assert (positive? t)) (assert (integer? t)))
;; TEST current-second
(let ((t (current-second))) (assert (number? t)) (assert (inexact? t)) (assert (< 1505000000 t 1735686000))) ;; smaller 2025
;; TEST jiffies-per-second
(let ((t (jiffies-per-second))) (assert (number? t)) (assert (exact? t)) (assert (integer? t)))

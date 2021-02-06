;; TEST current-jiffy number?
(let ((t (current-jiffy))) (assert (number? t)))
;; TEST current-jiffy number?
(let ((t (current-jiffy))) (assert (exact? t)))
;; TEST current-jiffy not negative?
(let ((t (current-jiffy))) (assert (not (negative? t))))
;; TEST current-jiffy integer?
(let ((t (current-jiffy))) (assert (integer? t)))
;; TEST current-second number?
(let ((t (current-second))) (assert (number? t)))
;; TEST current-second inexact?
(let ((t (current-second))) (assert (inexact? t)))
;; TEST current-second correct range
(let ((t (current-second))) (assert (< 1505000000 t 1735686000))) ;; smaller 2025
;; TEST jiffies-per-second number?
(let ((t (jiffies-per-second))) (assert (number? t)))
;; TEST jiffies-per-second exact?
(let ((t (jiffies-per-second))) (assert (exact? t)))
;; TEST jiffies-per-second integer?
(let ((t (jiffies-per-second))) (assert (integer? t)))


(define-record-type <pare> (kons x y) pare? (x kar set-kar!) (y kdr))
(assert (pare? (kons 1 2)))
(assert (= 1 (kar (kons 1 2))))
(assert (= 2 (kdr (kons 1 2))))

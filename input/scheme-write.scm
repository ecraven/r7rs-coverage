;; TEST display one argument
(assert (string=? "foobar" (let ((p (open-output-string))) (parameterize ((current-output-port p)) (display "foobar") (get-output-string p)))))
;; TEST display two arguments
(assert (string=? "foobar" (let ((p (open-output-string))) (display "foobar" p) (get-output-string p))))
;; TEST write one argument
(assert (string=? "\"foobar\"" (let ((p (open-output-string))) (parameterize ((current-output-port p)) (write "foobar") (get-output-string p)))))
;; TEST write two arguments
(assert (string=? "\"foobar\"" (let ((p (open-output-string))) (write "foobar" p) (get-output-string p))))
;; TEST write-shared
(list write-shared)
;; TEST write-simple
(list write-simple)

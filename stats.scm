(load-option 'string-replace-string)
(define (nested-hash-table/put! table value . keys)
  (let loop ((table table)
             (key (car keys))
             (keys (cdr keys)))
    (if (null? keys)
        (hash-table/put! table key value)
        (let ((sub-table (hash-table/get table key #f)))
          (if sub-table
              (loop sub-table (car keys) (cdr keys))
              (let ((sub-table (make-hash-table)))
                (hash-table/put! table key sub-table)
                (loop sub-table (car keys) (cdr keys))))))))

(define (nested-hash-table/get table default . keys)
  (let loop ((table table)
             (key (car keys))
             (keys (cdr keys)))
    (if (null? keys)
        (hash-table/get table key default)
        (let ((sub-table (hash-table/get table key #f)))
          (if sub-table
              (loop sub-table (car keys) (cdr keys))
              default)))))

(define (read-file-content filename)
  "Read the entire file into a string."
  (let* ((size (file-length filename))
         (str (make-string size)))
    (if (= size (read-string! str (open-input-file filename)))
        str
        (error "cannot read entire file" filename))))

(define (read-data)
  (with-input-from-file "errors.csv"
    (lambda ()
      (let loop ((lines '()))
        (let ((line (read-line)))
          (if (eof-object? line)
              (map (lambda (x) (burst-string x #\, #f))
                   (reverse lines))
              (loop (cons line lines))))))))

(define *data* (make-hash-table))
(define *schemes* '())
(define *groups* '())
(define *tests* (make-hash-table))

(define (symbol-downcase s) (string->symbol (string-downcase (symbol->string s))))

(define-syntax push
  (syntax-rules ()
    ((push x lst)
     (set! lst (cons x lst)))))

(define (parse-data)
  (let ((data (read-data)))
    (for-each (lambda (d)
                (let* ((impl (first d))
                       (version (second d))
                       (scheme (string->symbol (string-append impl "-" version)))
                       (group (string->symbol (third d)))
                       (result (string->symbol (fourth d)))
                       (name (fifth d))
                       (comments (sixth d)))
                  (nested-hash-table/put! *data* (symbol-downcase result) group name comments scheme)
                  (unless (memq scheme *schemes*)
                    (push scheme *schemes*))
                  (unless (memq group *groups*)
                    (push group *groups*))
                  (unless (member name (hash-table/get *tests* group '()))
                    (hash-table/put! *tests* group (cons name (hash-table/get *tests* group '()))))))
              data)))

(define (get-res group test)
  (hash-table->alist (nested-hash-table/get *data* 'UNKNOWN group test)))

(define (format-stats)
  (with-output-to-file "stats.html"
    (lambda ()
      (set! *data* (make-hash-table))
      (set! *schemes* '())
      (set! *groups* '())
      (set! *tests* (make-hash-table))
      (parse-data)
      (format #t "<head><link rel=\"stylesheet\" href=\"https://opensource.keycdn.com/fontawesome/4.6.3/font-awesome.min.css\" integrity=\"sha384-Wrgq82RsEean5tP3NK3zWAemiNEXofJsTwTyHmNb/iL3dP/sZJ4+7sOld1uqYJtE\" crossorigin=\"anonymous\"></head><body>~%")
      (format #t "<style>
.group { font-size: 130%; }
.testname { margin-left: 1em; font-style: italic; }
i.fa-check { color: #0b0; }
i.fa-times { color: #b00; }
i.fa-question { color: #880; }
table { margin: 0; padding: 0; cell-padding: 0; }
tbody tr:hover { background-color: #ddd; }
</style><script>
document.addEventListener(\"DOMContentLoaded\", function() {
for(var el of document.getElementsByClassName(\"test\")) {
el.style.display = \"none\";
}
});
</script>")
      (format #t "<table><thead><tr>")
      (for-each (lambda (scheme)
                  (format #t "<th>~a</th>" scheme))
                (cons "" (sort *schemes* symbol<?)))
      (format #t "</tr></thead><tbody>")
      (for-each (lambda (group)
                  (format #t "<tr class=\"group\"><td>~a</td></tr>~%" group)
                  (for-each (lambda (test)
                              (let ((r (get-res group test)))
                                (format #t "<tr class=\"test-summary\"><td>~a</td>~%" test)
                                (for-each (lambda (scheme)
                                            (let* ((x (map (lambda (res)
                                                             (if (eq? 'error (hash-table/get (cdr res) scheme 'error)) 0 1))
                                                           r))
                                                   (ok (apply + x))
                                                   (total (length x)))
                                              (format #t "<td class=\"~a\"><i class=\"fa fa-~a\"/></td>~%" (if (= ok total) 'ok (if (= ok 0) 'error 'partial)) (if (= ok total) "check" (if (= 0 ok) "times" "question"))))) ;;  (format #f "~a/~a" ok total)
                                          (sort *schemes* symbol<?))
                                (format #t "</tr>~%")
                                (for-each (lambda (res)
                                            (format #t "<tr class=\"test\"><td><span class=\"testname\">~a</span></td>~%" (if (string-null? (car res)) test (car res)))
                                            (for-each (lambda (scheme)
                                                        (let ((x (hash-table/get (cdr res) scheme 'unknown)))
                                                          (format #t "<td class=\"~a\">~a</td>" (if (eq? 'ok x) "ok" "error") (if (eq? x 'ok) "1/1" "0/1"))))
                                                      (sort *schemes* symbol<?))
                                            (format #t "</tr>"))
                                          (sort r (lambda (a b) (string<? (car a) (car b)))))))
                            (sort (hash-table/get *tests* group '()) string<?)))
                (sort *groups* symbol<?))
      (format #t "</tbody></table>")
      ;;      (format #t "<table><thead><tr><th>Scheme</th><th>Percentage</th><th>Ok</th><th>Error</th></tr></thead><tbody>~%")
      ;; (hash-table-walk *schemes*
      ;;                  (lambda (k v)
      ;;                    (let ((ok (hash-table/get v '|OK| 0))
      ;;                          (error (hash-table/get v '|ERROR| 0)))
      ;;                      (format #t "<tr><td>~a</td><td>~a%</td><td>~a</td><td>~a</td></tr>~%" k (inexact (* 100 (/ ok (+ ok error)))) ok error))))
      ;; (format #t "</tbody></table>")
      ;; (format #t "<table><thead><tr><th>Group</th><th>Ok</th><th>Error</th></tr></thead><tbody>~%")
      ;; (hash-table-walk *groups*
      ;;                  (lambda (k v)
      ;;                    (let ((ok (hash-table/get v '|OK| 0))
      ;;                          (error (hash-table/get v '|ERROR| 0)))
      ;;                      (format #t "<tr><td>~a</td><td>~a</td><td>~a</td><td>~a</td></tr>~%" k (inexact (* 100 (/ ok (+ ok error)))) ok error))))
      ;; (format #t "</tbody></table>")
      ;; (format #t "")

      )))

;;; ports.scm -- textual ports: the round trip that was impossible before
;;; (change: scheme-io-library).  Write a file, close it, read it back by line
;;; and by datum; accumulate into a string port; and show that a file port and a
;;; string port are the same object (design D2 -- input ports slurp at open, so
;;; both are a string plus a cursor and every input operation is the same code).
;;;
;;; The side-effect output is "wrote 2 lines\n"; the final list is auto-printed.
;;;   => ("alpha beta" (1 2 3) #t "S:xy" #t)
;;;
;;; NOTE the `let`: a top-level (define x (read-line ...)) would be hoisted with
;;; the other define inits and run BEFORE the commands that write the file.

(define path "/tmp/emit-demo-ports.txt")

;; write two lines, then close -- closing flushes, so the file is complete
(let ((out (open-output-file path)))
  (write-string "alpha beta" out)
  (newline out)
  (write-string "(1 2 3)" out)
  (newline out)
  (close-port out))
(display "wrote 2 lines")
(newline)

(let ((line #f) (datum #f) (at-eof #f) (accumulated #f) (same #f))
  ;; read it back: one line as text, the next as a DATUM through the same reader
  ;; the compiler itself uses, then confirm the port is at end of input
  (let ((in (open-input-file path)))
    (set! line (read-line in))
    (set! datum (read in))
    (set! at-eof (eof-object? (read in)))
    (close-port in))
  ;; a string port accumulates what was written to it
  (let ((sp (open-output-string)))
    (write-string "S:" sp)
    (write-char #\x sp)
    (display "y" sp)
    (set! accumulated (get-output-string sp)))
  ;; a file port and a string port answer identically for the same text
  (let ((ops (lambda (p) (list (read-char p) (read-line p)))))
    (set! same (equal? (ops (open-input-file path))
                       (ops (open-input-string "alpha beta
(1 2 3)
")))))
  (list line datum at-eof accumulated same))

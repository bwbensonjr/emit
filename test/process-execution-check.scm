;;; process-execution-check.scm -- one real-host probe of (emit process), shared by
;;; emit run and a standalone executable.  Each line it prints is compared exactly.
(import (scheme base) (scheme write) (emit process))

(define (show label value)
  (display label)
  (display " ")
  (write value)
  (newline))

(define (substring? needle haystack)
  (let ((n (string-length needle)) (h (string-length haystack)))
    (let loop ((i 0))
      (cond
        ((> (+ i n) h) #f)
        ((string=? needle (substring haystack i (+ i n))) #t)
        (else (loop (+ i 1)))))))

;; Arguments reach the child verbatim: no shell expands the space, $HOME, or *.
(show "verbatim" (run-program "printf" '("%s|" "a b" "$HOME" "*")))

;; Text written before a spawn precedes the child's on the shared stream.
(display "before")
(show "ordering" (run-program "printf" '("after")))

(show "exit-code" (run-program "sh" '("-c" "exit 3")))
(show "signal" (run-program "sh" '("-c" "kill -TERM $$")))

(call-with-values (lambda () (program-output "printf" '("%s\n" "one" "two")))
                  (lambda (status text) (show "captured" (list status text))))

(call-with-values (lambda () (program-output "sh" '("-c" "echo partial; exit 4")))
                  (lambda (status text) (show "captured-failure" (list status text))))

;; More than a pipe buffer: reading must finish before waiting.
(call-with-values (lambda ()
                    (program-output "sh"
                                    '("-c" "head -c 100000 /dev/zero | tr '\\000' x")))
                  (lambda (status text)
                    (show "large-capture" (list status (string-length text)))))

(show "missing-program"
      (guard (e ((file-error? e)
                 (list 'file-error
                       (substring? "no-such-program-xyz" (error-object-message e)))))
        (run-program "no-such-program-xyz" '())))

(show "bad-argument"
      (guard (e ((file-error? e) 'file-error) ((error-object? e) 'error))
        (run-program "echo" '(1))))

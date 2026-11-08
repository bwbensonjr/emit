;;; gen-scheme-base.ss -- compatibility entry for Chez-based generation callers.
;;; The shared implementation is tools/gen-scheme-base-body.ss. New callers use:
;;;   bash tools/gen-scheme-base.sh [OUT-ROOT] [--host emit|chez]
;;;   [--prelude PATH] [--declaration PATH] [--output-root PATH]
(import (chezscheme))

(define (shell-quote s)
  (string-append
    "'"
    (apply string-append
           (map (lambda (c) (if (char=? c #\') "'\\''" (string c))) (string->list s)))
    "'"))

(exit (system (string-append
                "bash tools/gen-scheme-base.sh --host chez"
                (apply string-append
                       (map (lambda (a) (string-append " " (shell-quote a)))
                            (command-line-arguments))))))

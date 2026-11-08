;;; Generated baked forms preserve the declared set and independent compilation.
(import (chezscheme))
(include "src/match.scm") (include "src/util.scm") (include "src/parse.ss")
(include "src/passes/expand.ss") (include "src/passes/recognize-let.ss")
(include "src/passes/convert-assignments.ss") (include "src/passes/simplify.ss")
(include "src/passes/convert-closures.ss") (include "src/passes/lower.ss")
(include "src/emit.ss") (include "src/prelude-surface.scm") (include "src/core.ss")
(define (read-all-from-string s)
  (let ([p (open-input-string s)])
    (let loop ([out '()])
      (let ([f (read p)])
        (if (eof-object? f) (reverse out) (loop (cons f out)))))))
(define (source-text path)
  (call-with-input-file path get-string-all))
(define source
  (apply string-append
    (map (lambda (e) (source-text (cadddr e))) (baked-library-entries))))
(define forms (read-baked-library-forms source))
(define checks 0)
(define (check name actual expected)
  (unless (equal? actual expected) (error 'baked-source name actual expected))
  (set! checks (+ checks 1)))
(define (rejects? thunk)
  (guard (e (#t #t)) (thunk) #f))
(check "generated names" (map cadr forms) (map car (baked-library-entries)))
(check "missing member rejected"
       (rejects? (lambda () (read-baked-library-forms ""))) #t)
(check "duplicate member rejected"
       (rejects? (lambda () (read-baked-library-forms (string-append source source)))) #t)
(define original-partition *prelude-libraries*)
(set! *prelude-libraries*
  (append original-partition
    '(((test baked) #t ((scheme base)) "lib/test/baked.sld")
      ((test disk) #f ((scheme base)) "lib/test/disk.sld"))))
(define extended-source
  (string-append source
    "(define-library (test baked) (import (scheme base)) (export answer) (begin (define answer 42)))"))
(define extended (read-baked-library-forms extended-source))
(check "additional baked member selected" (map cadr extended)
       (append (map cadr forms) '((test baked))))
(check "non-baked member excluded" (baked-member? '(test disk)) #f)
(check "wrong imports rejected"
       (rejects? (lambda ()
         (read-baked-library-forms (string-append source
           "(define-library (test baked) (export answer) (begin (define answer 42)))")))) #t)
(define compiled (compile-baked-set extended no-dump))
(check "extra member compiled" (map car (cdr compiled)) (map cadr extended))
(check "extra member exported" (and (assoc '(test baked) (cdr compiled)) #t) #t)
(set! *prelude-libraries* original-partition)
(define baked (compile-baked-set forms no-dump))
(define independent
  (let loop ([fs forms] [tables '()] [out '()])
    (if (null? fs) (reverse out)
      (let* ([dl (parse-define-library (car fs))]
             [r (compile-library (car dl) (dl-import-specs dl) (caddr dl) (cadddr dl)
                  (map (lambda (l) (table-of l tables)) (cadr dl)) no-dump)])
        (loop (cdr fs) (cons (cons (car dl) (cadr r)) tables) (cons r out))))))
(check "full interfaces agree" (map cdr (cdr baked)) (map cadr independent))
(check "full unit IR agrees" (car baked)
       (let loop ([irs (map car independent)])
         (if (null? (cdr irs)) (car irs)
           (string-append (car irs) *emit-unit-boundary* (loop (cdr irs))))))
(printf "baked generated sources: ~a checks passed\n" checks)

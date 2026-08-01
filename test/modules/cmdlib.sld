;;; cmdlib.sld -- a library whose body contains COMMANDS, not only definitions
;;; (change: library-body-declarations, issue #16).  R7RS 5.6.1: the commands in a
;;; `begin` declaration are part of the library's initialization.
;;;
;;; The shape is chosen so that BOTH properties are observable from an importer:
;;;   * the commands ran at all -- before this change they were dropped silently,
;;;     and `get` would answer 0;
;;;   * they ran in SOURCE ORDER interleaved with the definitions, not bundled
;;;     after them -- `log` records 1 then 2 with a define in between, and `bump`
;;;     (defined below the first command) is only callable by the second.
(define-library (cmdlib)
  (export get log-contents)
  (begin
    (define cell (%make-vector 1 0))
    (define log (%make-vector 2 0))

    ;; command 1: runs before `bump` is even defined, so it stores directly
    (%vector-set! cell 0 40)
    (%vector-set! log 0 1)

    (define (bump) (%vector-set! cell 0 (%+ (%vector-ref cell 0) 2)))

    ;; command 2: calls a procedure defined ABOVE it
    (bump)
    (%vector-set! log 1 2)

    (define (get) (%vector-ref cell 0))                       ; 42
    (define (log-contents) (%vector-ref log 0))))             ; 1

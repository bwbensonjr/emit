; (error who message irritant ...) reports a diagnostic and aborts the current
; computation via the runtime trap hook.  Standalone (no trap hook installed),
; the abort exits non-zero after printing "oops: no good 42" to stderr, rather
; than returning a value.
(define (g x) (error 'oops "no good" x))
(g 42)

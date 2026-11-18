;; A separately compiled writer closes over private library state.
(define-library (custom-writers fixture)
  (import (scheme base) (emit write))
  (export make-token)
  (begin
    (define-record-type token (make-token value) token? (value token-value))
    (define prefix "token:")
    (set-record-type-writer! (make-token #f)
      (lambda (object port mode recur)
        (display "[" port)
        (display prefix port)
        (recur (token-value object))
        (display "]" port)))))

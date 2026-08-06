;;; macro-dupname-lib.sld -- NEGATIVE fixture: one name bound both ways
;;; (change: library-macro-export, design D3).  `f` is bound by `define` and by
;;; `define-syntax`.  Because a hidden macro keyword and a top-level binding both
;;; mangle to @"macro.dupname.lib:f", the two would become indistinguishable in a
;;; compile-time interface, so the library is rejected by name.  Before this change
;;; the ambiguity was silent: collect-define-syntax lifted the transformer out and the
;;; export check saw only whichever one it looked for first.
(define-library (macro-dupname-lib)
  (export f)
  (begin
    (define (f x) (+ x 1))
    (define-syntax f
      (syntax-rules ()
        ((_ e) (+ e 2))))))

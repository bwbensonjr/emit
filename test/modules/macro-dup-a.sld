;;; macro-dup-a.sld -- one half of the same-spelling composition fixture
;;; (change: library-macro-export, risk R3).  Its exported macro's template calls a
;;; PRIVATE `helper`; macro-dup-b has a private `helper` of the same spelling and a
;;; different meaning.  A program importing both must reach each library's own
;;; binding: the two resolved symbols (@"macro.dup.a:helper" and
;;; @"macro.dup.b:helper") differ, and both must survive hygiene in the one importer
;;; whose `known` set they compose into.
(define-library (macro-dup-a)
  (export ma)
  (begin
    (define (helper x) (+ x 1))
    (define-syntax ma
      (syntax-rules ()
        ((_ e) (helper e))))))

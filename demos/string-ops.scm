; string/char accessors composed into one list value:
;   char->integer, string-length, string-ref, substring, string->symbol.
(cons (char->integer #\A)              ; 65
      (cons (string-length "abc")      ; 3
            (cons (string-ref "abc" 1) ; #\b
                  (cons (substring "hello" 1 4)          ; "ell"
                        (cons (string->symbol "foo")     ; foo
                              (quote ()))))))            ; => (65 3 #\b "ell" foo)

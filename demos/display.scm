; display: render ANY datum in display style -- strings without quotes, chars as
; the raw character -- and be memory-safe on non-strings (change:
; fix-display-non-string).  Each (display ...) writes with no quoting; the final
; bare expression is the program's value (printed write-style by the runtime).
(display 42)(display " ")
(display "str")(display " ")
(display #\z)(display " ")
(display (quote sym))(display " ")
(display (cons 1 2))(display " ")
(display (list "a" #\b 3))(display " ")
(quote done)

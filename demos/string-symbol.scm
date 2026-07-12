; string->symbol interns: the symbol built from "foo" is eq? to the literal 'foo.
(eq? (string->symbol "foo") (quote foo))   ; => #t

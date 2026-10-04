;;; prog-expr-cond-none.scm -- an expression cond-expand with no satisfied clause still compiles. => 1
(begin (cond-expand (no-such-feature 'x)) 1)

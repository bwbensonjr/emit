;;; prog-lib-malformed.scm -- a (library ...) requirement whose name is not a library name is malformed.
(cond-expand ((library srfi-8) 1) (else 2))

; strings and characters as self-evaluating literals inside quoted structure,
; materialized (rt_cons over rt_make_string / rt_make_char) and printed.
(quote (a "b" #\c))                    ; => (a "b" #\c)

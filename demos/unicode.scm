; Unicode round-trip: a non-ASCII string (UTF-8 bytes) and a non-ASCII char
; (codepoint) stored and printed with their bytes intact.
(quote ("héllo 日本語" #\λ))            ; => ("héllo 日本語" #\λ)

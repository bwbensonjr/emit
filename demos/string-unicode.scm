; codepoint-indexed string ops over non-ASCII text (not byte offsets):
;   length counts codepoints, ref returns the nth character, substring is a
;   codepoint range whose UTF-8 bytes are preserved.
(cons (string-length "héllo")          ; 5 codepoints (not 6 bytes)
      (cons (string-ref "héllo" 1)     ; #\é (not a stray continuation byte)
            (cons (substring "日本語" 0 2)  ; "日本"
                  (quote ()))))        ; => (5 #\é "日本")

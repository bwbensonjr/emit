; In-place string mutation (openspec string-mutation): string-set! splices the
; UTF-8 buffer and rewrites the string object's length/pointer words in place
; (identity preserved, so aliases see the change), plus string-copy for a
; safely-independent duplicate.  One list result:
;   => ("aba" (2 #\é) #\y #\x)
(list
 (let ((s (make-string 3 #\a))) (string-set! s 1 #\b) s)                ; set in place  -> "aba"
 (let ((s (make-string 2 #\a)))                                        ; ASCII -> multibyte
   (string-set! s 0 #\é) (list (string-length s) (string-ref s 0)))    ; length stays 2 -> (2 #\é)
 (let* ((s (make-string 1 #\x)) (t s))                                 ; t aliases s
   (string-set! s 0 #\y) (string-ref t 0))                            ; alias sees it  -> #\y
 (let* ((s (make-string 1 #\x)) (c (string-copy s)))                   ; c is a copy
   (string-set! c 0 #\z) (string-ref s 0)))                           ; original intact -> #\x

; Bytevector data type (openspec bytevectors): tag-7 HDR_BYTEVECTOR heap object
; with a separate packed-byte buffer -- make-bytevector/bytevector-u8-ref/
; bytevector-u8-set!/bytevector-length/bytevector?, the prelude bytevector
; constructor + list->bytevector, printing as #u8(...), byte-wise equal?, and the
; #u8(...) reader syntax.  One list result pins down every case:
;   => (20 4 255 #t #f #u8(1 2 3) #t #f 9)
(list
 (bytevector-u8-ref (bytevector 10 20 30) 1)                 ; construct + index -> 20
 (bytevector-length (make-bytevector 4 0))                   ; length            -> 4
 (let ((bv (make-bytevector 2 0)))
   (bytevector-u8-set! bv 0 255) (bytevector-u8-ref bv 0))   ; mutate            -> 255
 (bytevector? (bytevector 1))                                ; predicate (yes)   -> #t
 (bytevector? (vector 1))                                    ; predicate (no)    -> #f
 (bytevector 1 2 3)                                          ; prints #u8(1 2 3) -> #u8(1 2 3)
 (equal? (bytevector 1 2 3) (bytevector 1 2 3))              ; byte-wise equal?  -> #t
 (equal? (bytevector 1 2 3) (bytevector 1 2 4))              ; unequal           -> #f
 (bytevector-u8-ref (read-from-string "#u8(7 8 9)") 2))      ; reader #u8(...)   -> 9

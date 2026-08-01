; Integer literals across the top of the fixnum range must survive being encoded
; (GitHub issue #7).  The tagged word is d<<3, and computing that product in the
; compiler's own fixnums overflows at 2^57 -- so before the fix these printed
; wrapped garbage under the self-hosted compiler while the Chez-hosted build got
; them right.  Both signs, since the sign is handled on the digit string.
(list 72057594037927936        ; 2^56 -- the last one the old code got right
      144115188075855872       ; 2^57 -- the old cliff
      576460752303423488       ; 2^59
      1152921504606846975      ; 2^60 - 1, the largest fixnum
      -576460752303423488
      -1152921504606846975)

;;; prog-both.scm -- import two libraries whose internals collide by name. => 43
(import (liba))
(import (libb))
(+ (a-val) (b-val))    ; 16 + 27 = 43

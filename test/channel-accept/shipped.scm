;;; Installed acceptance: shipped libraries outside the baked set.
(import (scheme base) (scheme write) (scheme char) (scheme cxr) (emit list))
(display (if (and (char=? (char-upcase #\a) #\A) (eq? (caddr '(x y z)) 'z))
             (fold-right + 39 (iota 3))
             'failed))

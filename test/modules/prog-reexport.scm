;;; a macro reaching a program through a RE-EXPORT (issue #55 prerequisite)
(import (reexport-lib))
(+ (twice 5) (thrice 5))     ; helper(%inc 5) = (5+1)*3 = 18, twice => 36

;;; Installed acceptance: JIT run and AOT build of a program with a non-baked import.
(import (scheme base) (scheme inexact) (scheme write))
(display (exact (round (* (sqrt 4.0) 21))))

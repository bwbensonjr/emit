(import (emit list))
(list (filter even? '(1 2 3 4))
      (fold-right cons '() '(1 2 3))
      (iota 3))

(import (scheme base) (composition internal definitions))

(define (program-result)
  (define (callback . args) args)
  (callback 4 5))

(list (internal-definition-results) (program-result))

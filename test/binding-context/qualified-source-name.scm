(import (prefix (scheme base) b:)
        (rename (only (scope owner) token) (token imported-x)))
(b:define scope.owner:state 99)
(b:write (b:list imported-x scope.owner:state))

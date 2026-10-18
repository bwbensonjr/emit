;;; write.sld -- ordinary R7RS-small graph-writing library.
(define-library (scheme write)
  (import (scheme base))
  (export display write write-simple write-shared)
  (begin
    ;; Re-export the integrated bindings rather than minting different locations
    ;; for the same procedures. Base also publishes these as Emit extensions.
    (define (write-simple obj . port)
      (if (null? port) (%write-simple obj) (%write-simple-port obj (car port))))
    (define (write-shared obj . port)
      (if (null? port) (%write-shared obj) (%write-shared-port obj (car port))))))

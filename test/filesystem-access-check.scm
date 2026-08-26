;;; filesystem-access-check.scm -- one real-host probe shared by emit run and AOT.
(import (scheme base)
        (scheme file)
        (scheme process-context)
        (emit filesystem))

(define (check name value)
  (if value
      #t
      (error 'filesystem-access-check name)))

(define (path-join dir name)
  (string-append dir "/" name))

(define (string-member? value values)
  (cond
    ((null? values) #f)
    ((string=? value (car values)) #t)
    (else (string-member? value (cdr values)))))

(define (read-file path)
  (call-with-input-file
    path
    (lambda (port)
      (let ((text (read-string 100 port)))
        (if (eof-object? text) "" text)))))

(define arguments (cdr (command-line)))
(check "expected one fixture path" (= (length arguments) 1))
(define root (car arguments))
(define empty (path-join root "empty"))
(define real (path-join root "real"))
(define ordinary (path-join root "ordinary.scm"))
(define linked (path-join root "linked"))
(define dangling (path-join root "dangling"))
(define missing (path-join root "missing"))
(define source (path-join root "replacement.tmp"))
(define target (path-join root "target.scm"))

(define entries (directory-list root))
(check "directory-list returns a proper list" (list? entries))
(check "directory-list returns bare strings"
       (and (= (length entries) 7)
            (string-member? "empty" entries)
            (string-member? "real" entries)
            (string-member? "ordinary.scm" entries)
            (string-member? "linked" entries)
            (string-member? "dangling" entries)
            (string-member? "replacement.tmp" entries)
            (string-member? "target.scm" entries)
            (not (string-member? "." entries))
            (not (string-member? ".." entries))))
(check "an empty directory has an empty successful listing"
       (null? (directory-list empty)))
(check "an ordinary file is neither directory nor link"
       (and (not (file-directory? ordinary))
            (not (file-symbolic-link? ordinary))))
(check "an ordinary directory is not a link"
       (and (file-directory? real)
            (not (file-symbolic-link? real))))
(check "a linked directory has both classifications"
       (and (file-directory? linked)
            (file-symbolic-link? linked)))
(check "a dangling link remains a link"
       (and (not (file-directory? dangling))
            (file-symbolic-link? dangling)))
(check "a missing path is an ordinary negative classification"
       (and (not (file-directory? missing))
            (not (file-symbolic-link? missing))))
(check "listing a missing path raises a file error"
       (file-error?
         (guard (condition (else condition))
           (directory-list missing))))
(check "listing a file raises a file error"
       (file-error?
         (guard (condition (else condition))
           (directory-list ordinary))))
(check "a wrong path type is catchable"
       (error-object?
         (guard (condition (else condition))
           (directory-list 1))))
(check "a wrong wrapper arity is catchable"
       (error-object?
         (guard (condition (else condition))
           (directory-list))))

(define replacement-result (replace-file source target))
(check "replace-file returns unspecified"
       (eq? replacement-result (if #f #f)))
(check "replacement moves the source name"
       (and (not (file-exists? source))
            (file-exists? target)
            (string=? (read-file target) "replacement\n")))
(check "failed replacement raises a file error"
       (file-error?
         (guard (condition (else condition))
           (replace-file missing target))))
(check "failed replacement preserves the destination"
       (string=? (read-file target) "replacement\n"))

(display "filesystem access: ok\n")

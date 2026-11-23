;;; filesystem.sld -- narrow non-standard host filesystem operations.
(define-library (emit filesystem)
  (import (scheme base))
  (export
    directory-list file-directory? file-symbolic-link? replace-file create-directory
    delete-directory)
  (begin
    ;; Match the kinded failures produced by (scheme file), while keeping these
    ;; non-standard wrappers outside the standard library's declared surface.
    (define (filesystem-error who message irritants)
      (raise (%make-error-object/kind (string-append (symbol->string who) ": " message)
                                      irritants
                                      'file)))

    (define (directory-list path)
      (let ((entries (%filesystem-directory-list path)))
        (if entries
            entries
            (filesystem-error 'directory-list "cannot list directory" (list path)))))

    (define (file-directory? path)
      (let ((status (%filesystem-directory-status path)))
        (cond
          ((= status 1) #t)
          ((= status 0) #f)
          (else
            (filesystem-error 'file-directory? "cannot classify path" (list path))))))

    (define (file-symbolic-link? path)
      (let ((status (%filesystem-symlink-status path)))
        (cond
          ((= status 1) #t)
          ((= status 0) #f)
          (else (filesystem-error 'file-symbolic-link?
                                  "cannot classify path"
                                  (list path))))))

    (define (replace-file source destination)
      (if (%filesystem-replace-file source destination)
          (if #f #f)
          (filesystem-error 'replace-file
                            "cannot replace file"
                            (list source destination))))

    ;; One directory, no parents, and an error when the path exists: a success
    ;; proves this caller created it (change: emit-pkg).
    (define (create-directory path)
      (if (%filesystem-create-directory path)
          (if #f #f)
          (filesystem-error 'create-directory "cannot create directory" (list path))))

    ;; An empty directory, or with RECURSIVE? a whole tree.  A symbolic link is
    ;; never followed: as PATH it is an error, and inside the tree it is unlinked.
    (define (delete-directory path . recursive?)
      (if
        (%filesystem-delete-directory path (and (pair? recursive?) (car recursive?) #t))
        (if #f #f)
        (filesystem-error 'delete-directory "cannot delete directory" (list path))))))

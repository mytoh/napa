
(library (napa cli)
  (export
    runner)
  (import
    (silta base)
    (silta write)
    (silta file)
    (napa))

  (begin

    (define (runner args)
      (cond
        ((directory-git?)
         (display  (git (cdr args))))
        ((file-exists?  ".hg")
         (hg  (cdr args)))
        ((file-exists?  ".svn")
         (svn (cdr args)))
        ((file-exists?  "CVS")
         (cvs (cdr args)))
        ((file-exists?  "_darcs")
         (darcs (cdr args)))
        (else
          (git (cdr args)))))

    ))

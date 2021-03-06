

(library (napa darcs)
  (export darcs)
  (import
    (silta base)
    (match)
    (only (srfi :13 strings)
      string-join)
    (mosh process))

  (begin
  (define (darcs args)
    (cond
      ((null? args)
       (call-process "darcs"))
      (else
        (match (car args)
          ("up"
           (call-process (string-join '("darcs" "pull"))))
          (_
            (call-process (string-join `("darcs" ,@args))))))))) 



  )


(define (for-each proc items)
    (if (null? items)
        #t
        (begin      (proc (car items) )
                    (for-each proc (cdr items) )
        )
    )
)

;; tests
(for-each 
 (lambda (x) (newline) (display x))
 (list 57 321 88))

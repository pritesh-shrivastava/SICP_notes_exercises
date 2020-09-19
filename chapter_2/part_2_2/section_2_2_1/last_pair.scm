(define (last-pair l)
    (if (null? (cdr l))  ;; Non empty list
        (cons (car l) '()) ;; or simply, l
        (last-pair (cdr l))
    )
)

;; testing
(last-pair (list 23 72 149 34))

;; tail-recursive reverse
(define (reverse items) 
    (define (loop items acc) 
        (if (null? items) 
            acc 
            (loop (cdr items) (cons (car items) acc))
        )
    )   
    (loop items '())
)


(define (deep-reverse l)
    (define (loop items acc) 
        (cond   ((null? items) acc)
                (   (pair? (car items)) 
                    (loop (cdr items) (cons (deep-reverse (car items)) acc) )
                )
                (else (loop (cdr items) (cons (car items) acc)) )
        )
    )
    (loop l '())
)


;; testing
(define x (list (list 1 2) (list 3 4)))

(reverse x)

(deep-reverse x)

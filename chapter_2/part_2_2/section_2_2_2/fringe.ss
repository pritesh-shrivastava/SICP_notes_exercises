(define (append list1 list2)
    (if (null? list1)
        list2
        (cons   (car list1) 
                (append (cdr list1) 
                        list2
                )
        )
    )
)


(define (fringe l)
    (define (loop items acc) 
        (cond   ((null? items) acc)
                (   (not (pair? (car items)))
                    (loop (cdr items)   (append acc 
                                                (list (car items)) 
                                        ) 
                    )
                ) 
                (else   (loop (cdr items) (append   acc 
                                                    (fringe (car items))) 
                        )
                )
        )
    )
    (loop l '())
)



;; testing
(define x 
  (list (list 1 2) (list 3 4))
)

(fringe x)

(fringe (list x x))
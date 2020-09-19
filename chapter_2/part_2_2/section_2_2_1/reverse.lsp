(define (append list1 list2)
    (if (null? list1)
        list2
        (cons (car list1) 
            (append (cdr list1) 
                    list2
            )
        )
    )
)


(define (reverse l)
    (if (null? l)
        l
        (append (reverse (cdr l))  
                (cons (car l) '()) 
        )
    )
)

(reverse (list 1 4 9 16 25))


;; Alternate tail recursive solution that doesn't require append
;; We just keep adding elements to an accumulator
;  (define (reverse items) 
;   (define (loop items acc) 
;     (if (null? items) 
;         acc 
;         (loop (cdr items) (cons (car items) acc)))) 
;  
;   (iter items '())) 
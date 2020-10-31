(define (subsets s)
  (if (null? s)
      (list '())
      (let 
        ( (rest (subsets (cdr s))) )
        (append rest 
                (map    (lambda (x) (cons (car s) x)) 
                        rest
                )
        )
      )
  )
)

;; Why this works ? Look at the example given in the question of the set (1, 2, 3)
;; You remove 1 and create all subsets using 2 & 3.
;; Then cons 1 to each element of the above list and append this new list
;; The set of all subsets of a given set is the union of:
;; 1) the set of all subsets excluding the first number.
;; 2) the set of all subsets excluding the first number, with the first number re-inserted into each subset. 
;; testing
(subsets (list 1 2 3))

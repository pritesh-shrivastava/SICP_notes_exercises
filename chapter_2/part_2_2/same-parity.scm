(define (same-parity x . y)
    ;; Finds the list of elements in y with same parity as x
    (define (same-parity-rest y)  
        (cond 
            (
                (null? y) '()
            )
            (
                (parity-2 (car y)  x)
                (cons (car y) (same-parity-rest (cdr y)) )  
            )
            (
                else            ;;(car y)  has  different parity than  x..
                (same-parity-rest (cdr y))
            )
        )
    )

    ;; Check if 2 integers have same parity
    (define (parity-2 a b)
        (= (remainder (+ a b) 2) 0)  ;; is thier sum even ?
    )

    ;; Combine the result
    (cons x (same-parity-rest y))
)

;; tests
(same-parity 1 2 3 4 5 6 7)

(same-parity 2 3 4 5 6 7)

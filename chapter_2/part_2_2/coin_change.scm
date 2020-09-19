(define (cc amount coin-values)
    (cond 
        (
            (= amount 0) 
            1  ;; Since there is no change left, we have 1 solution!
        )
        (
            (or (< amount 0) (no-more? coin-values)) 
            0  ;; We dont have a solution if we don't have any more coins or a negative amount
        )
        (
            else
            (+  
                ;; No of ways to make change without the 1st coin type + 
                (cc 
                    amount
                    (except-first-denomination coin-values)
                )  
                ;; No of ways to make change after using the first coin
                (cc 
                    (- amount (first-denomination coin-values))
                    coin-values
                )
            )
        )
    )
)


;; Helper functions

(define (first-denomination coin-values)
    (car coin-values)
)

(define (except-first-denomination coin-values)
    (cdr coin-values)
)

(define (no-more? coin-values)
    (null? coin-values)
)

;; For testing
(define us-coins 
  (list 50 25 10 5 1)
)

(define uk-coins 
  (list 100 50 20 10 5 2 1 0.5)
)

;; Tests
(cc 10 us-coins)
(cc 100 us-coins)

;; Decreasing order for list of coin values seems to be intuitive
;; But order of coins does not matter as we are computing all possibilities
(cc 100 (list 1 5 10 25 50)) 

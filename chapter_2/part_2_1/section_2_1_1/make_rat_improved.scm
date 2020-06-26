;; Constructor
;; Euclid's algorithm for GCD
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;; Handle both positive & negative arguments
(define (make-rat n d)
    (define pos_n (abs n))
    (define pos_d (abs d))
    ;; Had to define pos_n and pos_d earlier as definitions in let can't build on top of each otherx
    ;; After definitions in let, there can only be 1 expression, like if here !!
    (let 
        (  
          (g (gcd pos_n pos_d))
          (neg_n (* -1 pos_n))
        )
        (if (> (* n d) 0)
            (cons (/ pos_n g) (/ pos_d g))
            (cons (/ neg_n g) (/ pos_d g))
        )
    )
)

;; For testing
;; Selectors
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x))
)

(print-rat (make-rat -1 2))
(print-rat (make-rat -1 -2))
(print-rat (make-rat 1 -2))
(print-rat (make-rat 1 2))
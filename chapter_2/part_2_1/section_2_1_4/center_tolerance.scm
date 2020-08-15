;; Original abstraction of an interval with high & low bounds
;;; Interval constructor
(define (make-interval a b) 
    (cons a b)
)
;;; Interval selectors
;; We are not validatiing user input in the construcor, ie a > b,
;; hence, this is safer
(define (upper-bound i) 
    (max (car i) (cdr i))
) 
(define (lower-bound i) 
    (min (car i) (cdr i))
) 

;; New abstraction with center & width
(define (make-center-width c w)
  (make-interval (- c w) (+ c w))
)
;;; Width of an interval
(define (width i)
    (/  (-  (upper-bound i) 
            (lower-bound i)
        )
        2
    )
)
;;; Center selector
(define (center i)
    (   /   (+  (lower-bound i) 
                (upper-bound i)
            ) 
        2
    )
)
;; But this abstraction is not needed. Percentage tolerance is needed in place of width
;; Percent tolerance of an interval = Width / Center
;;; Constructor with center & pct tolerance, on top of interval abstraction
(define (make-center-percent c p)
    (make-interval  (- c (/ (* c p)
                            100)
                    ) 
                    (+ c (/ (* c p)
                            100)
                    )
    )
)
;; Center selector is the same as above, built on top of interval abstraction
;; Percent tolerance selector, built on top of interval abstraction
(define (percent i)
    (*  100 
        (/ (width i) (center i)
        )
    )
)

;; Testing
;;; Print interval
(define (display-interval i) 
   (newline) 
   (display "[") 
   (display (lower-bound i)) 
   (display ",") 
   (display (upper-bound i)) 
   (display "]")
)
;; Display test case
(display-interval (make-center-percent 10 10))
;; Test case of multiplication of intervals with small % tolerances
(define i (make-center-percent 10 1)) 
(define j (make-center-percent 20 2))
;;; Multiplication of intervals
(define (mul-interval x y)
    (let 
        (
            (p1 (* (lower-bound x) 
                   (lower-bound y)))
            (p2 (* (lower-bound x) 
                   (upper-bound y)))
            (p3 (* (upper-bound x) 
                   (lower-bound y)))
            (p4 (* (upper-bound x) 
                   (upper-bound y)))
        )
        (   make-interval   (min p1 p2 p3 p4)
                            (max p1 p2 p3 p4)
        )
    )
)
(percent (mul-interval i j)) 

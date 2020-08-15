;; Interval abstraction
;;; Interval constructor
(define (make-interval a b) 
    (cons a b)
)
;;; Interval selectors
;; If upper and lower bounds are provided to the constructor in order :
; (define (lower-bound i) (car i))
; (define (upper-bound i) (cdr i))
;; However, we are not validatiing user input in the construcor, hence,
;; this is safer
(define (upper-bound i) 
    (max (car i) (cdr i))
) 
(define (lower-bound i) 
    (min (car i) (cdr i))
) 

;; Operations on intervals
;;; Addition
(define (add-interval x y)
    (make-interval  (+  (lower-bound x) 
                        (lower-bound y))
                    (+  (upper-bound x) 
                        (upper-bound y))
    )
)
;;; Substraction of intervals
(define (sub-interval x y)
    (make-interval  (-  (lower-bound x) 
                        (upper-bound y))
                    (-  (upper-bound x) 
                        (lower-bound y))
    )
)
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
;;; Division of intervals
(define (div-interval x y)
    (mul-interval   x 
                    (make-interval 
                        (/ 1.0 (upper-bound y)) 
                        (/ 1.0 (lower-bound y))
                    )
    )
)


;; For testing
;;; Print interval
(define (display-interval i) 
   (newline) 
   (display "[") 
   (display (lower-bound i)) 
   (display ",") 
   (display (upper-bound i)) 
   (display "]")
)

;; Testing 
 (define i (make-interval 2 7)) 
 (define j (make-interval 8 3)) 
  
 (display-interval i) 
 (display-interval (sub-interval i j)) 
 (display-interval (sub-interval j i))

;; Width of a interval
(define (width i)
    (/  (-  (upper-bound i) 
            (lower-bound i)
        )
        2
    )
)

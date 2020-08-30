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

;; Width of an interval
(define (width i)
    (/  (-  (upper-bound i) 
            (lower-bound i)
        )
        2
    )
)

;; Division of interval with 0 span handling
(define (div-interval2 x y)
    (if   
        (or (<  (*  (lower-bound x) (upper-bound x))
                0
            )
            (<  (*  (lower-bound y) (upper-bound y))
                0
            )
        )
        (error "One or more intervals crossing zero." )
        (div-interval x y)
    )
)
;; testing 0 span interval
(define r1 (make-interval 100.0 101.0))
(define r2 (make-interval -0.2 0.3))
(define r3 (div-interval2 r1 r2))


(define (mul-interval2 x y) 
   (define (positive? x) (>= x 0)) 
   (define (negative? x) (< x 0)) 
   (let ((xl (lower-bound x)) 
         (xu (upper-bound x)) 
         (yl (lower-bound y)) 
         (yu (upper-bound y))) 
     (cond ((and (positive? xl) (positive? yl)) 
            (make-interval (* xl yl) (* xu yu))) 
           ((and (positive? xl) (negative? yl)) 
            (make-interval (* xu yl) (* (if (negative? yu) xl xu) yu))) 
           ((and (negative? xl) (positive? yl)) 
            (make-interval (* xl yu) (* xu (if (negative? xu) yl yu)))) 
           ((and (positive? xu) (positive? yu)) 
            (let ((l (min (* xl yu) (* xu yl))) 
                  (u (max (* xl yl) (* xu yu)))) 
              (make-interval l u))) 
           ((and (positive? xu) (negative? yu)) 
            (make-interval (* xu yl) (* xl yl))) 
           ((and (negative? xu) (positive? yu)) 
            (make-interval (* xl yu) (* xl yl))) 
           (else 
            (make-interval (* xu yu) (* xl yl)))))) 
  
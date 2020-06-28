;; Representing point as a pair
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

;; Operations with points
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
)

(define (average-points a b)
    ;; Helper function 
    (define (average x y)
        (/ (+ x y)
           2
        )
    )
    ;; Return the average point
    (make-point 
        (average (x-point a)
                 (x-point b)
        )
        (average (y-point a)
                 (y-point b)
        )
    )
)

;; Testing
(print-point (make-point 1 2))

;; Representing a line-segment
(define (make-segment a b) (cons a b))
(define (start-segment l) (car l))
(define (end-segment l) (cdr l))

;; Operations on line-segmen
;; Calculate Mid-Point of a line segment l to return a point m
(define (midpoint-segment l)
;; Valid solution but it doesn't use 2 layers of abstraction
;; An operation on the line segment is using the represenation of points
;; If the representation of points changes, this operation on line-segment will also change
;    (make-point 
;        (average (x-point (start-segment l))
;                 (x-point (end-segment l))
;        )
;        (average (y-point (start-segment l))
;                 (y-point (end-segment l))
;        )
;    )
;; Better solution uses the operations on points rather than their underlying representation
    (average-points (start-segment l)
                    (end-segment l)
    )
)




;; Testing the midpoint-segment procedure
;; Defining a variable to "store" the segment even though it's not needed !!
;; Everything is functional !!
(define seg (make-segment   
                (make-point 1 2)
                (make-point 3 4)
            )
)
(print-point (midpoint-segment seg))

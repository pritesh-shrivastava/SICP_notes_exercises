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

(define (distance-bet-points a b)
    (sqrt                           ;; sqrt is pre-defined
        (+  (square (- (x-point a)  ;; square is pre-defined
                       (x-point b)
                    )
            )
            (square (- (y-point a)
                       (y-point b)
                    )
            )        
        )
    )
)

;; Testing
(print-point (make-point 1 2))

;; Representing a line-segment
(define (make-segment a b) (cons a b))
(define (start-segment l) (car l))
(define (end-segment l) (cdr l))

;; Operations on line-segment
(define (midpoint-segment l)
    (average-points (start-segment l)
                    (end-segment l)
    )
)

(define (length-seg l)
    (distance-bet-points (start-segment l)
                         (end-segment l)
    )
)

;; Rectangle - Represenation I - Points
;; Constructor - I
(define (rectange a b c d)  
    ...
)
;; Selectors - I


;; Rectangle - Representation II - line segments 
;; Constructor - II
(define (rectange a b c d)
    ...
)

;; Selectors - II


;; Operations on rectangles
(define (perimeter r)
    ;; 2 * (l+b)
)

(define (area r)
    ;; l * b
)
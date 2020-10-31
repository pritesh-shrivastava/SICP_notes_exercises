;; Binary mobile constructor
(define (make-mobile left right)
  (list left right))

;; Branch selectors for a mobile
(define (left-branch mobile)
  (car mobile)
)

(define (right-branch mobile)
  (car (cdr mobile)) ;; cons left ( cons right '())
)

;; Mobile branch constructor
(define (make-branch length structure)
  (list length structure))

;; Branch component selectors
(define (branch-length branch)
  (car branch)
)

(define (branch-structure branch)
  (car (cdr branch))
)

;; create a function to calc the total weight of a mobile using the above selectors
(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))
  )
)

;; helper function to calc the weight of a branch
(define (branch-weight branch)
  (let 
    (( struct (branch-structure branch)))
    (if (pair? struct)
        (total-weight struct)
        struct
    )
  )
)

;; for testing
(define m1 (make-mobile 
             (make-branch 4 6) 
             (make-branch 5 
                          (make-mobile 
                           (make-branch 3 7) 
                           (make-branch 9 8))))) 
  
 ;;          4  |  5 
 ;;        +----+-----+ 
 ;;        6        3 |     9 
 ;;               +---+---------+ 
 ;;               7             8 
 ;; weight of m1 -> 21
 
(total-weight m1) 
 
;; torque of a branch
(define (branch-torque branch)
  (* (branch-length branch)
     (branch-weight branch)
  )
)

(define (is_balanced mobile)
  (if (pair? mobile)
      (and  (= (branch-torque (left-branch mobile))
              (branch-torque (right-branch mobile))
            )
            (is_balanced (branch-structure (left-branch mobile)))
            (is_balanced (branch-structure (right-branch mobile)))
      )
      #t
  )
)

;; testing
(is_balanced m1)

;; Another example for testing
(define m2 (make-mobile 
             (make-branch 4 6) 
             (make-branch 2 
                          (make-mobile 
                           (make-branch 5 8) 
                           (make-branch 10 4))))) 
  
 ;;          4  | 2 
 ;;        +----+--+ 
 ;;        6    5  |    10 
 ;;          +-----+----------+ 
 ;;          8                4 
(is_balanced m2)  

;; We are assuming non-null mobiles. Check alt solutions here : http://community.schemewiki.org/?sicp-ex-2.29
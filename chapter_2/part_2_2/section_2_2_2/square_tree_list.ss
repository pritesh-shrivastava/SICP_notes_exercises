;; Square list - recursion
(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list (cdr items)) )
  )
)

;; Square list - with higher order function map
(define (square-list items)
  (map (lambda (x) (* x x)) items)
)

;; Square tree - recursion
(define (square-tree-rcrsn tree)
  (cond (
          (null? tree) '())
          ((pair? (car tree)) (cons (square-tree-rcrsn (car tree)) 
                                    (square-tree-rcrsn (cdr tree)) 
                              ) 
          )
          (else (cons (square (car tree)) 
                      (square-tree-rcrsn (cdr tree))
                )   
          )
  )
)

;; Square tree - with map
(define (square-tree-map tree)
  (map  (lambda (x) 
                (if (pair? x)
                    (square-tree-map x)
                    (square x)
                )
        ) 
        tree
  )
)

;; testing
(square-tree-rcrsn
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7))
)

(square-tree-map
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7))
)

;; Abstraction of tree procedure as tree-map
(define (tree-map f tree)
  (map  (lambda (x) 
                (if (pair? x)
                    (tree-map f x)
                    (f x)
                )
        ) 
        tree
  )
)

;; Re-implementing square-tree as the application of higher order function tree-map
(define (square-tree-abst tree) 
  (tree-map square tree)
)

(square-tree-abst
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7))
)

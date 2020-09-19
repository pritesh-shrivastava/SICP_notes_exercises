## Hierarchical Structures

Counting the no of leaves / nodes in a nested list / tree :
```
(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))
  )
)
```
vs Length - which only counts no of elements at the top level, & ignores nesting :
```
(define (length x)
    (if (null? x) 
        0
        (+ 1 (length (cdr x))
    )
)
```

#### Ex2.24

Suppose we evaluate the expression (list 1 (list 2 (list 3 4))). Give the result printed by the interpreter, the corresponding box-and-pointer structure, and the interpretation of this as a tree.

_Solution_ : 
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

Scale the elements of a nested list / tree by a constant factor :
```
(define (scale-tree tree factor)
    (cond ((null? tree) nil)
          ((not (pair? tree)) (* tree factor))
          (else
            (cons   (scale-tree (car tree) factor)
                    (scale-tree (cdr tree) factor))
          )
    )
)
```
Alternative way
```
(define (scale-tree tree factor)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (scale-tree sub-tree factor)
             (* sub-tree factor)))
       tree)
)
```
#### Ex2.24

Suppose we evaluate the expression `(list 1 (list 2 (list 3 4)))`. Give the result printed by the interpreter, the corresponding box-and-pointer structure, and the interpretation of this as a tree.

_Solution_ : 
```
                            (1, (2, (3, 4)))
                        1           (2, (3, 4))
                                2       (3, 4)
                                        3    4    
```

#### Ex2.25

Give combinations of cars and cdrs that will pick 7 from each of the following lists:
```
(define x (list 1 3 (list 5 7) 9))
(define y (list (list 7)))
(define z (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
```

_Solution_ : Checking solution at Scheme command line interpreter (For explanation, check [here](http://community.schemewiki.org/?sicp-ex-2.25)) :

Beware of the extra `car` at the end : (It's a list, not a simple pair of cons)
```
(car (cdr (car (cdr (cdr x)))))
```
Simpler for y :
```
(car (car y))
```
This is wrong:
~(cdr (cdr (cdr (cdr (cdr (cdr z))))))~
as they are not simple pairs, but lists. There is nil as well!
So we need to add some `car`s too!
```
z ->(cons   
        1 
        (cons   
            2 
            (cons   
                3 
                (cons 
                    4 
                    (cons 
                        5 
                        (cons 
                            6 
                            (cons 
                            7 
                            nil
                            )
                        ) 
                        nil
                    ) 
                    nil
                ) 
                nil
            ) 
            nil
        ) 
        nil
    )
7 => (car (cdr (car (cdr (car ( cdr (car (cdr (car (cdr (car (cdr z))))))))))))
```

#### Ex2.26

Suppose we define x and y to be two lists:
```
(define x (list 1 2 3))
(define y (list 4 5 6))
```
What result is printed by the interpreter in response to evaluating each of the following expressions:
```
(append x y)
(cons x y)
(list x y)
```

_Solution_ : Fairly non-intuitive. Have to look at the details : 
```
1 ]=> (append x y)

;Value: (1 2 3 4 5 6)

1 ]=> (cons x y)

;Value: ((1 2 3) 4 5 6)

1 ]=> (list x y)

;Value: ((1 2 3) (4 5 6))
```

#### Ex2.27

Modify your reverse procedure of Exercise 2.18 to produce a deep-reverse procedure that takes a list as argument and returns as its value the list with its elements reversed and with all sublists deep-reversed as well. For example,
```
(define x 
  (list (list 1 2) (list 3 4)))

x
((1 2) (3 4))

(reverse x)
((3 4) (1 2))

(deep-reverse x)
((4 3) (2 1))
```

_Solution_ : Check script _deep_reverse.scm_ .

#### Ex2.28

Write a procedure fringe that takes as argument a tree (represented as a list) and returns a list whose elements are all the leaves of the tree arranged in left-to-right order. For example,
```
(define x 
  (list (list 1 2) (list 3 4)))

(fringe x)
(1 2 3 4)

(fringe (list x x))
(1 2 3 4 1 2 3 4)
```

_Solution_ : Check script _fringe.ss_ .


#### Ex2.29

A binary mobile consists of two branches, a left branch and a right branch. Each branch is a rod of a certain length, from which hangs either a weight or another binary mobile. We can represent a binary mobile using compound data by constructing it from two branches (for example, using list):
```
(define (make-mobile left right)
  (list left right))
```
A branch is constructed from a length (which must be a number) together with a structure, which may be either a number (representing a simple weight) or another mobile:
```
(define (make-branch length structure)
  (list length structure))
```
1. Write the corresponding selectors left-branch and right-branch, which return the branches of a mobile, and branch-length and branch-structure, which return the components of a branch.
2. Using your selectors, define a procedure total-weight that returns the total weight of a mobile.
3. A mobile is said to be balanced if the torque applied by its top-left branch is equal to that applied by its top-right branch (that is, if the length of the left rod multiplied by the weight hanging from that rod is equal to the corresponding product for the right side) and if each of the submobiles hanging off its branches is balanced.
Design a predicate that tests whether a binary mobile is balanced. 
4. Suppose we change the representation of mobiles so that the constructors are
```
(define (make-mobile left right)
    (cons left right))

(define (make-branch length structure)
    (cons length structure))
```
How much do you need to change your programs to convert to the new representation?

_Solution_ : Check script _binary_mobile.ss_ & _binary_mobile_alternate.ss_ .


#### Ex2.30

Define a procedure `square-tree` analogous to the `square-list` procedure of Ex2.21. 
That is, `square-tree` should behave as follows:
```
(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
```
(1 (4 (9 16) 25) (36 49))

Define `square-tree` both directly (i.e., without using any higher-order procedures) and also by using `map` and recursion. 

_Solution_ : Check script `square_tree_list.ss`. 
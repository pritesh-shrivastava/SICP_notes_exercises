### Representing Sequences

Appending 2 lists :
```
(define (append list1 list2)
    (if (null? list1)
        list2
        (cons (car list1) 
            (append (cdr list1) 
                    list2
            )
        )
    )
)
```

#### Ex2.17

Define a procedure last-pair that returns the list that contains only the last element of a given (nonempty) list:
```
(last-pair (list 23 72 149 34))
(34)
```

_Solution_ : Check script _last_pair.scm_ .


#### Ex2.18

Define a procedure reverse that takes a list as argument and returns a list of the same elements in reverse order:
```
(reverse (list 1 4 9 16 25))
(25 16 9 4 1)
```

_Solution_ : Check script _reverse.scm_

#### Ex2.19



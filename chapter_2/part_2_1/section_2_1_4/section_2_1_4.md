#### Ex2.7

Alyssa’s program is incomplete because she has not specified the implementation of the interval abstraction. Here is a definition of the interval constructor:
```
(define (make-interval a b) (cons a b))
```
Define selectors `upper-bound` and `lower-bound` to complete the implementation.

_Solution_ : Check script _interval_arithmetic.scm_ .


#### Ex2.8

Using reasoning analogous to Alyssa’s, describe how the difference of two intervals may be computed. Define a corresponding subtraction procedure, called sub-interval.

_Solution_ : Check script _interval_arithmetic.scm_ .


#### Ex2.9

The width of an interval is half of the difference between its upper and lower bounds. The width is a measure of the uncertainty of the number specified by the interval. For some arithmetic operations the width of the result of combining two intervals is a function only of the widths of the argument intervals, whereas for others the width of the combination is not a function of the widths of the argument intervals. 

Show that the width of the sum (or difference) of two intervals is a function only of the widths of the intervals being added (or subtracted). Give examples to show that this is not true for multiplication or division. 

_Solution_ : Check script _interval_arithmetic.scm_ for definition of `width` function.
Width for addition of intervals :
```
(width (add-interval x y))
=>  (width  (make-interval  (+  (lower-bound x) 
                                (lower-bound y))
                            (+  (upper-bound x) 
                                (upper-bound y))
            )
    )
=>  (/  (-  (+  (upper-bound x) 
                (upper-bound y)
            )
            (+  (lower-bound x) 
                (lower-bound y)
            )
        )
        2
    )
=> Equivalent to
    (/  (+  (- (upper-bound x) (lower-bound x))
            (- (upper-bound y) (lower-bound y))
        )
        2
    )
=> Equivalent to 
    (+  (width x)
        (width y)
    )
```

Similarly, check [this](https://codology.net/post/sicp-solution-exercise-2-9/) link for proof on substraction of intervals, and for example on why this does not hold true for multiplication & division.

#### Ex2.10

Ben Bitdiddle, an expert systems programmer, looks over Alyssa’s shoulder and comments that it is not clear what it means to divide by an interval that spans zero. Modify Alyssa’s code to check for this condition and to signal an error if it occurs.

_Solution_ : 

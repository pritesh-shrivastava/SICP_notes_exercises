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
Show that the width of the sum (or difference) of two intervals is a function only of the widths of the intervals being added (or subtracted. 
Give examples to show that this is not true for multiplication or division. 

_Solution_ : 
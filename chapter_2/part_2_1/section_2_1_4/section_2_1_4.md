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

_Solution_ : Check script _interval_arithmetic.scm_ for updated division function, `div-interval2`.


#### Ex2.11

In passing, Ben also cryptically comments: “By testing the signs of the endpoints of the intervals, it is possible to break mul-interval into nine cases, only one of which requires more than two multiplications.” Rewrite this procedure using Ben’s suggestion.

After debugging her program, Alyssa shows it to a potential user, who complains that her program solves the wrong problem. He wants a program that can deal with numbers represented as a center value and an additive tolerance; for example, he wants to work with intervals such as 3.5 ± 0.15 rather than [3.35, 3.65]. Alyssa returns to her desk and fixes this problem by supplying an alternate constructor and alternate selectors:
```
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) 
        (upper-bound i)) 
     2))

(define (width i)
  (/ (- (upper-bound i) 
        (lower-bound i)) 
     2))
```
Unfortunately, most of Alyssa’s users are engineers. Real engineering situations usually involve measurements with only a small uncertainty, measured as the ratio of the width of the interval to the midpoint of the interval. Engineers usually specify percentage tolerances on the parameters of devices, as in the resistor specifications given earlier. 

_Solution_ : 


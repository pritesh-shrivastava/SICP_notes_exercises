#### Ex1.29

Simpson’s Rule is a more accurate method of numerical integration than the method illustrated above. Using Simpson’s Rule, the integral of a function f between a and b is approximated as
h 3 ( y 0 + 4 y 1 + 2 y 2 + 4 y 3 + 2 y 4 + ⋯ + 2 y n − 2 + 4 y n − 1 + y n ) ,
where h = ( b − a ) / n , for some even integer n , and y k = f ( a + k h ) . (Increasing n increases the accuracy of the approximation.) Define a procedure that takes as arguments f , a , b , and n and returns the value of the integral, computed using Simpson’s Rule. Use your procedure to integrate cube between 0 and 1 (with n = 100 and n = 1000 ), and compare the results to those of the integral procedure shown above.

_Solution_ : Check 2 alternate solutions -
_simpson_using_sum.scm_ (Using the generic sum function described in _integral_approx.scm_)
_simpson_rule_integral.scm_ (Using tail recursion)

#### Ex1.30

The sum procedure above generates a linear recursion. The procedure can be rewritten so that the sum is performed iteratively. Show how to do this by filling in the missing expressions in the following definition:
```
(define (sum term a next b)
  (define (iter a result)
    (if ⟨??⟩
        ⟨??⟩
        (iter ⟨??⟩ ⟨??⟩)))
  (iter ⟨??⟩ ⟨??⟩))
```
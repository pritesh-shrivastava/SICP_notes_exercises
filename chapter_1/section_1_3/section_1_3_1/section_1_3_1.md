#### Ex1.29

Simpson’s Rule is a more accurate method of numerical integration than the method illustrated above. Using Simpson’s Rule, the integral of a function f between a and b is approximated as
h 3 ( y 0 + 4 y 1 + 2 y 2 + 4 y 3 + 2 y 4 + ⋯ + 2 y n − 2 + 4 y n − 1 + y n ) ,
where h = ( b − a ) / n , for some even integer n , and y k = f ( a + k h ) . (Increasing n increases the accuracy of the approximation.) Define a procedure that takes as arguments f , a , b , and n and returns the value of the integral, computed using Simpson’s Rule. Use your procedure to integrate cube between 0 and 1 (with n = 100 and n = 1000 ), and compare the results to those of the integral procedure shown above.

_Solution_ : Check 2 alternate solutions -
* _simpson_using_sum.scm_ (Using the generic sum function described in _integral_approx.scm_)
* _simpson_rule_integral.scm_ (Using tail recursion)

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
_Solution_ : Check script _sum_iteration.lisp_ .

#### Ex1.31

Part - I :
The sum procedure is only the simplest of a vast number of similar abstractions that can be captured as higher-order procedures. 
Write an analogous procedure called `product` that returns the product of the values of a function at points over a given range. 
Show how to define factorial in terms of product. 
Also, use product to compute approximations to π using the formula : 
    π / 4 = (2 ⋅ 4 ⋅ 4 ⋅ 6 ⋅ 6 ⋅ 8 ⋅ ⋯ ) / (3 ⋅ 3 ⋅ 5 ⋅ 5 ⋅ 7 ⋅ 7 ⋅ ⋯ )

Part-II :
If your product procedure generates a recursive process, write one that generates an iterative process. 
If it generates an iterative process, write one that generates a recursive process.

_Solution_ : 
Part I - See script _product.lsp_
Part II - See script _product_iteration.lsp_ 

#### Ex1.32

Part-I :
Show that sum and product are both special cases of a still more general notion called accumulate that combines a collection of terms, using some general accumulation function:
```
(accumulate combiner null-value term a next b)
```
Accumulate takes as arguments the same term and range specifications as sum and product, together with a combiner procedure (of two arguments) that specifies how the current term is to be combined with the accumulation of the preceding terms and a null-value that specifies what base value to use when the terms run out. Write accumulate and show how sum and product can both be defined as simple calls to accumulate.

Part-II :
If your accumulate procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process. 

_Solution_ : See scripts _accumulator.scm_ & _accumulator_iter.scm_ for parts I & II respoctively.


#### Ex1.33

You can obtain an even more general version of accumulate (Exercise 1.32) by introducing the notion of a filter on the terms to be combined. That is, combine only those terms derived from values in the range that satisfy a specified condition. The resulting filtered-accumulate abstraction takes the same arguments as accumulate, together with an additional predicate of one argument that specifies the filter. Write filtered-accumulate as a procedure. 

Show how to express the following using filtered-accumulate:

* the sum of the squares of the prime numbers in the interval a to b (assuming that you have a prime? predicate already written)
* the product of all the positive integers less than n that are relatively prime to n (i.e., all positive integers i < n such that GCD ( i , n ) = 1 )

_Solution_ : Check script _filtered_accumulate.scm_ .




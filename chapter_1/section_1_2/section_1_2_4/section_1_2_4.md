## Section 1.2.4

#### Ex1.16

Design a procedure that evolves an iterative exponentiation process that uses successive squaring and uses a logarithmic number of steps, as does fast-expt. (Hint: Using the observation that ( b n / 2 ) 2 = ( b 2 ) n / 2 , keep, along with the exponent n and the base b , an additional state variable a , and define the state transformation in such a way that the product a b n is unchanged from state to state. At the beginning of the process a is taken to be 1, and the answer is given by the value of a at the end of the process. In general, the technique of defining an invariant quantity that remains unchanged from state to state is a powerful way to think about the design of iterative algorithms.)

_Solution_ : Check script exponentiation_fast_tailrec.scm


#### Ex1.17

The exponentiation algorithms in this section are based on performing exponentiation by means of repeated multiplication. In a similar way, one can perform integer multiplication by means of repeated addition. The following multiplication procedure (in which it is assumed that our language can only add, not multiply) is analogous to the expt procedure:
```
(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))  ;;  a * b = a * (b-1) + a
```
This algorithm takes a number of steps that is linear in b. Now suppose we include, together with addition, operations double, which doubles an integer, and halve, which divides an (even) integer by 2. Using these, design a multiplication procedure analogous to fast-expt that uses a logarithmic number of steps.

_Solution_ : Check script mulitply_fast_using_addition.scm


#### Ex1.18

Using the results of Exercise 1.16 and Exercise 1.17, devise a procedure that generates an iterative process for multiplying two integers in terms of adding, doubling, and halving and uses a logarithmic number of steps.

_Solution_ : 
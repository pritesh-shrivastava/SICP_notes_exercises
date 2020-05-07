## Section 1.2.4

#### Ex1.16

Design a procedure that evolves an iterative exponentiation process that uses successive squaring and uses a logarithmic number of steps, as does fast-expt. (Hint: Using the observation that ( b n / 2 ) 2 = ( b 2 ) n / 2 , keep, along with the exponent n and the base b , an additional state variable a , and define the state transformation in such a way that the product a b n is unchanged from state to state. At the beginning of the process a is taken to be 1, and the answer is given by the value of a at the end of the process. In general, the technique of defining an invariant quantity that remains unchanged from state to state is a powerful way to think about the design of iterative algorithms.)

_Solution_ : Check script _exponentiation_fast_tailrec.scm_


#### Ex1.17

The exponentiation algorithms in this section are based on performing exponentiation by means of repeated multiplication. In a similar way, one can perform integer multiplication by means of repeated addition. The following multiplication procedure (in which it is assumed that our language can only add, not multiply) is analogous to the expt procedure:
```
(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))  ;;  a * b = a * (b-1) + a
```
This algorithm takes a number of steps that is linear in b. Now suppose we include, together with addition, operations double, which doubles an integer, and halve, which divides an (even) integer by 2. Using these, design a multiplication procedure analogous to fast-expt that uses a logarithmic number of steps.

_Solution_ : Check script _mulitply_fast_using_addition.scm_


#### Ex1.18

Using the results of Exercise 1.16 and Exercise 1.17, devise a procedure that generates an iterative process for multiplying two integers in terms of adding, doubling, and halving and uses a logarithmic number of steps.

_Solution_ :  Check script _multiply_fast_iter.scm_

#### Ex1.19

There is a clever algorithm for computing the Fibonacci numbers in a logarithmic number of steps. Recall the transformation of the state variables a and b in the fib-iter process of 1.2.2: a ← a + b and b ← a . Call this transformation T , and observe that applying T over and over again n times, starting with 1 and 0, produces the pair Fib ( n + 1 ) and Fib ( n ) . In other words, the Fibonacci numbers are produced by applying T n , the n th power of the transformation T , starting with the pair (1, 0). Now consider T to be the special case of p = 0 and q = 1 in a family of transformations T p q , where T p q transforms the pair ( a , b ) according to a ← b q + a q + a p and b ← b p + a q . Show that if we apply such a transformation T p q twice, the effect is the same as using a single transformation T p ′ q ′ of the same form, and compute p ′ and q ′ in terms of p and q . This gives us an explicit way to square these transformations, and thus we can compute T n using successive squaring, as in the fast-expt procedure. Put this all together to complete the following procedure, which runs in a logarithmic number of steps : 

```
    (define (fib n)
      (fib-iter 1 0 0 1 n))

    (define (fib-iter a b p q count)
      (cond ((= count 0) 
             b)
            ((even? count)
             (fib-iter a
                       b
                       ⟨??⟩  ;compute p'
                       ⟨??⟩  ;compute q'
                       (/ count 2)))
            (else 
             (fib-iter (+ (* b q) 
                          (* a q) 
                          (* a p))
                       (+ (* b p) 
                          (* a q))
                       p
                       q
                       (- count 1)))))
```

_Solution_ : Applying transforation `T_pq` twice to a and b and collecting terms of a and b, we get,

```
p' = p^2 + q^2
q' = q^2 + 2*p*q
```
Complete script for calculating Fibonacci nos in logarithmic no of steps is at _fibonacci_fast.scm_ .


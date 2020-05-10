## Greatest Common Divisor

#### Euclid's Algorithm

```
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
```

based on the observation that, `GCD(a,b) = GCD(b,a%b)`.
```

Proof of Euclid's Algorithm can be found on [Khan Academy](https://www.khanacademy.org/computing/computer-science/cryptography/modarithmetic/a/the-euclidean-algorithm)


#### Ex1.20

The process that a procedure generates is of course dependent on the rules used by the interpreter. As an example, consider the iterative gcd procedure given above. Suppose we were to interpret this procedure using normal-order evaluation, as discussed in 1.1.5. (The normal-order-evaluation rule for if is described in Exercise 1.5.) Using the substitution method (for normal order), illustrate the process generated in evaluating (gcd 206 40) and indicate the remainder operations that are actually performed. How many remainder operations are actually performed in the normal-order evaluation of (gcd 206 40)? In the applicative-order evaluation? 

_Solution:_

The process generated using the applicative-order evaluation (evaluate arguemtns first, then apply function) is the following. It performs 4 remainder operations.

```
 (gcd 206 40) 
  
 (gcd 40 (remainder 206 40)) 
  
 (gcd 40 6) 
  
 (gcd 6 (remainder 40 6)) 
  
 (gcd 6 4) 
  
 (gcd 4 (remainder 6 4)) 
  
 (gcd 4 2) 
  
 (gcd 2 (remainder 4 2)) 
  
 (gcd 2 0) 
  
 2 
```  

In Normal order evaluation, we evaluate the arguments only after applying the function and expanding the expression. This leads to calling the remainder operation 18 times !!

```
(gcd 206 40) 
  
 (if (= 40 0) ...) 
  
 (gcd 40 (remainder 206 40)) 
  
 (if (= (remainder 206 40) 0) ...) 
  
 (if (= 6 0) ...) 
  
 (gcd (remainder 206 40) (remainder 40 (remainder 206 40))) 
  
 (if (= (remainder 40 (remainder 206 40)) 0) ...) 
  
 (if (= 4 0) ...) 
  
 (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 
  
 (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) ...) 
  
 (if (= 2 0) ...) 
  
 (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))) 
  
 (if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0) ...) 
  
 (if (= 0 0) ...) 
 (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
 ``` 
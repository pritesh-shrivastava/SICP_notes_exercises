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
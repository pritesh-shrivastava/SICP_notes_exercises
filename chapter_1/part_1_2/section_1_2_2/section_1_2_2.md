#### Tree Recursion

Time complexity = O(# nodes at the bottom)
Space complexity = O(Max depth of tree)


#### Ex1.11

A function f is defined by the rule that f(n)=n if n<3 and f(n)=f(n−1)+2f(n−2)+3f(n−3) if n≥3. Write a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process.

_Solution_ :

Tree recursion - easier to write, but slower to run
```
(define (f_tree_rcrsn n)
  (cond ((< n 3) n)
        (else (+ (f_tree_rcrsn (- n 1))
                (* (f_tree_rcrsn (- n 2)) 2)
		(* (f_tree_rcrsn (- n 3)) 3)
		)
	)
 )
)
```

Iterative process - faster than tree recursion
```
(define (f_iter n) 
	(if (< n 3)
	n
	(f-iter 2 1 0 n)
	)
)

(define (f-iter a b c count)
  (if (< count 3)
      a
      (f-iter (+ a (* 2 b) (* 2 c)) 
		a 
		b 
		(- count 1)
		)
	)
)
```

#### Ex1.12

Exercise 1.12: The following pattern of numbers is called Pascal’s triangle.

         1
       1   1
     1   2   1
   1   3   3   1
 1   4   6   4   1
       . . .
The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum of the two numbers above it. Write a procedure that computes elements of Pascal’s triangle by means of a recursive process.

_Solution_ : Calculating the elements of the Pascal's Triangle based on row & column (starting from 1, top to down, and left to right respectively). We are ignoring 0 values.

```
(define (pascal row col)
	(if (or ( = col 1) (= col row))
		1
		(+ (pascal (- row 1) col)
		   (pascal (- row 1)( - col 1))		
		)
	)
)
```

#### Ex1.13

Prove that Fib(n) is the closest integer to φ^n/√5, where φ=(1+√5)/2. 
Hint: Let ψ=(1−√5)/2. Use induction and the definition of the Fibonacci numbers to prove that Fib(n)=(φ^n−ψ^n)/√5.

_Solution_ : Mathematical proof [here](https://www.evernote.com/shard/s100/client/snv?noteGuid=6a4b59d5-e99f-417c-9ef3-bcf03a4efecd&noteKey=7e030d4602a0bef5df0d6dd4c2ad47bf&sn=https%3A%2F%2Fwww.evernote.com%2Fshard%2Fs100%2Fsh%2F6a4b59d5-e99f-417c-9ef3-bcf03a4efecd%2F7e030d4602a0bef5df0d6dd4c2ad47bf&title=Exercise%2B1.13)

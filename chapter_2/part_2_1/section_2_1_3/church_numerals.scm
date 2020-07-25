(define zero 
    (lambda (f) 
        (lambda (x) x)
    )
)

(define (add-1 n)
    (lambda (f) 
        (lambda (x) 
            (f ((n f) x)
            )
        )
    )
)

;; Testing
;; One & Two in terms of the procedures zero & add-1
(add-1 zero)          ;; returns ;Value: #[compound-procedure 1]
(add-1 (add-1 zero))  ;; returns ;Value: #[compound-procedure 2]


(define one 
    (lambda (f) 
        (lambda (x) 
            (f x)
        )
    )
)

(define two 
    (lambda (f) 
        (lambda (x) 
            (f (f x)
        )
    )
)

;; list-fn : ListOfX -> ??
(define (list-fn lst)
  (cond
    [(empty? lst) ...]
    [else (... (first lst)
               (list-fn (rest lst)))]))


;; remove-evens : LOI -> LOI
(define (remove-evens lst)
  (cond
    [(empty? lst) empty]
    [else (if (even? (first lst))
              (remove-evens (rest lst))
              (cons (first lst)
                    (remove-evens (rest lst))))]))

;; remove-evens : LOI -> LOI
(define (remove-evens lst)
  (cond
    [(empty? lst) empty]
    [(even? (first lst))
     (remove-evens (rest lst))]
    [else (cons (first lst)
                (remove-evens (rest lst)))]))


;; A Natural Number (Nat) is one of 
;; -- 0
;; -- (add1 Nat)

#|
;; A Natural Number (Nat) is one of 
;; -- 0
;; -- (add1 Nat)
|#

;; nat-fn : Nat -> ??
(define (nat-fn n)
 (cond
  [(zero? n) ...]
  [else (... n (nat-fn (sub1 n)))]))

;; double : Nat -> Nat
;; strategy: use template for
;;   Nat on n
(define (double n)
  (cond
    [(zero? n) 0]
    [else (+ 2 (double (sub1 n)))]))

;; sum : Nat Nat -> Nat
;; strategy: use template for
;;   Nat on x
(define (sum x y)
 (cond
   [(zero? x) y]
   [else (add1 (sum (sub1 x) y))]))

#|
(sum 3 2)
= (add1 (sum 2 2))
= (add1 (add1 (sum 1 2)))
= (add1 (add1 (add1 (sum 0 2))))
= (add1 (add1 (add1 2)))
= 5
|#

;; prod : Nat Nat -> Nat
;; strategy: use template for 
;; Nat on y
(define (prod x y)
  (cond
    [(zero? y) 0]
    [else 
      (sum x (prod x (sub1 y)))]))

#|
(prod 2 3)
= (sum 2 (prod 2 2))
= (sum 2 (sum 2 (prod 2 1)))
= (sum 2 (sum 2 (sum 2 (prod 2 0))))
= (+ 2 (+ 2 (+ 2 0)))
= 6
|#
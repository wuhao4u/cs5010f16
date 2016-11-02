;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname 07-4-foldl) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; myfoldl : (X Y -> Y) Y ListOfX -> Y
;; STRATEGY: Use template for ListOfX on lox
(define (myfoldl fcn base lox)
  (cond
    [(empty? lox) base]
    [else (myfoldl 
            fcn
            (fcn (first lox) base)
            (rest lox))]))


(define INT-LIST (list 1 2 3 4 5 6))

(check-expect (myfoldl + 0 INT-LIST) 21)
;;(check-expect (myfoldl - 0 INT-LIST) -21) ;; why is this wrong?
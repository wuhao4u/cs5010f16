;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname replace-all-anchovies-with-onions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require rackunit)
(require "extras.rkt")

;; Data Definitions:

;; A Topping is a String.

;; A Pizza is a ListOfTopping
;; interp: a pizza is a list of toppings, listed from top to bottom

;; pizza-fn : Pizza -> ??
; Given a Pizza, produce ....
;; (define (pizza-fn p)
;;   (cond
;;     [(empty? p) ...]
;;     [else (... (first p)
;;             (pizza-fn (rest p)))]))

;; Examples:
(define plain-pizza empty)
(define cheese-pizza (list "cheese"))
(define anchovies-cheese-pizza (list "anchovies" "cheese"))

;;; This is the original function definition, from the slides:

;; replace-all-anchovies-with-onions 
;;   : Pizza -> Pizza
;; RETURNS: a pizza like the given pizza, but with
;; anchovies in place of each layer of onions
;; STRATEGY: Use template for Pizza on p
(define (replace-all-anchovies-with-onions p)
  (cond
    [(empty? p) empty]
    [else (if (string=? (first p) "anchovies")
            (cons "onions"
              (replace-all-anchovies-with-onions 
               (rest p)))
            (cons (first p)
              (replace-all-anchovies-with-onions 
               (rest p))))]))


;; replace-all-anchovies
(define (replace-all-anchovies lot nt)
  (cond
    [(empty? lot) empty]
    [else (if (string=? (first lot) "anchovies")
              (cons nt (replace-all-anchovies (rest lot) nt))
              (cons (first lot) (replace-all-anchovies (rest lot) nt)))]))

(begin-for-test
  (check-equal?
   (replace-all-anchovies (list "anchovies" "peppers" "onions") "tayto")
   (list "tayto" "peppers" "onions"))
  (check-equal?
   (replace-all-anchovies (list "shrooms" "peppers" "onions") "tayto")
   (list "shrooms" "peppers" "onions"))
  )

  ;; replace-topping
(define (replace-topping lot ot nt)
  (cond
    [(empty? lot) empty]
    [else (if (string=? (first lot) ot)
              (cons nt (replace-topping (rest lot) ot nt))
              (cons (first lot) (replace-topping (rest lot) ot nt)))]))

(begin-for-test
  (check-equal?
   (replace-topping (list "anchovies" "peppers" "onions") "anchovies" "tayto")
   (list "tayto" "peppers" "onions"))
  (check-equal?
   (replace-topping (list "shrooms" "peppers" "onions") "blahblah" "tayto")
   (list "shrooms" "peppers" "onions"))
  )

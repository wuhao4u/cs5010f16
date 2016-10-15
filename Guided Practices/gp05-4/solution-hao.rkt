;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname solution-hao) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require rackunit)
(require "extras.rkt")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; DATA DEFINITIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Book

(define-struct book (author title on-hand price))

;; A Book is a 
;;  (make-book String String NonNegInt NonNegInt)
;; Interpretation:
;; author is the author’s name
;; title is the title
;; on-hand is the number of copies on hand
;; price is the price in USD

;; book-fn : Book -> ??
;; (define (book-fn b)
;;   (... (book-author b) (book-title b) (book-on-hand b) (book-price b)))

;; ListofBooks

;; A ListOfBooks (LOB) is either
;; -- empty
;; -- (cons Book LOB)

;; lob-fn : LOB -> ??
;; (define (lob-fn lob)
;;   (cond
;;     [(empty? lob) ...]
;;     [else (...
;;             (book-fn (first lob))
;;             (lob-fn (rest lob)))]))

;; Inventory

;; An Inventory is a ListOfBooks.
;; Interp: the list of books that the bookstore carries, in any order.

(define lob1
  (list
    (make-book "Felleisen" "HtDP/1" 20 7)
    (make-book "Wand" "EOPL" 5 50)
    (make-book "Shakespeare" "Hamlet" 0 2)
    (make-book "Shakespeare" "Macbeth" 0 10)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; FUNCTION DEFINITIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; book-inventory-value : Book -> NonNegInt
;; GIVEN: the inventory record for a book
;; RETURNS: the value of the copies on hand of the given book
;; EXAPLE: (book-inventory-value (make-book "Felleisen" "HtDP/1" 20 7)) = 140
;; STRATEGY: Use template for Book on b

(define (book-inventory-value b)
  (* (book-on-hand b) (book-price b)))

;; TEST
(begin-for-test
  (check-equal?
    (book-inventory-value (make-book "Felleisen" "HtDP/1" 20 7))
    140
    "value of 20 Felleisens at $7 should have been $140"))


;; inventory-total-copies-on-hand : ListOfBook -> NonNegInt
;; GIVEN: a list of books
;; RETURNS: the total number of copies on hand
(define (inventory-total-copies-on-hand lob)
  (local ((define (add-on-hand b base-copies) (+ base-copies (book-on-hand b))))
  (foldr add-on-hand 0 lob)))

(begin-for-test
 (check-equal? (inventory-total-copies-on-hand lob1) 25))
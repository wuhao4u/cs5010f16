;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname solution-hao) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(require rackunit)
(require "../extras.rkt")

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
;; Interp: the list of books that the bookstore carries, IN ANY ORDER.

(define lob1
  (list
    (make-book "Felleisen" "HtDP/1" 20 7)
    (make-book "Wand" "EOPL" 5 50)
    (make-book "Shakespeare" "Hamlet" 0 2)
    (make-book "Shakespeare" "Macbeth" 0 10)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; FUNCTION DEFINITIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; SEE GUIDED PRACTICE 4.4 FOR MORE

;; inventory-total-value : LOB -> Number
;; GIVEN: a LOB
;; RETURNS: the value of all the copies on hand of all the books in the
;; given LOB
;; (inventory-total-value lob1) = 390
(define (inventory-total-value inv)
  (cond
    [(empty? inv) 0]
    [else (+ (book-value (first inv))
               (inventory-total-value (rest inv)))]))

(define (book-value b)
  (* (book-on-hand b) (book-price b)))

(begin-for-test
  (check-equal? 
    (inventory-total-value empty)
    0
    "value of the empty inventory should have been 0")
  (check-equal?
    (inventory-total-value lob1)
    390
    "simple test"))

;; books-out-of-stock : LOB -> LOB
;; GIVEN: a list of books
;; RETURNS: a list of the books that are out of stock in the given LOB
;; Example:
;; (books-out-of-stock lob1) =
;;  (list
;;    (make-book "Shakespeare" "Hamlet" 0 2)
;;    (make-book "Shakespeare" "Macbeth" 0 10))
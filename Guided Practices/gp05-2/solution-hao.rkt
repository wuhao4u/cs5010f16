;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname solution-hao) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require rackunit)
(require "extras.rkt")

(define (multiplier cf c)
  (* cf c))

#;(define (convert-currencies conversion-factor loc)
  (cond
    [(empty? loc) empty]
    [else (cons (multiplier conversion-factor (first loc))
                (convert-currencies conversion-factor (rest loc)))]))


(define (convert-currencies conversion-factor loc)
  (map (lambda (n) (* conversion-factor n)) loc))

(begin-for-test
  (check-equal? (convert-currencies 1.18 (list 1 10 100))
                (list 1.18 11.8 118.0)))
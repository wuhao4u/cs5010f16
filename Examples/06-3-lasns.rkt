;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname 06-3-lasns) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; A ListOfAlternatingNumbersAndStrings (LANS) is one of:
;; -- empty
;; -- (cons Number LASN)

;; A ListOfAlternatingStringsAndNumbers (LASN) is one of:
;; -- empty
;; -- (cons String LANS)

;; HALTING MEASURE: length of lans or lasn
;; lans-fn : LANS -> ??
;; (define (lans-fn lans)
;;   (cond
;;     [(empty? lans) ...]
;;     [else (...
;;             (first lans)
;;             (lasn-fn (rest lans)))]))

;; lasn-fn : LASN -> ??
;; (define (lasn-fn lasn)
;;   (cond
;;     [(empty? lasn) ...]
;;     [else (... 
;;             (first lasn)
;;             (lans-fn (rest lasn)))]))

;; strategy: Use template for LANS/LASN on lans
;; lans-sum : LANS -> Number
(define (lans-sum lans)
  (cond
    [(empty? lans) 0]
    [else (+
            (first lans)
            (lasn-sum (rest lans)))]))

;; lasn-sum : LASN -> Number
(define (lasn-sum lasn)
  (cond
    [(empty? lasn) 0]
    [else (lans-sum (rest lasn))]))


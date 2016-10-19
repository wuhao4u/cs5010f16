;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Mod-6-Martians-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct ship (name crew daughterships))
;; A Ship is one of
;; -- (make-ship String ListofMartians ListofShip)
;; -- (make-drone)

(define-struct martian (name))
;; A Martian is a (make-martian (String))



(define-struct drone ())

;; Ship -> Boolean
;; GIVEN: A Ship
;; RETURNS: true iff there is a Martian named “Mork” in its crew
(define (find-mork? ship1)
  (cond
    [(drone? ship1) false]
    [else 
       (ormap
          (lambda (x) (string=? "Mork" (martian-name x)))
          (ship-crew ship1))]))

;; Ship -> Boolean
;; GIVEN: A Ship
;; RETURNS: true iff there is a Martian named “Mork” in its crew or
;;          in the crew of one of its daughters.
(define (find-mork-again? ship1)
  (cond     
    [(find-mork? ship1) true]
    [else (ormap find-mork? (ship-daughterships ship1))]))


(define (mork-in-crew? s)
  (if (drone? s) false
      (member "Mork"
              (map martian-name (mother-ship-crew s)))))


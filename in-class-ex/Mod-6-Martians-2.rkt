;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Mod-6-Martians-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct drone ())
; A Drone is a (make-drone)

;(define (drone-fn d)
;  (...))

(define-struct mothership (name crew daughters))
; A Mothership is a (make-mothership String ListOfMartian ListOfSpaceship)

(define-struct martian (name))
; A Martian is a (make-martian String)

; martian-fn : Martian -> ??
;(define (martian-fn mart)
;  (...
;   (martian-name mart)))

;; A ListOfMartian is one of
;; - empty
;; (cons Martian ListOfMartian)

;; lom-fn : ListOfMartian -> ??
; (define (lom-fn lom)
;   (cond
;    [(empty? lom) (...)]
;    [ else (...
;                 (martian-fn (first lom))
;                 (lom-fn (rest lom))

;; A spaceship is one of
;; -- (make-drone name)
;; -- (make-mothership name crew daughters)

;; A ListOfSpaceShip is
;; -- empty
;; -- (cons Spaceship ListOfSpaceShip)

;; TEMPLATE:
;; loss-fn : ListOfSpaceShip -> ??
;; HALTING MEASURE: length of loss.
;(define (loss-fn loss)
;  (cond
;    [(empty? loss) (...)]
;    [else (...
;           (spaceship-fn (first loss))
;           (loss-fn (rest loss)))]))

;(define (spaceship-fn s)
;  (cond
;    [(drone? s) (drone-fn s)]
;    [else (...
;           (spaceship-fn (first (mothership-daughters s)))
;           (loss-fn (rest (mothership-daughters s))))]))



; in-own-crew : Spaceship Martian -> Boolean
; GIVEN: a Spaceship and a Martian
; RETURNS: true iff the Martian belongs to the spaceship's crew.
; EXAMPLES: TO-DO
; STRATEGY: Use HOF ormap.
(define (in-own-crew? s m)
  (cond
    [(drone? s) false]
    [else (ormap
           ; Martian -> Boolean
           ; RETURNS: true if the name of the martian
           ; matches that of the given martian
           (lambda (x)
             (string=? (martian-name m) (martian-name x)))
           (mothership-crew s))]))

; in-any-crew? : Spaceship Martian -> Boolean
; GIVEN: a spaceship and a martian
; RETURNS: true iff the martian is present in the crew of the spaceship
; or any of the daugher ships, if any.
; STRATEGY: Use HOF ormap on (mothership-daughters s)
(define (in-any-crew? s m)
  (cond
    [(drone? s) false]
    [else (or (in-own-crew? s m)
              (ormap
               (lambda (x)
                 (in-own-crew? x m)) (mothership-daughters s)))]))




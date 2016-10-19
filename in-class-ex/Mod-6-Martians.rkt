;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Mod-6-Martians) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))


(define-struct mothership (name crews sod))
;; a MotherShip is a (make-mothership String ListOfMartian SetOfSpaceShip)
;; TEMPLATE
(define (mothership-fn ms) 
	(...
	(mothership-name ms)
	(lom-fn (mothership-crews ms))
	(los-fn (mothership-sod ms))))


(define-struct drone ())
;; a Drone is a (make-drone String)
;; TEMPLATE
(define (drone-fn d)...)


;; a SpaceShip is one of 
;; -- MotherShip
;; -- Drone
;; TEMPLATE

(define (spaceship-fn ss)
	(if (mothership? ss) (mothership-fn ss)
		(drone-fn ss)))

;; a ListOfSpaceShip is one of
;; -- empty
;; -- (cons SpaceShip ListOfSpaceShip)
;; TEMPLATE
(define (los-fn los)
	(if (empty? los) ...
		((spaceship-fn (first los))
		 (los-fn (rest los)))))


;; a SetOfSpaceShip is a ListOfSpaceShip without dups

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; HALTING MEAURES:
;; # of ships in the fleet of spaceships
(define-struct martian (name))
;; a Martian is a (make-martian String)
;; TEMPLATE
(define (martian-fn m) 
	(...(martian-name m)))
;; a ListOfMartian of one of
;; -- empty
;; -- (cons Martian ListOfMartian)
;; TEMPLATE
(define (lom-fn lom)
	(if (empty? lom) ...
		((martian-fn (first lom))
		 (lom-fn (rest lom)))))



;; has-mork? : spaceship
;; GIVEN: a spaceship
;; RETURN: true iff the spaceship's crew has one named 'Mork' in it
;; EXAMPLES:
;; STRATEGY:
(define (spaceship-has-mork? ss)
	(if (mothership? ss)
            (crew-has-mork? ss)
		#false))

(define (mothership-helper ms)
  (cond
    [(crew-has-mork? (mothership-crew ms))]
    [(daughter-ships-has-mork? (mothership-crew ms))]
    [else #f]
    ))
(define (crew-has-mork? lom)
  (ormap (lambda (m) (string=? "Mork" (martian-name m))) lom))
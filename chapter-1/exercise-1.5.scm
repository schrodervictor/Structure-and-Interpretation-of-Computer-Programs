(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))

;This code will cause an infinit loop when using applicative order.
;If using normal order, the expansion would prevent the infinit loop, because
;(p) would never be executed.
;
;In the normal order, the expansion would look like this:
;
;(test 0 (p))
;(if (= 0 0) 0 (p))
;(if #t 0 (p))
;0
;
;But in the applicative order, the (p) part always evaluates to a new (p) call
;which means that (test) never gets executed, because it keeps waiting for the
;result of (p).
;
;To prevent the infinit loop in the applicative order, the (p) call should be
;moved inside the else-clause of the if, like this:

(define (p) (p))
(define (test x y)
  (if (= x 0) 0 (y)))

(test 0 p)

;In this case, the infinit loop will happen only if x is different from zero

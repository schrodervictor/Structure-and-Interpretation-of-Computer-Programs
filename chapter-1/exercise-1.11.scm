(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

(display (f 5))
(newline)

(define (f-iter n)
  (if (< n 3) n
      (f-asc n 3 2 1 0)))

(define (f-asc n x fx-1 fx-2 fx-3)
  (define fx (+ fx-1 (* 2 fx-2) (* 3 fx-3)))
  (if (= n x)
      fx
      (f-asc n (+ x 1) fx fx-1 fx-2)))

(display (f-iter 5))
(newline)

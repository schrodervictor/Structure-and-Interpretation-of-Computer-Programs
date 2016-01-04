(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (elem mapped-rest) (cons (p elem) mapped-rest))
              (list)
              sequence))

(display (map (lambda (x) (* x x)) (list 1 2 3 4 5)))
(newline)

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(display (append (list 1 2 3 4) (list 5 6 7 8)))
(newline)

(define (length sequence)
  (accumulate (lambda (elem lenght-rest) (+ 1 lenght-rest))
              0
              sequence))

(display (length (list 1 2 3)))
(newline)

;Ackermann's function definition
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

;Sample calculations
(display (A 1 10))
(newline)

(display (A 2 4))
(newline)

(display (A 3 3))
(newline)


(define (f n) (A 0 n))

;(f n) = (A 0 n)
;(f n) = (if (= n 0) 0 (* 2 n))
;(f n) = (* 2 n)

(define (simple-f n) (* 2 n))

(display "Demonstration for f(n)")
(newline)
(display (= (f 0) (simple-f 0)))
(newline)
(display (= (f 1) (simple-f 1)))
(newline)
(display (= (f 2) (simple-f 2)))
(newline)
(display (= (f 3) (simple-f 3)))
(newline)
(display (= (f 4) (simple-f 4)))
(newline)
(display (= (f 5) (simple-f 5)))
(newline)

(define (g n) (A 1 n))

;(g n) = (A 1 n)
;(g n) = (cond ((= n 0) 0)
;              ((= n 1) (* 2 n))
;              (else (A (- 1 1)
;                       (A 1 (- n 1)))))
;(g n) = (cond ((= n 0) 0)
;              ((= n 1) (* 2 n))
;              (else (A 0
;                       (A 1 (- n 1)))))
;(g n) = (cond ((= n 0) 0)
;              ((= n 1) (* 2 n))
;              (else (A 0
;                       (A 0
;                          (A 1 (- n 2))))))
;(g n) = (cond ((= n 0) 0)
;              ((= n 1) (* 2 n))
;              (else (A 0
;                       (A 0
;                          (A 0
;                             (A 1 (- n 3)))))))
;(g n) = (cond ((= n 0) 0)
;              ((= n 1) 2)
;              (else (A 0
;                       (A 0
;                          (A 0
;                           .
;                           .
;                           .
;                             (A 1 (- n (- n 1))) ... )))))
;
;It shows that, if n > 1, it will be recursively reduced until 1,
;yielding 2. This goes (n-1) times and for each step n was reduced, it will be
;multiplied by 2 that many times back.
;
;(g n) = (cond ((= n 0) 0)
;              ((= n 1) 2)
;              (else (A 0
;                       (A 0
;                          (A 0
;                           .
;                           .
;                           .
;                             (A 1 1) ... )))))
;(g n) = (cond ((= n 0) 0)
;              ((= n 1) 2)
;              (else (A 0
;                       (A 0
;                          (A 0
;                           .
;                           .
;                           .
;                             2) ... ))))
;
;(g n) = (cond ((= n 0) 0)
;              ((= n 1) 2)
;              (else (* 2 2 2 ... 2)))
;
;Given a function ^ as exponentiation, we can write:
;
;(g n) = (cond ((= n 0) 0)
;              ((= n 1) 2)
;              (else (^ 2 n)))
;
;(g n) = (if (= n 0) 0 (^ 2 n))

(define (^ n e)
  (define (^-iterative accumulator count)
    (if (= count 0)
        accumulator
        (^-iterative (* n accumulator) (- count 1))))
  (^-iterative 1 e))

(define (simple-g n) (if (= n 0) 0 (^ 2 n)))

(display "Demonstration for g(n)")
(newline)
(display (= (g 0) (simple-g 0)))
(newline)
(display (= (g 1) (simple-g 1)))
(newline)
(display (= (g 2) (simple-g 2)))
(newline)
(display (= (g 3) (simple-g 3)))
(newline)
(display (= (g 4) (simple-g 4)))
(newline)
(display (= (g 5) (simple-g 5)))
(newline)

(define (h n) (A 2 n))

;(h n) = (A 2 n)
;(h n) = (cond ((= n 0) 0)
;              ((= n 1) 2)
;              (else (A 1
;                       (A 2 (- n 1)))))
;
;(h n) = (cond ((= n 0) 0)
;              ((= n 1) 2)
;              (else (A 1
;                       (if (= n 2)
;                           2
;                           (A 1
;                              (A 2 (- n 2)))))))
;
;(h n) = (cond ((= n 0) 0)
;              ((= n 1) 2)
;              (else (A 1
;                       (if (= n 2)
;                           2
;                           (A 1
;                              (if (= n 3)
;                                  2
;                                  (A 1
;                                     (A 2 (- n 3)))))))))
;
;(h n) = (cond ((= n 0) 0)
;              ((= n 1) 2)
;              (else (A 1
;                       (if (= n 2)
;                           2
;                           (A 1
;                              (if (= n 3)
;                                  2
;                                  .
;                                  .
;                                  .
;                                  (A 1
;                                     (if (= n n)
;                                         2
;                                         (A 1
;                                            (A 2 (- n n))))) ... ))))))
;
;(h n) = (cond ((= n 0) 0)
;              ((= n 1) 2)
;              (else (A 1
;                       (if (= n 2)
;                           2
;                           (A 1
;                              (if (= n 3)
;                                  2
;                                  .
;                                  .
;                                  .
;                                  (A 1 2) ... ))))))
;
;On the (n-1)-th expansion, the condition n=n will be true, yielding 2. All
;the previous if-predicates will be false, yielding the else-clause.
;
;(h n) = (cond ((= n 0) 0)
;              ((= n 1) 2)
;              (else (A 1
;                       (A 1
;                          .
;                          .
;                          .
;                          (A 1 2) ... ))))
;
;We know that (A 1 2) = (g 2) = (^ 2 2)
;
;(h n) = (cond ((= n 0) 0)
;              ((= n 1) 2)
;              (else (A 1
;                       (A 1
;                          .
;                          .
;                          .
;                          (^ 2 2) ... ))))
;
;(h n) = (cond ((= n 0) 0)
;              ((= n 1) 2)
;              (else (^ 2 (^ 2 ... (^ 2 2)))))
;
;(h n) = (if (= n 0)
;            0
;            (^ 2 (^ 2 ... (^ 2 (^ 2 1)))))
;
;Given a function ^^ as tetration, we can write:
;
;(h n) = (if (= n 0) 0 (^^ 2 n))

(define (^^ n e)
  (define (^^-iterative accumulator count)
    (if (= count 0)
        accumulator
        (^^-iterative (^ n accumulator) (- count 1))))
  (^^-iterative 1 e))

(define (simple-h n) (if (= n 0) 0 (^^ 2 n)))

(display "Demonstration for h(n)")
(newline)
(display (= (h 0) (simple-h 0)))
(newline)
(display (= (h 1) (simple-h 1)))
(newline)
(display (= (h 2) (simple-h 2)))
(newline)
(display (= (h 3) (simple-h 3)))
(newline)
(display (= (h 4) (simple-h 4)))
(newline)

(define (k n) (* 5 n n))

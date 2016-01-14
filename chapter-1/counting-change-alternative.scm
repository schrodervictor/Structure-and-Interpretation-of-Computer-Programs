(define available-coins (list 50 25 10 5 1))

(define (count-change amount coins)

        ; if the amount is zero, we found a change combination
  (cond ((= amount 0) 1)

        ; if the amount is negative, this is not a change combination
        ((< amount 0) 0)

        ; if we run out of coin types, the change was not possible
        ((null? coins) 0)

        ; otherwise, we still have money to change. The set of combinations
        ; of change can be splited in two groups: those that contains at least
        ; one of a given type of coin, and those that does not contain any
        ; coin of that type.
                 ; for the first group, we deduce the coin value and calculate
                 ; the count-change of the rest, using all coin types
        (else (+ (count-change (- amount (car coins)) coins)
                 ; for the second group, we calculate the change for the full
                 ; amount, but removing the first coin from the set
                 (count-change amount (cdr coins))))))

(display (count-change 150 available-coins))
(newline)

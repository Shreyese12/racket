#lang racket

(define (SettingList l1 l2)
    (if (null? l1)
        l2
        (SettingList (cdr l1) (cons (car l1) l2))
    )
)

(define (FindDividers i l n)
    (if (<= i n)
        (if (= (remainder n i) 0)
            (FindDividers (+ i 1) (cons i l) n)
            (FindDividers (+ i 1) l n)
        )
        l
    )
)

(define (Main)
    (define number 0)
    (define l (list))

    (printf "Please enter a number: ")
    (set! number (read))

    (if (and (> number 0) (integer? number))
        (begin
            (set! l (SettingList (FindDividers 1 (list) number) (list)))
            (printf "These are divisors of ~a: \n~a\n" number l)
        )
        (begin
            (printf "Invalid Number.\n")
            (newline)
            (Main)
        )
    )
)

(Main)
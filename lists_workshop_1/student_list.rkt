#lang racket 

(define (ListLength i l)
    (if (null? l)
        i
        (ListLength (+ i 1) (cdr l))
    )
)

(define (FindStudent i len students_list code)
    (if (< i len)
        (if (= code (car (cdr (car students_list))))
            (printf "That student is enrolled at ~a.\n" (car (cdr (cdr (car students_list)))))
            (FindStudent (+ i 1) len (cdr students_list) code)
        )
        (if (= i len)
            (printf "That student isn't enrroled.\n")
            (void)
        )
    )
)

(define (Main)
    (define code 0)
    (define students_list
        (list 
            (list "Samuel Reyes" 202201 "Computer Science")
            (list "Juan Marulanda" 202202 "Architecture")
            (list "Vanessa Calvache" 202203 "Journalism")
            (list "Manuela Zapata" 202204 "Marketing")
            (list "Daniela Parada" 202205 "Music")
        )
    )

    (printf "Please enter student code: ")
    (set! code (read))

    (if (and (integer? code) (> code 0))
        (FindStudent 0 (ListLength 0 students_list) students_list code)
        (begin
            (printf "Invalid Code.\n")
            (newline)
            (Main)
        )
    )
)

(Main)
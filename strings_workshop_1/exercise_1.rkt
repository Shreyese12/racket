#lang racket

(define (PrintGrade char)
	(cond
		((char=? char #\E) (printf "Excellent\n"))
		((char=? char #\B) (printf "Good\n"))
		((char=? char #\A) (printf "Acceptable\n"))
		((char=? char #\D) (printf "Deficient\n"))
		((char=? char #\I) (printf "Insufficient\n"))
		(else (begin (printf "Invalid Grade.\n") (newline) (Main)))
	)
)

(define (Main)
	(define char 0)

	(printf "Please enter your grade (E-B-A-D-I)\n")
	(printf "-> ")
	(set! char (read))
	
	(if (char? char)
		(PrintGrade char)
		(begin
			(printf "Invalid Character.\n")
			(newline)
			(Main)
		)
	)
)

(Main)

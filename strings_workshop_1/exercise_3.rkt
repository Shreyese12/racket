#lang racket

(define (WordsCounter i str wordsNumber)
	(if (< i (string-length str))
		(if (char=? (string-ref str i) #\ )
			(WordsCounter (+ i 1) str (+ wordsNumber 1))
			(WordsCounter (+ i 1) str wordsNumber)
		)
		(begin
			(set! wordsNumber (+ wordsNumber 1))
			wordsNumber
		)
	)
)

(define (AddDomain i counter domain new_mail)
	(if (< i (string-length new_mail))
		(begin
			(string-set! new_mail i (string-ref domain counter))
			(AddDomain (+ i 1) (+ counter 1) domain new_mail)
		)
		(void)
	)
)

(define (CreatMail i counter name domain new_mail)
	(if (< i (string-length name))
		(if (char=? (string-ref name i) #\ )
			(begin
				(string-set! new_mail counter (char-downcase (string-ref name (+ i 1))))
				(CreatMail (+ i 1) (+ counter 1) name domain new_mail)
			)
			(CreatMail (+ i 1) counter name domain new_mail)
		)
		(AddDomain counter 0 domain new_mail)
	)
)

(define (Main)
	(define name 0)
	(define domain "@utp.edu.co")
	
	(printf "Please enter your name: ")
	(set! name (read-line))
	
	(define new_mail (make-string (+ (WordsCounter 0 name 0) (string-length domain))))
	(string-set! new_mail 0 (char-downcase (string-ref name 0)))
	
	(if (> (string-length name) 200)
		(begin
			(printf "Max 200 Characters.\n")
			(newline)
			(Main)
		)
		(CreatMail 1 1 name domain new_mail)
	)

	(printf "This is your new email: ~a\n" new_mail)
)

(Main)

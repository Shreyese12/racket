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

(define (Main)
	(define input 0)

	(printf "Please enter a text: ")
	(set! input (read-line))

	(if (> (string-length input) 200)
		(begin
			(printf "Max 200 Characters.\n")
			(newline)
			(Main)
		)
		(printf "Number of words in the text are ~a.\n" (WordsCounter 0 input 0))
	)
)

(Main)

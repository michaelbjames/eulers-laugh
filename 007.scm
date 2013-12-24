; By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13
; we can see that the 6th prime is 13.

; What is the 10 001st prime number?

; if m =/= 0 (mod n) then n does NOT divide m
(define prime-helper (lambda (m n)
  (if (= m n)
    #t
    (if (= 0 (modulo m n))
      #f
      (prime-helper m (+ n 1))))))

(define prime? (lambda (m)
  (if (< m 2) 0 (prime-helper m 2))))

; Input: a natural number (prime or composite)
; Output: the next prime.
(define nextprime (lambda (k)
  (if (prime? (+ 1 k))
    (+ 1 k)
    (nextprime (+ 1 k)))))

; n is the number of primes to find
; k is the current prime
(define primecounter (lambda (n k)
  (if (< 0 n)
    (primecounter (- n 1) (nextprime k))
    k)))

; i = 1 since k = 2 (and 2 is prime)
(define nthprime (lambda (n)
  (primecounter n 1)))

; takes about 10 minutes of computation.
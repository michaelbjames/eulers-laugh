--A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
-- a^2 + b^2 = c^2

--There exists exactly one Pythagorean triplet for which a + b + c = 1000.
--Find the product abc.

module Main where

terna x = [(a,b,c) | a <- [1..x], b <- [a..x], c <- [b..x],
    a < b, b < c, a **2 + b**2 == c**2, a + b + c == 1000 ]

main = do
  print $ terna 200
--2520 is the smallest number that can be divided by each of the
--numbers from 1 to 10 without any remainder.

--What is the smallest positive number that is evenly divisible
--by all of the numbers from 1 to 20?

module Main where

my_gcd a 0 = a
my_gcd a b = my_gcd b $ mod a b

my_lcm a b = div (a * b) $ my_gcd a b

lcm_list :: Integral a => [a] -> a
lcm_list [] = 1
lcm_list (x:xs) = my_lcm x $ lcm_list xs

main = do
  print $ lcm_list [1..20]
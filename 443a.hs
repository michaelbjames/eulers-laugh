--Let g(n) be a sequence defined as follows:
--g(4) = 13,
--g(n) = g(n-1) + gcd(n, g(n-1)) for n > 4.

--The first few values are:
--  n   4   5   6   7   8   9   10  11  12  13  14  15  16  17  18  19  20  ...
--g(n)  13  14  16  17  18  27  28  29  30  31  32  33  34  51  54  55  60  ...
--You are given that g(1 000) = 2524 and g(1 000 000) = 2624152.

--Find g(10^15).

module Main where

import Data.List
import Euclid
import Prelude hiding(gcd)

-- Note that GCD(a,b) = d = (x * a + y * b) by the Extended Euclidean algorithm
-- g(4) = 13
-- g(5) = 14 = g(4) + (x1 * g(4) + y1 * 5)
-- g(6) = 16 = g(5) + (x2 * g(5) + y2 * 6)
-- ...
-- g(n) = ?? = g(n-1) + (xn * g(n-1) * yn * n)
--
-- We can work our way up from the bottom to a desired value of n
-- This skirts the complex memoization scheme of the previous version
-- The previous method's k-v store would grow unboundedly with the size
-- of input. But when the input is going to be 10^15, no system has enough
-- memory to handle that. 10^15 > 2^49.
--
-- Instead we opt for a g that takes at most log n time. It is provable
-- that the fibonacci sequence, the worst input to gcd, will take log n
-- time. Further, we want to ensure that our memory overhead is sub-linear.
-- We put our faith in Haskell's optimization so that we will use a CONSTANT
-- amount of space for this because of tail call optimization!

g _ 4 = 13
g prev n = let (a,b) = extended_gcd prev n
            in (1 + a) * prev + b * n

h n = foldr (\b a -> g b a) (13) [1..n]

main = do
  print $ h (toInteger $ 10 ^ 15)
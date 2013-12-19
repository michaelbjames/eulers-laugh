module Euclid where
import Prelude hiding(gcd)

--gcd       :: (Integral a) => a -> a -> a
gcd 0 0   =  error "gcd 0 0 is undefined"
gcd x y   =  gcd' (abs x) (abs y)
             where gcd' x 0  =  x
                   gcd' x y  =  gcd' y (x `mod` y)

--extended_gcd     :: (Integral a) => a -> a -> (a,a)
extended_gcd x y = let
              (q,r) = x `divMod` y
              in if r == 0
                then (0,1)
                else let
                  (a,b) = extended_gcd y r
                  in (b, a - (b * q))
--Let g(n) be a sequence defined as follows:
--g(4) = 13,
--g(n) = g(n-1) + gcd(n, g(n-1)) for n > 4.

--The first few values are:
--  n   4   5   6   7   8   9   10  11  12  13  14  15  16  17  18  19  20  ...
--g(n)  13  14  16  17  18  27  28  29  30  31  32  33  34  51  54  55  60  ...
--You are given that g(1 000) = 2524 and g(1 000 000) = 2624152.

--Find g(10^15).

module Main where

g :: (Int -> Int) -> Int -> Int
g mg 4 = 13
g mg n = let prev = mg(n-1)
          in prev + gcd n prev

data Tree a = Tree (Tree a) a (Tree a)
instance Functor Tree where
  fmap f (Tree l m r) = Tree (fmap f l) (f m) (fmap f r)

index :: Tree a -> Int -> a
index (Tree _ m _ ) 0 = m
index (Tree l _ r ) n = case (n - 1) `divMod` 2 of
  (q,0) -> index l q
  (q,1) -> index r q

nats :: Tree Int
nats = go 0 1
  where
    go !n !s = Tree (go l s') n (go r s')
      where
        l = n + s
        r = l + s
        s' = s * 2

toList :: Tree a -> [a]
toList as = map (index as) [0..]

g_tree :: Tree Int
g_tree = fmap (g fastest_g) nats

fastest_g :: Int -> Int
fastest_g = index g_tree

main = do
  print $ fastest_g 1000
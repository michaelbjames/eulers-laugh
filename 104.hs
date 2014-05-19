import Data.Char

import Data.List
 
fib1 n = snd . foldl fib' (1, 0) . map (toEnum . fromIntegral) $ unfoldl divs n
    where
        unfoldl f x = case f x of
                Nothing     -> []
                Just (u, v) -> unfoldl f v ++ [u]
 
        divs 0 = Nothing
        divs k = Just (uncurry (flip (,)) (k `divMod` 2))
 
        fib' (f, g) p
            | p         = (f*(f+2*g), f^2 + g^2)
            | otherwise = (f^2+g^2,   g*(2*f-g))

panDigital :: Integral a => [a] -> Bool
panDigital str = let digits = [1..9]
  in foldl (\b d ->
            b && (foldl (\ib c -> 
                          ib || (c == d))
            False str))
  True digits

digs :: Integral x => x -> [x]
digs 0 = []
digs x = digs (x `div` 10) ++ [x `mod` 10]

revDigs :: Integral x => x -> [x]
revDigs 0 = []
revDigs x = x `mod` 10 : revDigs (x `div` 10)

firstLast :: (Integral a) => Int -> a -> [[a]]
firstLast n num = [take n $ digs num, take n $ revDigs num]

--testNumber :: (Integral a) => a -> Bool
testNumber nfib = foldl (\b n -> b && panDigital n) True (firstLast 9 $ fib1 nfib)

--filter testNumber [1..]
main = do
  putStrLn $ show $ testNumber 329468
--The function lcm(a,b) denotes the least common multiple of a and b.
--Let A(n) be the average of the values of lcm(n,i) for 1≤i≤n.
--E.g: A(2)=(2+2)/2=2 and A(10)=(10+10+30+20+10+30+70+40+90+10)/10=32.

--Let S(n)=∑A(k) for 1≤k≤n.
--S(100)=122726.
--Find S(99999999019) mod 999999017.

a' n = foldl (\b i -> b + lcm i n) 0 [1..n]
a n = a' n `div` n

s n = foldl (\b i -> b + a i ) 0 [1..n]

--This is too slow.
main = do
  print $ s 10000
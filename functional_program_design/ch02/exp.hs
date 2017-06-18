-- Thinking Functionally with Haskell
-- Chapter 02 Homework F
-- 

myexp :: Integer -> Integer -> Integer
myexp x n | n == 0 = 1
    | n == 1 = x
    | even n = let half = myexp x (n `div` 2) in half * half
    | odd n = let half = myexp x (n `div` 2) in half * half * x


-- Thinking Functionally with Haskell
-- Chapter 04 Homework H
-- consider function `take` and `drop`
-- what will return for the following expressions:
-- 1. take 0 undefined     => []
-- 2. take undefined []    => Err
-- define the function: try to make both of them return [] 
-- result is that it's impossible
-- Why:  ?

mytake _ [] = []
mytake 0 _ = []
mytake n (x:xs)
    | n <= 0     = []
    | otherwise  = x: (mytake (n-1) xs)

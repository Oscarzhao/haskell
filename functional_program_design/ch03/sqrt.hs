-- Thinking Functionally with Haskell
-- Chapter 03 Homework F
-- sqrt

mysqrt :: (Floating a, Ord a) => a -> a
mysqrt x = until (\i -> abs (i*i -x) <= 0.000001) (\i -> (x/i + i)/2) 2.0

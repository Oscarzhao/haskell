-- Thinking Functionally with Haskell
-- Chapter 05  Homework G
-- implement minimum

minimum' :: Ord a => [a] -> a
minimum' [x] = x
minimum' (x:xs) = if x >= y then y
                  else x
                  where y = minimum' xs

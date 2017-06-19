-- Two men, for every man, every year, the probability of death is 1/2
-- Averagely, how long will it take for both the two men to die
-- result is 8/3
-- Use Mathematic Techniques to calculate it

-- probability that both two persons die at or before this year
dieBefore :: Integer -> Float
dieBefore n = (1 - 0.5^n) ^ 2


-- probability that both persons die at this year
dieAt = map (\x -> dieBefore x - dieBefore (x-1)) [1..]

every :: [Float]
every = map (\x -> (fromInteger x::Float) * (dieBefore x - dieBefore (x-1))) [1..]


total :: Int -> Float
total n = foldl (+) 0 (take n every)


-- Here we take `foldl` as example, and check the memory usage

-- > foldl (+) 0 [1..1000000]
-- > 500000500000
-- > (1.12 secs, 161,338,640 bytes)

-- > foldr (+) 0 [1..1000000]
-- > 500000500000
-- > (0.14 secs, 161,632,384 bytes)

import Data.List

-- mean , sumlen1
-- sumlen1 is the easist to implement, but with performance issue
sumlen1 xs = (sum xs, length xs)

-- sumlen2
sumlen2 [] = (0, 0)
sumlen2 xs = foldr f (0,0) xs where f x (s, n) = (s+x, n+1)

-- sumlen3
sumlen3 [] = (0, 0)
sumlen3 xs = foldl' g (0,0) xs where g (s, n) x = (s+x, n+1)

-- sumlen4 : O(n) memory
sumlen4 :: [Float] -> (Float, Int)
sumlen4 = foldl' g (0,0) where g (s, n) x = s `seq` n `seq` (s+x, n+1)

-- Cartesian product
-- sum $ map sum $ cp1 [[1..10] | j <- [1..6]]
cp1 [] = [[]]
cp1 (xs:xss) = [x:ys | x <- xs, ys <- cp1 xss]

-- cp2, performance better
-- sum $ map sum $ cp2 [[1..10] | j <- [1..6]]
cp2 :: [[a]] -> [[a]]
cp2 = foldr op [[]]
  where op xs yss = [x:ys | x <- xs, ys <- yss]

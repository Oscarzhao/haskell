-- Thinking Functionally with Haskell
-- Chapter 3 floor in O(lgN)
--
-- Examples:
-- Input: -2.5, Output: -3
-- Input: 0   , Output: 0
-- Input: 1.3 , Output: 1


-- bound get a pair of Integers [m, n) 
-- so that x >= m && x < n
bound :: Float -> (Integer, Integer)
bound x = (lower x, upper x)

lower :: Float -> Integer
lower x = until ((<=x) . fromInteger)  (*2) (-1)

upper :: Float -> Integer
upper x = until ((>x) . fromInteger)  (*2) 1

halfNum :: Float -> (Integer, Integer) -> (Integer, Integer)
halfNum x (m,n) = if qf <= x 
                  then (q, n)
                  else (m, q)
                  where q = div (m + n) 2
                        qf = fromInteger q :: Float

myfloor :: Float -> Integer
myfloor x = fst ( until (\ (m,n) -> m+1 == n) (halfNum x)  (bound x))

-- Thinking Functionally with Haskell
-- chapter 03 Homework E
--
-- what is isqrt: https://en.wikipedia.org/wiki/Integer_square_root


-- bound get a pair of Integers [m, n) 
-- so that x >= m && x < n
bound :: Float -> (Integer, Integer)
bound x 
     |y > 1 = (div y 2, y) 
     |otherwise = (0, 1)
      where y = upper x

upper :: Float -> Integer
upper x = until ((>x) . (\i -> i * i) . fromInteger)  (*2) 1

halfNum :: Float -> (Integer, Integer) -> (Integer, Integer)
halfNum x (m,n) = if qf <= x 
                  then (q, n)
                  else (m, q)
                  where q = div (m + n) 2
                        qf = (\i -> i * i) (fromInteger q :: Float)


isqrt :: Float -> Integer
isqrt x = fst (until (\(m,n) -> m+1==n) (halfNum x) (bound x))


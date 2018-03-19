import Data.Array (accumArray, Array, (!))
import Data.List ((\\), partition)
import Data.Array.ST (runSTArray, writeArray, newArray)

-- solution 1: performance issues
minfreeRaw :: [Integer] -> Integer
minfreeRaw xs = head([0..] \\ xs)

-- solution 2: rely on accumArray
checklist :: [Int] -> Array Int Bool
checklist xs =  accumArray (||) False (0,n)
                (zip (filter (<= n) xs)(repeat True))
                where n = length xs

countlist :: [Int] -> Array Int Int
countlist xs = accumArray (+) 0 (0,n) (zip xs (repeat 1))
               where n = length xs

firstFalse xs = length $ takeWhile (\i -> xs!i) [0..]

-- solution 3: write by yourself (use monad, a procedual program in functional clothing)
checklistm xs = runSTArray(do
        { a <- newArray(0,n) False;
        sequence_ [writeArray a x True | x <- xs, x <= n];
        return a})
    where n = length xs

-- solution 4: divide and conquer
minfree xs = minfrom 0 (length xs, xs)
minfrom a (n, xs) | n == 0     = a
                  | m == b - a = minfrom b (n-m, vs)
                  | otherwise = minfrom a (m, us)
                    where b        = a + 1 + n `div` 2
                          (us, vs) = partition (<b) xs
                          m        = length us

import Data.Array (accumArray, Array, (!))
import Data.List ((\\))


-- solution 1: performance issues
minfree :: [Integer] -> Integer
minfree xs = head([0..] \\ xs)

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



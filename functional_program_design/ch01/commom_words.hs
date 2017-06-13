-- Thinking Functionally with Haskell
-- Example 1.3 (High Frequency Words)
-- 
import Data.List
import Data.Char

-- sortWords is a special case for sort
sortWords :: [String] -> [String]
sortWords = sort

comparePair :: (Int, String) -> (Int, String) -> Ordering
comparePair (x, _) (y, _) 
    | x > y = LT
    | x==y = EQ
    | otherwise = GT

-- sortRuns
sortRuns :: [(Int, String)] -> [(Int, String)]
sortRuns = sortBy comparePair

-- countRuns 
countRuns :: [String] -> [(Int, String)]
countRuns [] = []
countRuns [x] = [(1, x)]
countRuns (x:xs)
    | x == item = (count+1,item):rems
    | otherwise = (1, x):items
    where items@((count, item):rems) = countRuns xs

-- showRun export a (Int, String) pair into a string
showRun :: (Int, String) -> String
showRun (x, y) = show x ++ ": " ++ show y ++ "\n"

commonWords :: Int -> String -> String
commonWords n = concat . map showRun . take n . sortRuns . countRuns . 
                sortWords . words . map toLower
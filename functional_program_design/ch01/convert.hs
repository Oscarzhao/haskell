-- Thinking Functionally with Haskell
-- Example 1.4 (Converting number into words)
-- 
-- Here is the first version, existing problems are:
-- 1. sometimes we need an "and" (hundrend is ZERO)
-- 2. sometimies we do not need zero

import Data.List
import Data.Char

convert :: Int -> String
convert 0 = "zero"
convert 1 = "one"
convert 2 = "two"
convert 3 = "three"
convert 4 = "four"
convert 5 = "five"
convert 6 = "six"
convert 7 = "seven"
convert 8 = "eight"
convert 9 = "nine"
convert 10 = "ten"
convert 11 = "eleven"
convert 12 = "twelve"
convert 13 = "thirteen"
convert 14 = "fourteen"
convert 15 = "fifteen"
convert 16 = "sixteen"
convert 17 = "seventeen"
convert 18 = "eighteen"
convert 19 = "nineteen"
convert 20 = "twenty"
convert 30 = "thirty"
convert 40 = "forty"
convert 50 = "fifty"
convert 60 = "sixty"
convert 70 = "seventy"
convert 80 = "eighty"
convert 90 = "ninety"
convert x 
    | x < 100 = convert (x - rem10) ++ "-" ++ (convert rem10)
    | x < 1000 = convert (x `div` 100) ++ " hundred" ++ 
                 (if rem100 == 0 
                     then "" 
                    else " and " ++ convert rem100)
    | x < 1000000 = convert (x `div` 1000) ++ " thousand" ++ 
                    (if rem1000 == 0 then ""
                        else if rem1000 < 100 then " and " ++ convert rem1000
                        else " " ++ convert rem1000)
    | otherwise = show x
    where rem10 = x `mod` 10
          rem100 = x `mod` 100
          rem1000 = x `mod` 1000
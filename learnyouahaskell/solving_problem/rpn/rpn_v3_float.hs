-- solveRPN is a reverse Polish notation calculator
-- inputs:  "90 34 12 33 55 66 + * - +"  
-- output: -3947
import Data.List

solveRPN :: String -> Float
solveRPN = head . foldl foldingFunction [] . words
     where foldingFunction (x:y:ys) "*" = (x * y):ys
           foldingFunction (x:y:ys) "+" = (x + y):ys
           foldingFunction (x:y:ys) "-" = (y - x):ys
           foldingFunction (x:y:ys) "/" = (y / x):ys
           foldingFunction (x:y:ys) "^" = (y ** x):ys
           foldingFunction (x:ys) "ln" = log x:ys
           foldingFunction xs "sum" = [sum xs] 
           foldingFunction xs numberString = read numberString:xs


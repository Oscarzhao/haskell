-- Thinking Functionall with Haskell
-- Chapter 05 Homework F
-- Implement words

import Data.List

-- whiteSpace tests a Char is white space or not
whiteSpace :: Char -> Bool
whiteSpace ' ' = True
whiteSpace '\t' = True 
whiteSpace '\n' = True
whiteSpace '\r' = True
whiteSpace _ = False

words' :: [Char] -> [[Char]]
words' s = helper (dropWhile whiteSpace s)
    where helper [] = [] 
          helper ss = let (prefix, suffix) = span (not . whiteSpace) (dropWhile whiteSpace ss) 
                      in prefix : helper (dropWhile whiteSpace suffix)

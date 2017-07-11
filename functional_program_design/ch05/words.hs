-- Thinking Functionall with Haskell
-- Chapter 05 Homework F
-- Implement words

import Data.List

-- whiteSpace tests a Char is white space or not
whiteSpace :: Char -> Bool
whiteSpace ' ' = True
whiteSpace '\t' = True 
whiteSpace '\n' = True
whiteSpace _ = False

words' :: [Char] -> [[Char]]
words' [] = []
words' ss = let (prefix, suffix) = span (not . whiteSpace) ss 
            in prefix : words' (dropWhile whiteSpace suffix)

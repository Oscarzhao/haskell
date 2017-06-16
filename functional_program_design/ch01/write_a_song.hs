-- Thinking Functionally with Haskell
-- Homework G (Write a Song)
-- 
-- Example:
-- > putStrLn (song 3)
-- 
-- One man went to mow
-- Went to mow a meadow
-- One man and his dog
-- Went to mow a meadow
--
-- Two men went to mow
-- Went to mow a meadow
-- Two men, one man and his dog
-- Went to mow a meadow
--
-- Three men went to mow
-- Went to mow a meadow
-- Three men, two men, one man and his dog
-- Went to mow a meadow
--

import Data.Char

song n = if n==0 then ""
         else if n > 10 then song 10 ++ "\n...\n"
         else song (n-1) ++ "\n" ++ verse n

verse n = line1 n ++ line2 n ++ strToUpper (line3 n) ++ line4 n

mens :: [String]
mens = ["one man", "two men", "three men", "four men", "five men", "six men", "seven men", "eight men", "nine men", "ten men"]

-- Capitalize a string
strToUpper :: String -> String
strToUpper s = toUpper (head s) : tail s

line1 n =  let strMan = mens!!(n-1) in strToUpper strMan ++ " went to mow\n"
line2 n = "Went to mow a meadow\n"
line3 n = if n == 1 then "one man and his dog\n"
          else mens!!(n-1) ++ ", " ++ line3 (n-1)
line4 = line2
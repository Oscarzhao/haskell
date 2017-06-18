-- Thinking Functionally with Haskell 
-- Chapter 2, Homework C
--
-- Input: "The morphology of prex- an essay in meta-algorithmics
-- Output:"The Morphology Of Prex- An Essay In Meta-algorithmics
--

import Data.Char (toUpper)

capitalize :: String -> String
capitalize = unwords . map capitalizeWord . words


capitalizeWord :: String -> String
capitalizeWord str = toUpper (head str) : tail str

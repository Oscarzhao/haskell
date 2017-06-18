-- Thinking Functionally with Haskell
-- Chapter 2 Homework G
--
-- Examples:
-- Input:  (10, 12, 2013)
-- Output: "10th December, 2013"


showDate :: (Int, Int, Int) -> String
showDate (x,y,z) = show x ++ suffixes!!(x-1) ++ " " ++ months!!(y-1) ++ ", " ++ show z

months = ["Janunary", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
suffixes = ["st", "nd", "rd"] ++ (replicate 17 "th") ++ ["st", "nd", "rd"] ++ (replicate 7 "th") ++ ["st"]

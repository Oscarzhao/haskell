-- Thinking Functionally with Haskell
-- Chapter 4 Homework E
-- 1^3 + 12^3 = 9^3 + 10^3 = 1729
-- find the second such number

squarelist = map (^3) [0..]

-- generate a list of quadri-tuple which satisfies:
-- x1^3 + x2^3 = y1^3 + y2^3
tetrad n = [(x1, y1, y2, x2) | x1 <- [1..n], 
                             x2 <-[x1+1..n], 
                             y1 <- [x1+1..x2-1],
                             y2 <- [y1+1..x2-1], 
                             squarelist!!x1 + squarelist!!x2 == squarelist!!y1 + squarelist!!y2]


result = (tetrad 17)!!1
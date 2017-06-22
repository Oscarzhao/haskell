-- Thinking Functionall with Haskell
-- Chapter 4 Homework C
-- find common elements for two decreasing list

disjoint :: (Ord a) => [a] -> [a] -> Bool
disjoint [] ys = False
disjoint xs [] = False
disjoint (x:xs) (y:ys) = if x == y then True
                         else if x > y then disjoint xs (y:ys)
                         else disjoint (x:xs) ys

-- Thinking Functionall with Haskell
-- Chapter 05 Homework
-- Implement a new version of nub, which does not care about Order
-- the complexity of normal nub is O(n^2)

import Data.List

myNub :: (Ord a) => [a] -> [a]
myNub xs = nubOrder ys
    where ys = sort xs
          nubOrder [] = []
          nubOrder [x] = [x]
          nubOrder (x:y:zs) = if x==y
                              then nubOrder (y:zs)
                              else x: nubOrder (y:zs)

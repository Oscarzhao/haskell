-- Thinking Functionally with Haskell
-- Chapter 05 Homework D
-- nodups with order

import Data.List

myNodups :: (Ord a) => [a] -> Bool
myNodups xs = nodupsOrdered ys
    where ys = sort xs
          nodupsOrdered [] = True 
          nodupsOrdered [_] = True 
          nodupsOrdered (x:y:zs) = (x/=y) && (nodupsOrdered (y:zs))

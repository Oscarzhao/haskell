-- this function has the same effect as
-- (+) <$> (*2) <*> (+10)

import Control.Monad.Instances

addStuff :: Int -> Int
addStuff = do
    a <- (*2)
    b <- (+10)
    return (a+b)

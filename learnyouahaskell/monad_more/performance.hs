-- in this example, we shall check the performance of prepend and append

import Control.Monad.Writer

-- finalCountDown' use normal append
finalCountDown' :: Int -> Writer [String] ()
finalCountDown' 0 = tell ["0"]
finalCountDown' x = do
    finalCountDown' (x-1)
    tell [show x]

-- final CountDown uses DiffList (prepend)
newtype DiffList a = DiffList {getDiffList :: [a] -> [a]}

toDiffList :: [a] -> DiffList a
toDiffList xs = DiffList (xs++)

fromDiffList :: DiffList a -> [a]
fromDiffList (DiffList f) = f []

instance Monoid (DiffList a) where
    mempty = DiffList (\xs -> [] ++ xs)
    (DiffList f) `mappend` (DiffList g) = DiffList (f.g)

finalCountDown :: Int -> Writer (DiffList String) ()
finalCountDown 0 = tell (toDiffList ["0"])
finalCountDown x = do
    finalCountDown (x-1)
    tell (toDiffList [show x])

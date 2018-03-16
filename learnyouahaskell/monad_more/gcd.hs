-- gcd with log
-- tell http://hackage.haskell.org/package/mtl-2.2.1/docs/Control-Monad-Writer-Class.html#v:tell
-- in the case of Writer, `tell` takes a monoid value, like `["This is going on"]` and creates a `Writer`
-- value that presents the dummy value `()` as its result but has our desired monoid value attached.
-- When we have a monadic value that has `()` as its result, we don't bind it to a variable.

import Control.Monad.Writer

gcd' :: Int -> Int -> Int
gcd' a b
    | b == 0    = a
    | otherwise = gcd' b (a `mod` b)

-- gcd'' is a gcd with log
gcd'' :: Int -> Int -> Writer [String] Int
gcd'' a b
    | b == 0 = do
        tell ["Finished with " ++ show a]
        return a
    | otherwise = do
        tell [show a ++ " mod " ++ show b ++ " = " ++ show (a `mod` b)]
        gcd'' b (a `mod` b)

-- test the functions
-- mapM_ putStrLn $ snd $ runWriter (gcd'' 8 3)

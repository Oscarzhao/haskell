import Data.Monoid

-- isBigGang is used to explain Writer monad
isBigGang :: Int -> (Bool, String)
isBigGang x = (x > 9, "Compared gang size to 9.")

-- if we want to feed the (Bool, String) value to isBigGang, we have to do extra work
-- here we create a function called "applyLog", just similar to "applyMaybe" created previously
applyLog :: (Monoid m) => (a, m) -> (a -> (b, m)) -> (b, m)
applyLog (x, log) f = let (y, newLog) = f x in (y, log `mappend` newLog)


-- addDrink is used to explain Monoid tuple
type Food = String
type Price = Sum Int
addDrink :: Food -> (Food, Price)
addDrink "beans" = ("milk", Sum 25)
addDrink "jerky" = ("whiskey", Sum 99)
addDrink _ = ("beer", Sum 30)

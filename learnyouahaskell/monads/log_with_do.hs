-- logging feature implemented with do syntax
import Control.Monad.Writer

-- be careful: the code does not compile correctly
logNumber :: Int -> Writer [String] Int
logNumber x = Writer (x, ["Got number: " ++ show x])

multWithLog :: Writer [String] Int
multWithLog = do
	a <- logNumber 3
	b <- logNumber 5
	return (a*b)


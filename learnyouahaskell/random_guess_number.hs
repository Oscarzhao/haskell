-- Let people guess number using Random library

import System.Random
import Control.Monad(when)

main = do 
  gen <- getStdGen
  askForNumber gen

askForNumber :: StdGen -> IO()
askForNumber gen = do
  putStrLn "Which number in the range from 1 to 10 am I thinking of?  "
  let (randNumber, newGen) = randomR (1, 10) gen :: (Int, StdGen)
  numberString <- getLine
  when (not $ null numberString) $ do
    let number = read numberString
    if randNumber == number
      then putStrLn "You are correct!"
      else putStrLn $ "Sorry, it was " ++ show randNumber
    askForNumber newGen

-- import and read command line argument

import System.Environment
import Data.List

main = do
  args <- getArgs
  progName <- getProgName
  putStrLn "The arguments are:"
  print  args
  mapM putStrLn args
  putStrLn "The program name is:"
  putStrLn progName

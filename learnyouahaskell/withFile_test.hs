-- withFile takes a path to a file, an IOMode and then it takes a function that
-- takes a handle and returns some I/O action.

-- I don't know why do is a must here
import System.IO

main = do
  withFile "girlfriend.txt" ReadMode (\handle -> do
    contents <- hGetContents handle
    putStr contents)


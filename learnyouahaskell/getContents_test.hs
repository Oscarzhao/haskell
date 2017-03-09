-- getContents is an I/O action that reads everything from the standard input
-- until it encounters an end-of-file character.
-- getContents is really useful when we're piping the output from one program
-- into input of our program.
import Data.Char

main = do
  contents <- getContents
  putStr $ map toUpper contents

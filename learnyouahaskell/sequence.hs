-- sequence takes a list of I/O actions and returns an I/O actions that will 
-- perform those actions one after the other. The result contained in that I/O 
-- action will be a list of the results of all the I/O actions that were performed.
-- Its type signature is sequence :: [IO a] -> IO [a]. 

main = do
  rs <- sequence [getLine, getLine, getLine]
  print rs

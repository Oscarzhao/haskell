-- Use fmap to implement reverse
-- compilation: stack ghc -- line_v2.hs -o main
-- run:    ./main
-- input:  <any string>
main = do line <- fmap reverse getLine
          putStrLn $ "You said " ++ line ++ " backwards!"
          putStrLn $ "yes, you really said " ++ line ++ " backwards!"


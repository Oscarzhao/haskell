-- Use reverse and line to implement line'
main = do line <- getLine
          let line' = reverse line
          putStrLn $ "You said " ++ line' ++ " backwards!"
          putStrLn $ "Yes, you really said " ++ line' ++ " backwards!"


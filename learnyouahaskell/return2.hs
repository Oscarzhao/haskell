main = do
  a <- return "Hello"
  b <- return "world"
  putStrLn $ a ++ ", " ++ b ++ "!"

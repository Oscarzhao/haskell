-- this is a normal foo, without monad
foo :: Maybe String
foo = Just 3 >>= (\x ->
        Just "!" >>= (\y ->
            Just (show x ++ y)))

-- use do syntax to simplify the code
fooM :: Maybe String
fooM = do
  x <- Just 3
  y <- Just "!"
  Just (show x ++ y)

-- Here we take `foldl` as example, and check the memory usage

-- > foldl (+) 0 [1..1000000]
-- > 500000500000
-- > (1.12 secs, 161,338,640 bytes)

-- > foldr (+) 0 [1..1000000]
-- > 500000500000
-- > (0.14 secs, 161,632,384 bytes)
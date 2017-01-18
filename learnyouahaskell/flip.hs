flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
    where g y x = f x y

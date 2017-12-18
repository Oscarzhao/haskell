-- applyMaybe consumes a Maybe value, and a function which takes a normal value and returns a Maybe value
applyMaybe :: Maybe a -> (a -> Maybe b) -> Maybe b
applyMaybe Nothing f = Nothing
applyMaybe (Just x) f = f x

-- Usage
-- ghci> :l applyMaybe
-- ghci> applyMaybe (Just 3) (\x -> (Just [x]))
-- Just [3]

-- applyMaybe is a special case of (>>=)

minimum' :: (Ord a) => [a] -> a
minimum' [] = error "minimum of emtpy list"
minimum' [x] = x
minimum' (x:xs)
    | x < minElem = x
    | otherwise = minElem
    where minElem = minimum' xs

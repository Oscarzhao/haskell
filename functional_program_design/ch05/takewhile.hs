-- Thinking Functionall with Haskell
-- Chapter 05 Homework F
-- Implement takeWhile and dropWhile with recursion

-- takeWhile and dropWhile satisfy the following restriction
-- span p xs = (takeWhile p xs, dropWhile p xs)

takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' _ [] = []
takeWhile' p (x:xs) = if p x 
                     then x : (takeWhile' p xs)
                     else []

dropWhile' :: (a -> Bool) -> [a] -> [a]
dropWhile' _ [] = []
dropWhile' p (x:xs) = if p x 
                     then dropWhile' p xs 
                     else (x:xs)

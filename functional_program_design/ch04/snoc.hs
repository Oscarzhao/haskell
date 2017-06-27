-- Thinking Functionally with Haskell
-- Chapter 04 Homework F
--
-- Another way to construct a list is
-- to add elements to the tail of the list, for example:
-- data List a = Nil | Snoc (List a) a
-- Snoc is the reverse of Cons, so [1,2,3] could be written as
-- Snoc (Snoc ( Snoc Nil 1) 2) 3)
-- please define `head` and `last` in Snoc-way
-- and define the conversion functions between `Snoc-way` and `Cons-way`

data List a = Nil | Snoc (List a) a deriving (Show)

-- Snoc version head
snochead :: List a -> List a
snochead (xs `Snoc` x) = xs

-- Snoc version tail
snoctail :: List a -> a 
snoctail (xs `Snoc` x) = x

-- convert Cons-wat list to Snoc-way list
toList :: [a] -> List a 
toList = toListHelper . reverse

toListHelper :: [a] -> List a 
toListHelper [] = Nil 
toListHelper (x:xs) = Snoc snocxs x
    where snocxs = toListHelper xs

-- convert Snoc-way list to Cons-way list
fromList :: List a -> [a]
fromList = reverse . fromListHelper

fromListHelper :: List a -> [a]
fromListHelper Nil = []
fromListHelper (Snoc xs x) = x:ys 
    where ys = fromListHelper xs
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

instance Foldable Tree where
    foldMap f EmptyTree = mempty
    foldMap f (Node x l r) = foldMap f l `mappend`
                             f x         `mappend`
                             foldMap f r

singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right) 
    | x == a = Node a left right
    | x <  a = Node a (treeInsert x left) right
    | x >  a = Node a left (treeInsert x right)

treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem  x EmptyTree = False
treeElem x (Node a left right) 
    | x == a = True
    | x <  a = treeElem x left
    | x >  a = treeElem x right


testTree = Node 5
             (Node 3
                 (Node 1 EmptyTree EmptyTree)
                 (Node 6 EmptyTree EmptyTree)
             )
             (Node 9
                 (Node 8 EmptyTree EmptyTree)
                 (Node 10 EmptyTree EmptyTree)
             )

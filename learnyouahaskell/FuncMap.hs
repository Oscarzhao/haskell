import qualified Data.Map as Map

instance Functor (Map.Map a) where 
    fmap f x = Map.map f x

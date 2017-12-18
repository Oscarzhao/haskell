# Monoid typeclass

Monoid type class belongs to `Data.Monoid`.  It's defined as the following:

```{haskell}
class Monoid m where
    mempty :: m
    mappend :: m -> m -> m
    mconcat :: [m] -> m
    mconcat = foldr mappend mempty
```

Its functions satisfys the three laws:

``` {haskell}
mempty `mappend` x = x    -- identity
x `mappend` mempty = x    -- identity
(x `mappend` y) `mappend` z = x `mappend` (y `mappend` z)  -- associativity
```

The definition and the laws are too abstract, we shall see some Monoid instances.

## Lists are monoids

Here is how `Lists instance` is implemented:

``` {haskell}
instance Monoid [a] where
    mempty = []
    mappend = (++)
```

We don't need define `mconcat` because it's defined by `mappend` and `mempty`.
The usage is much more simple:

```{haskell}
ghci> [1,2,3] `mappend` [4,5,6]
ghci> [1,2,3] ++ [4,5,6]

ghci> -- concat
ghci> mconcat [[1,2], [3,4], [5]]
ghci> concat [[1,2], [3,4], [5]]
```

## Product and Sum

Definition of `Product` is:

``` {haskell}
newtype Product a =  Product { getProduct :: a }
    deriving (Eq, Ord, Read, Show, Bounded)

instance Num a => Monoid (Product a) where
    mempty = Product 1
    Product x `mappend` Product y = Product (x * y)
```

Usage:

```{haskell}
ghci> getProduct $ Product 3 `mappend` Product 4 `mappend` Product 2
24
ghci> getProduct . mconcat . map Product $ [3,4,2]
24
```

## Any and All

1. `Any` is logical `OR`
2. `All` is logical `AND`

Definition of `Any` is:

```{haskell}
newtype Any = Any { getAny :: Bool }
    deriving (Eq, Ord, Read, Show, Bounded)

instance Monoid Any where
        mempty = Any False
        Any x `mappend` Any y = Any (x || y)
```

Usage:

```{haskell}
ghci> getAny . mconcat . map Any $ [False, False, False, True]
True
ghci> getAny $ mempty `mappend` mempty
False
```

## Ordering monoid

Definitions:

```{haskell}
instance Monoid Ordering where
    mempty = EQ
    LT `mappend` _ = LT
    EQ `mappend` y = y
    GT `mappend` _ = GT
```

## Foldable Monoid

`Foldable` type class is from `Data.Foldable`.

We can *fold* many types, for example:

```{haskell}
ghci> foldr (*) 1 [1,2,3,4]
24
ghci> foldr (+) 0 [1,2,3,4]
10
ghci> foldr (||) False (Just True)
True
ghci> foldr (+) 2 (Just 11)
13
```

We may have a question: what kind of data type is foldable?

The answer is: the type must implement `foldMap` function.

Usage:

```{haskell}
ghci> :l Tree.hs
ghci> import Data.Monoid

ghci> foldl (*) 1 testTree
64800
ghci> getAny $ foldMap (\x -> Any $ x == 3) testTree
True
```
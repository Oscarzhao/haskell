# Monad type class

Monard's definition is:

```{haskell}
class Monad m where
    return :: a -> m a

    (>>=) :: m a -> (a -> m b) -> m b

    (>>) :: m a -> m b -> m b
    x >> y = x >>= \_ -> y

    fail :: String -> m a
    fail msg = error msg
```

## Maybe Monad

Definition of `Maybe` instance of Monad:

```{haskell}
instance Monad Maybe where
    return x = Just x
    Nothing >>= f = Nothing
    Just x >>= f = f x
    fail _ = Nothing
```

About `return`:
The first function that the Monad type class defines is `return`.
It's the same as `pure`, only with a different name. Its type is `(Monad m) => a -> m a`.
It takes a value and puts it *in a minimal default context that still holds that value*.
In other words, it takes something and wraps it in a monad.
It always does the same thing as the `pure` function from the `Applicative` type class,
which means we're already acquainted with return. We already used return when doing I/O.
We used it to take a value and make a bogus I/O action that does nothing but yield that value.
For Maybe it takes a value and wraps it in a `Just`.

## do notation

The principle of `do` is *gluing together monadic values in sequence*.

We could feel the simplicity of Monad from the example in `foo.hs`.

*Note*: In a `do` expression, every line is a monadic value. To inspect the value, we need to use `<-`.

## List Monad

Definition:

```{haskell}
instance Monad [] where
    return x = [x]
    xs >>= f = concat (map f xs)
    fail _ = []
```

Usage:

```{haskell}
ghci> (*) <$> [1,2,3] <*> [10,100,1000]
[10,100,1000,20,200,2000,30,300,3000]
```

### MonadPlus

Let's check the `|` operator, which is `guard` function.
In this part, we shall study how the `guard` function is implemented.

```{haskell}
ghci> [ x | x <- [1..50], '7' `elem` show x ]
[7,17,27,37,47]
```

The `MonadPlus` type class is for `monads` that can also act as `monoids`.
It's definition is:

```{haskell}
class Monad m => MonadPlus m where
    mzero :: m a
    mplus :: m a -> m a -> m a
```

`mzero` is synonymous to `mempty` from the `Monoid` type class and `mplus` corresponds to `mappend`.

List MonadPlus is defined as:

```{haskell}
instance MonadPlus [] where
    mzero = []
    mplus = (++)
```

The `guard` function is defined as:

```{haskell}
-- from import Control.Monad
guard :: (MonadPlus m) => Bool -> m ()
guard True = return ()
guard False = mzero
```

It takes a boolean value and if it's `True`, takes a `()` and puts it in a minimal default context that still succeeds. 
Otherwise, it makes a failed monadic value. Here it is in action:

```{haskell}
ghci> guard (5 > 2) :: Maybe ()
Just ()
ghci> guard (1 > 2) :: Maybe ()
Nothing
ghci> guard (5 > 2) :: [()]
[()]
ghci> guard (1 > 2) :: [()]
[]
```

It looks the function is useless at all.  In list monad, we can use it to filter out non-deterministic computations. Observe:

```{haskell}
Prelude Control.Monad> [1..50] >>= (\x -> guard ('7' `elem` show x) >> return x)
[7,17,27,37,47]
```

The following function is implemented with `do` notation, which has the same effect:

```{haskell}
sevensOnly :: [Int]
sevensOnly = do
    x <- [1..50]
    guard ('7' `elem` show x)
    return x
```

## Monad Laws

Just because something is made an instance of the `Monad` type class doesn't mean that it's a monad,
it just means that it was made an instance of a type class.
For a type to truly be a monad, the monad laws must hold for that type.
(Why we need the laws) *These laws allow us to make reasonable assumptions about the type and its behavior*.

1. Left Identity

`return x >>= f` is the same as `f x`.

2. Right Identity

`m >>= return` is the same as `m`.

Check the code:

```{haskell}
ghci> Just "move on up" >>= (\x -> return x)
Just "move on up"
ghci> [1,2,3,4] >>= (\x -> return x)
[1,2,3,4]
ghci> putStrLn "Wah!" >>= (\x -> return x)
Wah!
```

Check the definition of `>>=`, and reason why.

for list is: `xs >>= f = concat (map f xs)`

3. Associativity

The final monad law says that when we have a chain of monadic function applications with `>>=`, it shouldn't matter how they're nested. Formally written:

Doing `(m >>= f) >>= g` is just like doing `m >>= (\x -> f x >>= g)`.

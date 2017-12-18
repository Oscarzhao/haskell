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

## Examples

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

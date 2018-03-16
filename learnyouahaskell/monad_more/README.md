# A Few More Monads

## The Writer type

The `Writer` type in `Control.Monad.Writer` attach a monoid to a value and return a tuple.  The definition is:

```{haskell}
newtype Writer w a = Writer { runWriter :: (a, w) }

-- Monad definition
instance (Monoid w) => Monad (Writer w) where
    return x = Writer (x, mempty)
    (Writer (x,v)) >>= f = let (Writer (y, v')) = f x in Writer (y, v `mappend` v')
```

## The Reader Type

First we check two functions `<$>` and `<*>`:

Definition of `<$>`:

```{haskell}
(<$>) :: (Functor f) => (a -> b) -> f a -> f b  
f <$> x = fmap f x  
```

Notes from the book: *Quick reminder: type variables are independent of parameter names or other value names. The f in the function declaration here is a type variable with a class constraint saying that any type constructor that replaces f should be in the Functor typeclass. The f in the function body denotes a function that we map over x. The fact that we used f to represent both of those doesn't mean that they somehow represent the same thing.*

Definition of `<*>`:

```{haskell}
class (Functor f) => Applicative f where  
    pure :: a -> f a  
    (<*>) :: f (a -> b) -> f a -> f b  

-- defition on (->) r
instance Applicative ((->) r) where  
    pure x = (\_ -> x)  
    f <*> g = \x -> f x (g x) 
```

Here are some examples on how to use the two functions:

```
Prelude> :t (<$>)
(<$>) :: Functor f => (a -> b) -> f a -> f b
Prelude> :t (<*>)
(<*>) :: Applicative f => f (a -> b) -> f a -> f b
Prelude> (+) <$> Just 1 <*> Just 3
Just 4
Prelude> (+) <$> [1,2] <*> [10,12]
[11,13,12,14]
Prelude> (+) <$> (1+) <*> (2+) $ 1
5
Prelude> (+) <$> (1+) <*> (2*) $ 1
4
```

`(->) r` is not only a functor and an applicative functor, it's also a monad. It's located in `Control.Monad.Instances`, the definition is like this:

```{haskell}
instance Monad ((->) r) where
    return x = \_ -> x
    h >>= f = \w -> f (h w) w
```

check file `addstuff.hs` to see how to implement the above function with Monad.

## Stateful Computations

Stateful Monad is used to deal with stateful problems a breeze while still keeping everything nice and pure.





## References

1. [Functional Programming with Overloading and Higher-Order Polymorphism](http://web.cecs.pdx.edu/~mpj/pubs/springschool.html "fp")
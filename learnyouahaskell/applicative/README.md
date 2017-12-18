# Applicative Functor

`Applicative` typeclass lies in `Control.Applicative` module.  Its definition is as the following:

``` {haskell}
class (Functor f) => Applicative f where
    pure :: a -> f a
    (<*>) :: f (a -> b) -> f a -> f b
```

## Examples

1. *List*:

The three lines is equivalent to each other, generating all
combinations of elements from the two lists.

``` {haskell}
ghci> pure (+) <*> [1,2,3] <*> [1,5,10,15]
ghci> fmap (+) [1,2,3] <*> [1,5,10,15]
ghci> [i+j | i <- [1,2,3], j <- [1,5,10,15]]
```

2. *ZipList*:

Sometimes, we want to merge two lists into one. There are many ways to achive this.
We use ZipList to acheive the goal (`import Control.Applicative`).

``` {haskell}
ghci> zipWith (+) [1,2,3] [1,5,10]
ghci> getZipList $ pure (+) <*> ZipList [1,2,3] <*> ZipList [1,5,10]
```

## Laws of Applicative Functors

``` {haskell}
pure f <*> v = fmap f v
pure id <*> v = v
pure (.) <*> u <*> v <*> w = u <*> (v <*> w)
pure f <*> pure x = pure (f x)
u <*> pure y = pure ($ y) <*> u
```

## newtype keyword

Let's check the definition of `ZipList`:

``` {haskell}
newtype ZipList a = ZipList { getZipList :: [a] }
```

We can see that `newtype` keyword is used.  Here we can use `data` keyword, too.
When you use `data` keyword to wrap a type, there is some overhead in *wrapping* and
*unwrapping* when your program is running.

When you use `newtype` keyword, the new-decleared type is a different type, but is the same
internally.  Haskell can get rid of the *wrapping* and *unwrapping* once it resolves which value is of what type.

*Note*: With `newtype`, you're restricted with one constructor with one field.

### newtype is lazy

Here we explain why we say *newtype is lazy*.  The *helloMe* function does NOT evaluate
its param with type `CoolBool`.

``` {haskell}
helloMe :: CoolBool -> String
helloMe (CoolBool _) = "hello"
```

If we define `CoolBool` with `data` keyword, like

``` {haskell}
data CoolBool = CoolBool { getCoolBool :: Bool }
```

when we pass undefined to `helloMe`, we'll get an exception:

``` {haskell}
ghci> helloMe undefined
"*** Exception: Prelude.undefined
```

However, if we define it in this way:

``` {haskell}
newtype CoolBool = CoolBool { getCoolBool :: Bool }
```

Things would be fine.

## type vs. newtype vs. data

1. type keyword

The `type` keyword is for making type synonyms. What that means is that we just give another name to an already existing type so that the type is easier to refer to. Say we did the following:

``` {haskell}
    type IntList = [Int]
```

2. newtype keyword

The `newtype` keyword is for taking existing types and wrapping them in new types, mostly so that it's easier to make them instances of certain type classes. When we use newtype to wrap an existing type, the type that we get is *separate from the original type*. If we make the following newtype:

``` {haskell}
newtype CharList = CharList { getCharList :: [Char] }
```

*Note*: We cannot use `++` to put together a `CharList` and a list of type `[Char]`.  We cannot use `++` to put together a `CharList` and a `CharList`, either.

``` {haskell}
ghci> CharList "abc" ++ "abc

<interactive>:353:1: error:
    ? Couldn't match expected type ‘[Char]’ with actual type ‘CharList’
    ? In the first argument of ‘(++)’, namely ‘CharList "abc"’
      In the expression: CharList "abc" ++ "abc"
      In an equation for ‘it’: it = CharList "abc" ++ "abc"

ghci> CharList "abc" ++ CharList "abc"
```

3. data keyword

The `data` keyword is for making your own data types and with them, you can *go hog wild*.
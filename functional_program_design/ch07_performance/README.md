# Performance

## Memory Usage Control

We take `sum` as example, defined as `sum = foldl (+) 0`, when we apply `sum [1..1000]`, the process would be:

```{math}
  sum [1..1000]
= foldl (+) 0 [1..1000]
= foldl (+) (0+1) [2.1000]
= foldl (+) ((0+1)+2) [3.1000]
= ...
= foldl (+) (...((0+1)+2)+ ... +1000) []
= (...((0+1)+2)+ ... + 1000)
= ...
= 500500
```

Before calculation, haskell would first construct the whole expression, which cost a lot of memory.  A better solution consists both lazy and direct evaluation, just like this:

```{math}
  sum [1..1000]
= foldl (+) 0 [1..1000]
= foldl (+) (0+1) [2.1000]
= foldl (+) 1 [2.1000]
= foldl (+) (1+2) [3.1000]
= foldl (+) 3 [3.1000]
= ...
= foldl (+) 500500 []
= 500500
```

Then we introduce `seq :: a -> b -> b`, which will first evaluate `x`, and then evaluate `y`.

`foldl'` is another version for `foldl`.  `foldl'` is implemented with `seq`:

```{haskell}
foldl' :: (b->a->b) -> b -> [a] -> b
foldl' f e []       = e
foldl' f e (x:xs)   = y `seq` foldl' f y xs
                      where y = f e x
```

`foldl` and `foldl'` will have the same behavior if `f` is strict.

## References

1. [Foldr Foldl Foldl'](https://wiki.haskell.org/Foldr_Foldl_Foldl')
2. `seq`

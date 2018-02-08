# 2.1 Functions, epimorphisms

## Sets and Types

1. Empty set -> Void

```{haskell}
    absurd:: Void -> a
    id: Void -> Void
```

2. One element set -> Unit

```{haskell}
-- type is (), element is (), always true (in logic)
-- ()::()
unit:: a -> ()
one:: () -> Int
two:: () -> Int
```

## Definitions

1. Injective (单射):  define `f::x->y`

$$\forall x_{1}, x_{2} \in X, x_{1} != x_{2}
\implies f(x_{1}) != f(x_{2})$$

2. Surjective (满射): define `f::x->y`

$$\forall y \in codomain, \implies \exists x, y = f(x)$$
    
In Greek, we call `Injective` as `monomorphism`/`monic`, call `Surjective` as `epimorphism`/`epic`.

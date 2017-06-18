-- Thinking Functionally with Haskell
-- Natural Numbers
--

data Nat = Zero | Succ Nat

instance Eq Nat where
    Zero == Zero       = True
    Zero == Succ n     = False
    Succ m == Zero     = False
    Succ m == Succ n   = (m == n)

instance Show Nat where
    show Zero          = "Zero"
    show (Succ Zero)   = "Succ Zero"
    show (Succ (Succ n)) = "Succ (" ++ show (Succ n)  ++ ")"

instance Num Nat where
    m + Zero         = m
    m + Succ n       = Succ (m + n)
    
    m * Zero         = Zero
    m * (Succ n)     = m * n + m
    
    abs n            = n
    signum Zero      = Zero
    signum (Succ n)  = Succ Zero
   
    m - Zero         = m
    Zero - Succ n    = Zero
    Succ m - Succ n  = m - n

    fromInteger x
      | x <= 0 = Zero
      | otherwise = Succ (fromInteger (x-1))

instance Ord Nat where
    Zero > n         = False
    Succ m > Zero    = True
    Succ m > Succ n  = m > n    

    m < Zero        = False
    Zero < Succ n    = True 
    Succ m < Succ n  = m < n
    
    Zero `compare` Zero   = EQ
    Zero `compare` Succ n = LT
    Succ m `compare` Zero = GT
    Succ m `compare` Succ n = (m `compare` n)

    max Zero n       = n
    max m Zero       = m
    max (Succ m) (Succ n) = Succ (max m n)
    
    min Zero n       = Zero
    min m Zero       = Zero
    min (Succ m) (Succ n) = Succ (min m n)
 
infinity :: Nat
infinity = Succ infinity 

mydivMod :: Nat -> Nat -> (Nat, Nat)
mydivMod m Zero = (infinity, Zero)
mydivMod Zero m = (Zero, Zero)
mydivMod m n = if m < n then (Zero, m)
               else if m == n then (Succ Zero, Zero)
               else  until (\(x, y) -> y < n) (\(x, y) -> (Succ x, y-n)) (0, m)


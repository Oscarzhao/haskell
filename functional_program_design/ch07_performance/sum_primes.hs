-- compare the performance of foo1 and foo2
-- use `:set +s` to enable statistics

-- every time, foo1 would need the same calculation for the same input
-- because primes is binded with the use of foo1, not function foo1
foo1 n = sum (take n primes)
  where
    primes     = [x | x <- [2..], divisors x == [x]]
    divisors x = [d | d <- [2..x], x `mod` d == 0]

-- foo2 : primes would cache results after the first calculation
-- so that later calculation would be quite fast
-- but it cost a lot of memory
-- here primes has no dependency on foo2's input
foo2 n = sum (take n primes)
primes     = [x | x <- [2..], divisors x == [x]]
divisors x = [d | d <- [2..x], x `mod` d == 0]

-- foo3 : primes would cache
-- because primes is independent with foo3's input
foo3 = sum . flip take primes
    where
      primes     = [x | x <- [2..], divisors x == [x]]
      divisors x = [d | d <- [2..x], x `mod` d == 0]

-- test with commands (foo2 would cache primes and divsiors)
-- > foo1 1000
-- > foo1 1000
-- > foo2 1000
-- > foo2 1000
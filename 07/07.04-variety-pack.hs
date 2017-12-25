-- 1.
-- a) What is the type of `k`?
k :: (a, b) -> a
k (x, y) = x

-- b) What is the type of `k2`? Is it the same type as `k1` or `k3`?
k1 :: Integer
k1 = k ((4 - 1), 10)

k2 :: [Char]
k2 = k ("three", (1 + 2))

k3 :: Integer
k3 = k (3, True)
-- c) Of `k1`, `k2`, `k3`, which will return the number 3 as the result?
--
-- Answer:
-- `k1` and `k3`

-----------------------------------------------------------------------------
-- 2.
f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
f (x, y, z) (x', y', z') = ((x, x'), (z, z'))

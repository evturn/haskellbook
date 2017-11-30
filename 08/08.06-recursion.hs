-- 1.
dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
  where
    go n d count
      | n < d     = (count, n)
      | otherwise = go (n - d) d (count + 1)

-- Steps for reducing `dividedBy 15 2` to its final answer:
--
--  15      2  0
-- (15 - 2) 2 (0 + 1)
-- (13 - 2) 2 (1 + 1)
-- (11 - 2) 2 (2 + 1)
-- (9  - 2) 2 (3 + 1)
-- (7  - 2) 2 (4 + 1)
-- (5  - 2) 2 (5 + 1)
-- (3  - 2) 2 (6 + 1)
--  1       2  7
-- (7, 1)

-----------------------------------------------------------------------------
-- 2.
-- Write a function that recursively sums all numbers from 1 to n. If n was
-- 5, you'd add 1 + 2 + 3 + 4 + 5 to get 15.
sumToN :: (Eq a, Num a) => a -> a
sumToN 0 = 0
sumToN n = sumToN (n -1) + n

-----------------------------------------------------------------------------
-- 3.
-- Write a function that multiplies two integral numbers using recursive
-- summation.
mult :: Integral a => a -> a -> a
mult x y
  | x > 0     = y + mult (x - 1) y
  | x < 0     = (negate y) + mult (x + 1) y
  | otherwise = 0

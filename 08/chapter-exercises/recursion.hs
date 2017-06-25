-- 1.
-- Write out the steps for reducing dividedBy 15 2 to its ﬁnal answer according to the Haskell code.

-- 10 / 5 = 2
-- N          (numerator)
--      D     (denominator)
--          Q (quotient)

type Numerator = Integer
type Denominator = Integer
type Quotient = Integer

dividedBy :: Numerator -> Denominator -> Quotient
dividedBy = div

dividedBy' :: Integral a => a -> a -> (a, a)
dividedBy' numerator denominator = go numerator denominator 0
  where go n   d count
         | n < d = (count, n)
         | otherwise = go (n - d) d (count + 1)

-- 2.
-- Write a function that recursively sums all numbers from 1 to `n`,
-- `n` being the argument.
-- So that if `n` was 5,you’d add 1 + 2 + 3 + 4 +5 to get 15.
-- The type should be `(Eq a, Num a) => a -> a`.

sumItUp :: (Eq a, Num a) => a -> a
sumItUp 1 = 1
sumItUp c = go 0 c
  where go acc count
         | count == 0 = acc
         | otherwise = go (acc + count) (count - 1)


-- 3.
-- Write a function that multiplies two integral numbers using recursive summation.
-- The type should be `(Integral a) => a -> a -> a`.

multiplicity :: (Integral a) => a -> a -> a
multiplicity x y
  | x > 0 = y + multiplicity (x - 1) y
  | x < 0 = (negate y) + multiplicity (x + 1) y
  | otherwise = 0
module Practice where

fibonacci :: Integral a => a -> a
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci x = fibonacci (x - 1) + fibonacci (x - 2)


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

-- A common Haskell idiom called a `go` function defines a function via a `where`-clause
-- It can accept more arguments than the top-level function `dividedBy'` does.

-- The top-level function, `dividedBy'` takes two arguments, `numerator` and `denominator`
-- But a third argument is needed in order to keep track of how many times we do the subtraction.

-- That argument is called `count` and is defined starting at 0
-- Then incremented by 1 every time the `otherwise` case is invoked.

-- The `go` function has two branches.
-- When the `numerator` is less than `denominator` recursion stops.
-- The result is a tuple of `count` and the last value for `n`.

-- The result from `count` is the quotient
-- The second value in the tuple would be the remainder.


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

-- Write a function that multiplies two integral numbers using recursive summation.
-- The type should be `(Integral a) => a -> a -> a`.

multiplicity :: (Integral a) => a -> a -> a
multiplicity x y
  | x > 0 = y + multiplicity (x - 1) y
  | x < 0 = (negate y) + multiplicity (x + 1) y
  | otherwise = 0

data DividedResult =
    Result Integer
  | DividedByZero

mc91 :: (Ord a, Num a) => a -> a
mc91 x = go x
  where go x
         | x > 100   = x - 10
         | otherwise = 91
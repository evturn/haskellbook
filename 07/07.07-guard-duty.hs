-- 1.
avgGrade :: (Fractional a, Ord a) => a -> Char
avgGrade x
    | y >= 0.9  = 'A'
    | y >= 0.8  = 'B'
    | y >= 0.7  = 'C'
    | y >= 0.59 = 'D'
    | otherwise = 'F'
    where
      y = x / 100

-----------------------------------------------------------------------------
-- 2.
avgGrade' :: (Fractional a, Ord a) => a -> Char
avgGrade' x
    | y >= 0.7  = 'C'
    | y >= 0.9  = 'A'
    | y >= 0.8  = 'B'
    | y >= 0.59 = 'D'
    | otherwise = 'F'
    where
      y = x / 100
-- Answer:
-- Matches every argument above 0.7.

-----------------------------------------------------------------------------
-- 3.
pal :: Eq a => [a] -> Bool
pal xs
    | xs == reverse xs = True
    | otherwise        = False
-- Answer:
-- b) `True` when `xs` is a palindrome

-----------------------------------------------------------------------------
-- 4.
-- What types of arguments can `pal` take?
--
-- Answer:
-- a list of a type that is an instance of the `Eq` type class.

-----------------------------------------------------------------------------
-- 5.
-- What is the type of the function `pal`?
--
-- Answer:
-- Eq a => [a] -> Bool

-----------------------------------------------------------------------------
-- 6.
numbers :: (Ord a, Num a, Num b) => a -> b
numbers x
    | x < 0  = -1
    | x == 0 = 0
    | x > 0  = 1
-- Answer:
-- c) an indication of whether its argument is a positive or negative number
--    or zero

-----------------------------------------------------------------------------
-- 7.
-- What types of arguments can `numbers` take?
--
-- Answer:
-- any type that is an instance of the `Num` and `Ord` type class.

-----------------------------------------------------------------------------
-- 8.
-- What is the type of the function `numbers`?
--
-- Answer:
-- (Ord a, Num a, Num b) => a -> b

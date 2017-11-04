-- Rewrite the following functions using folds so that it is point-free.
--
-- 1.
-- `myOr` return `True` if any `Bool` in the list is `True`.
myOr :: [Bool] -> Bool
myOr = foldr (||) False

-- 2.
-- `myAny` returns `True` if `a -> Bool` applied to any of the values in
-- the list returns `True`.
myAny :: (a -> Bool) -> [a] -> Bool
myAny f xs = foldr (||) False $ fmap f xs

-- 3.
-- Write two versions of `myElem`. One version should use folding and the
-- other should use `any`.
myElem :: Eq a => a -> [a] -> Bool
myElem x = foldr (\a b -> b || x == a) False

myElem' :: Eq a => a -> [a] -> Bool
myElem' x = any (==x)

-- 4.
-- Implement `myReverse`.
myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []

-- 5.
-- Write `myMap` in terms of `foldr`.
myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr (\a b -> f a : b) []

-- 6.
-- Write `myFilter` in terms of `foldr`.
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter = go
  where
    go f = foldr (\a b -> if f a then a : b else b) []

-- 7.
-- `squish` flattens a list of lists into a list.
squish :: [[a]] -> [a]
squish = foldr (++) []

-- 8.
-- `squishMap` maps a function over a list an concatenates the results.
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f = foldr (\a b -> f a ++ b) []

-- 9.
-- `squishAgain` flattens a list of lists into a list. Re-use `squishMap`.
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

-- 10.
-- `myMaximum` takes a comparison function and a list and returns the
-- greatest element of the list based on the last value that the comparison
-- returned `GT` for.
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy = go
  where
    go f xs = foldr (\a b -> if f a b == GT then a else b) (head xs) (tail xs)

-- 11.
-- `myMinimum` takes a comparison function and a ist and returns the least
-- element of the list based on the last value that the comparison returned
-- `LT` for.
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy = go
  where
    go f xs = foldr (\a b -> if f a b == LT then a else b) (head xs) (tail xs)

-- 1.
myOrd :: [Bool] -> Bool
myOrd []     = False
myOrd (x:xs) = x || myOrd xs

-----------------------------------------------------------------------------
-- 2.
myAny :: (a -> Bool) -> [a] -> Bool
myAny _ []     = False
myAny f (x:xs) = f x || myAny f xs

-----------------------------------------------------------------------------
-- 3.
myElem :: Eq a => a -> [a] -> Bool
myElem _ []     = False
myElem w (x:xs) = (w == x) || myElem w xs

myElem' :: Eq a => a -> [a] -> Bool
myElem' w xs = any (\x -> w == x) xs

-----------------------------------------------------------------------------
-- 4.
myReverse :: [a] -> [a]
myReverse []     = []
myReverse (x:xs) = myReverse xs ++ [x]

-----------------------------------------------------------------------------
-- 5.
squish :: [[a]] -> [a]
squish [x]    = x
squish (x:xs) = x ++ squish xs

-----------------------------------------------------------------------------
-- 6.
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ []     = []
squishMap f (x:xs) = f x ++ squishMap f xs

-----------------------------------------------------------------------------
-- 7.
squishAgain :: [[a]] -> [a]
squishAgain xs = squishMap id xs

-----------------------------------------------------------------------------
-- 8.
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ (x:[]) = x
myMaximumBy f (x:xs)
    | f x go == GT = x
    | otherwise    = go
  where
    go = myMaximumBy f xs

-----------------------------------------------------------------------------
-- 9.
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ (x:[]) = x
myMinimumBy f (x:xs)
    | f x go == LT = x
    | otherwise    = go
  where
    go = myMinimumBy f xs

-----------------------------------------------------------------------------
-- 10.
myMaximum :: (Ord a) => [a] -> a
myMaximum = myMaximumBy compare

myMinimum :: (Ord a) => [a] -> a
myMinimum = myMinimumBy compare

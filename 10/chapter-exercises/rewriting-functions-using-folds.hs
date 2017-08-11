import Data.Bool

-- 1.
myOr :: [Bool] -> Bool
myOr xs = foldr (||) False xs

-- 2.
myAny :: (a -> Bool) -> [a] -> Bool
myAny f xs = foldr (||) False (map f xs)

-- 3.
myElem :: Eq a => a -> [a] -> Bool
myElem n xs = foldr (||) False (fmap (== n) xs)

myElem' n xs = myAny (== n) xs

-- 4.
myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []

-- 5.
myMap :: (a -> b) [a] -> [b]
myMap f xs = foldr ((:) . f) [] xs

-- 6.
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f xs = foldr (\x -> bool ((++) []) ((:) x) (f x)) [] xs

-- 7.
squish :: [[a]] -> [a]
squish xs = foldr (++) [] xs

-- 8.
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f xs = foldr ((++) . (map f)) [] xs

-- 9.
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

-- 10.
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy xs = foldr (\x y -> bool x y (x < y)) 0 xs

-- 11.
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy xs = foldl1 (\x y -> bool x y (x > y)) xs

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

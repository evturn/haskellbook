import Data.Bool
import Data.List

twoPipes :: [Bool] -> Bool
twoPipes [] = False
twoPipes (x:xs) = if x == True then True else twoPipes xs

any' :: (a -> Bool) -> [a] -> Bool
any' _ [] = False
any' f xs = (\x -> bool x (any' f (tail xs)) (x /= True)) $ f $ head xs

elem' :: Eq a => a -> [a] -> Bool
elem' _ [] = False
elem' a xs = if a == head xs then True else elem' a $ tail xs

anyElem a xs = any' (\x -> x == a) xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' xs = last xs : [] ++ reverse' (init xs)

squish :: [[a]] -> [a]
squish []       = []
squish (xs:xxs) = [x | x <- xs] ++ squish xxs

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ []     = []
squishMap f (x:xs) = f x ++ squishMap f xs

squishAgain :: [[a]] -> [a]
squishAgain [] = []
squishAgain xxs = squishMap (\x -> x : []) (squish xxs)

maximumBy' :: (a -> a -> Ordering) -> [a] -> a
maximumBy' f (x:[]) = x
maximumBy' f (x:xs) = if (f x (maximumBy' f xs)) == GT then x else (maximumBy' f xs)

minimumBy' :: (a -> a -> Ordering) -> [a] -> a
minimumBy' f (x:[]) = x
minimumBy' f (x:xs) = if (f x (minimumBy' f xs)) == LT then x else (minimumBy' f xs)

maximum' :: (Ord a) => [a] -> a
maximum' xs = maximumBy' compare xs

minimum' :: (Ord a) => [a] -> a
minimum' xs = minimumBy' compare xs
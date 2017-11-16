import Data.Bool
import Data.Foldable
import Data.Monoid

-- 1.
sum' :: (Foldable t, Num a) => t a -> a
sum' = getSum . foldMap Sum

-- 2.
product' :: (Foldable t, Num a) => t a -> a
product' = getProduct . foldMap Product

-- 3.
elem' :: (Foldable t, Eq a) => a -> t a -> Bool
elem' n xs = getAny $ foldMap (Any . (n ==)) xs

-- 4.
-- https://hackage.haskell.org/package/base-4.10.0.0/docs/src/Data.Functor.Utils.html
newtype Max a = Max {getMax :: Maybe a} deriving (Eq, Show)
newtype Min a = Min {getMin :: Maybe a} deriving (Eq, Show)

instance Ord a => Monoid (Max a) where
  mempty              = Max Nothing
  m `mappend` Max Nothing    = m
  Max Nothing `mappend` n    = n
  (Max m) `mappend` (Max n) = Max (max m n)

instance Ord a => Monoid (Min a) where
  mempty              = Min Nothing
  m `mappend` Min Nothing    = m
  Min Nothing `mappend` n    = n
  (Min m) `mappend` (Min n) = Min (min m n)

minimum' :: (Foldable t, Ord a) => t a -> Maybe a
minimum' xs = getMin $ foldMap (Min . Just) xs

-- 5.
maximum' :: (Foldable t, Ord a) => t a -> Maybe a
maximum' xs = getMax $ foldMap (Max . Just) xs

-- 6.
null' :: (Foldable t) => t a -> Bool
null' = foldr (\_ _ -> False) True

-- 7.
length' :: (Foldable t) => t a -> Int
length' = foldr (\_ y -> y + 1) 0

-- 8.
toList' :: (Foldable t) => t a -> [a]
toList' = foldr (:) []

-- 9.
fold' :: (Foldable t, Monoid m) => t m -> m
fold' = foldMap id

-- 10.
foldMap' :: (Foldable t, Monoid m) => (a -> m) -> t a -> m
foldMap' f = foldr ((<>) . f) mempty

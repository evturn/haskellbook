{-# LANGUAGE FlexibleInstances #-}

class TooMany a where
  tooMany :: a -> Bool

newtype Pair = Pair (Int, String) deriving Show

instance TooMany Pair where
  tooMany (Pair (n, _)) = n > 42

newtype TwoInts = TwoInts (Int, Int) deriving Show

instance TooMany TwoInts where
  tooMany (TwoInts (x, y)) = (x + y)  > 42

instance (Num a, Ord a) => TooMany (a, a) where
  tooMany (x, b) = (x * b) > 42
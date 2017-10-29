{-# LANGUAGE GeneralizedNewtypeDeriving, FlexibleInstances #-}

class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 42

newtype Goats = Goats Int deriving (Eq, Show, TooMany)
newtype Cows  = Cows Int deriving (Eq, Show)

tooManyGoats :: Goats -> Bool
tooManyGoats (Goats n) = n > 42

-- 1.
-- Write an instance for the type `(Int, String)` using the `TooMany` 
-- typeclass.
data IntString = IntString (Int, String) deriving (Eq, Show)

instance TooMany IntString where
  tooMany (IntString (n, _)) = tooMany n

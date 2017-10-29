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

-- 2.
-- Write another `TooMany` instance for (Int, Int) and summ the values
-- together under the assumption this is a count of goats from two fields.
data IntInt = IntInt (Int, Int) deriving (Eq, Show)

instance TooMany IntInt where
  tooMany (IntInt (n, n')) = tooMany (n + n')

-- 3.
-- Write another `TooMany` instance for (Num a, TooMany a) => (a, a).
data NumTooMany = NumTooMany IntInt deriving (Eq, Show)

instance TooMany NumTooMany where
  tooMany (NumTooMany (IntInt (n, n'))) = tooMany (n * n')

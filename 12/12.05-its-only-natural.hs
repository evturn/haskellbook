-- Convert naturals into integers and integers into naturals.
data Nat = Zero
         | Succ Nat
         deriving (Eq, Show)

natToInteger :: Nat -> Integer
natToInteger Zero     = 0
natToInteger (Succ x) = 1 + natToInteger x

integerToNat :: Integer -> Maybe Nat
integerToNat n 
    | n < 0     = Nothing
    | otherwise = Just $ doIt n
  where
    doIt 0 = Zero
    doIt n = Succ $ doIt (n - 1)
